% s = 1;

function aligninfo(Folderpath,Datafolder_dir,Artcorrfolder, Artcorrfolder_dir, ...
    Hypnofolder, Hypnofolder_dir, Timefile, Savefolder,s)

subfoldername = Datafolder_dir(s).name;
files = dir([Folderpath,filesep,subfoldername,'/AF*.edf']);

    for f = 1:size(files)
        
        disp(files(f).name);

        [hdr data] = edfread2([Folderpath,filesep,subfoldername,filesep,files(f).name]);
        fs = hdr.samples(1);
        epochlength = 30;
        nepochs = floor(size(data,2)/(fs*epochlength));
        
        hypnofile_dir = dir([Hypnofolder,filesep,subfoldername,filesep,files(f).name(1:18),'*.txt']);
        hypnofile = [Hypnofolder,filesep,subfoldername,filesep,hypnofile_dir(1).name];
        
        hypno = [];
        fid1 = fopen(hypnofile);
        tline = 'X';
        while ischar(tline)
              tline = fgetl(fid1);
              hypno = [hypno tline];
        end
        fclose(fid1);

        
        sub = files(f).name(10:12);
        cond = files(f).name(15);
        artcorrmatfile = [Artcorrfolder,'/S',sub,cond,'.mat'];
        load(artcorrmatfile);
        
        if files(f).name(16) == 'B'
           n = 1;             
        elseif files(f).name(16) == 'E' | files(f).name(16) == 'R'
           n =  str2num(files(f).name(18))+1;
        else
           error('Wrong filename');
        end
        
        artifacts = S(n).sub.artifacts;
        stages = S(n).sub.stages;
        mathdr = S(n).sub.hdr;

%         stages(find(stages == 'U'))= '?';  
%         stages(find(stages == 'A'))= 'W'; 
%         hypno(find(hypno == 'U'))= '?';  
%         hypno(find(hypno == 'A'))= 'W';
%         
%         hypno = deblank(hypno);

%         if nepochs ~= length(hypno)
%            error('Datafile length does not fit to hypno file length');                   
%         end

%         if ~isequal(stages(1:length(stages))',hypno(1:length(stages)))
%             error('Sleep stages from artefact .mat file do not fit with sleep stages from Hypnogram .txt file');
%         end

            if files(f).name(15) == 'E' 
                night = n;
            elseif files(f).name(15) == 'R'
                night = n + 9;
            end
 
            [Subject Subject] = xlsread(Timefile,'Sheet1','A2:A649');
            Condition = xlsread(Timefile,'Sheet1','B2:B649');
            SleepPeriod = xlsread(Timefile,'Sheet1','C2:C649');
            RecordStartTime = xlsread(Timefile,'Sheet1','E2:E649');
            RecordStartTime = datestr(RecordStartTime,'HH:MM:SS');
            
            StartTime_edf = hdr.starttime;
            StartTime_edf = [StartTime_edf(1:2),':',StartTime_edf(4:5),':',StartTime_edf(7:8)]; % Recording start time
            ndx_sub = find(strcmp(Subject,['af',files(f).name(9:12)]) == 1);
            ndx_night = find(SleepPeriod == night);
            ndx_SleepTime = intersect(ndx_sub, ndx_night);
            RecordStartTime_file = RecordStartTime(ndx_SleepTime,:); % Scoring start time
        
            if datenum(RecordStartTime_file) < datenum(StartTime_edf) % if scoring starts earlier than recording
                diff = datetime(StartTime_edf) - datetime(RecordStartTime_file); % calculate time difference
                aligninfo.diff_sec = seconds(diff);
                
                aligninfo.newscoring_startep = ceil(aligninfo.diff_sec/epochlength)+1; % start at next scoring epoch
                aligninfo.newdatascoring_start = ((ceil(aligninfo.diff_sec/epochlength))*epochlength-aligninfo.diff_sec)*fs+1; % sample in data at which hypnoep_start epoch starts
                aligninfo.newstarttime = datestr(datetime(RecordStartTime_file) + seconds(ceil(aligninfo.diff_sec/epochlength)*epochlength));
                aligninfo.newstarttime = aligninfo.newstarttime(end-7:end);

            elseif datenum(RecordStartTime_file) >= datenum(StartTime_edf) % if recording starts earlier than scoring
                diff = datetime(RecordStartTime_file) - datetime(StartTime_edf); % calculate time difference
                aligninfo.diff_sec = seconds(diff);
               
                aligninfo.newscoring_startep = 1; % start at 1st scoring epoch
                aligninfo.newdatascoring_start = aligninfo.diff_sec*fs+1; % sample in data at which hypnoep_start epoch starts
                aligninfo.newstarttime = datestr(datetime(RecordStartTime_file));
                aligninfo.newstarttime = aligninfo.newstarttime(end-7:end);
                
            end
            
%             if aligninfo.diff_sec > 30
%                warning('Difference between scoring start and data file more than 1 epoch')
%             end
            
            aligninfo.datastarttime = StartTime_edf; 
            aligninfo.scoringstarttime = RecordStartTime_file; 

        
        save([Savefolder,filesep,files(f).name(1:end-4),'_aligninfo.mat'],'aligninfo','hypno','stages','artifacts');
        
        clear aligninfo StartTime_edf RecordStartTime_file hypno stages

    end   
    
    
end