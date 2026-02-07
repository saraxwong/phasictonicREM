function c = find_night(filename)

        if filename(15) == 'E' && filename(16) == 'B' % extension baseline      
            c = 1 ; 
        elseif filename(16) == 'E' && filename(18) == '1' % SEEN1
            c =  2;
        elseif filename(16) == 'E' && filename(18) == '2' % extension final
            c =  3;   
        elseif filename(16) == 'E' && filename(18) == '3' % SEEN3
            c =  4;
        elseif filename(16) == 'E' && filename(18) == '4' % SEEN4
            c =  5;
        elseif filename(16) == 'E' && filename(18) == '5' % SEEN5
            c =  6;    
        elseif filename(16) == 'E' && filename(18) == '6' % SEEN6
            c =  7;
        elseif filename(16) == 'E' && filename(18) == '7' % SEEN7 (final)
            c =  8; 
        elseif filename(16) == 'E' && filename(18) == '8' % extension recovery
            c =  9;
        elseif filename(15) == 'R' && filename(16) == 'B' % restriction baseline      
            c = 10;
        elseif filename(16) == 'R' && filename(18) == '1' % SRRN1
            c =  11;
        elseif filename(16) == 'R' && filename(18) == '2' % SRNN2
            c =  12;  
        elseif filename(16) == 'R' && filename(18) == '3' % SRRN3
            c =  13; 
        elseif filename(16) == 'R' && filename(18) == '4' % SRRN4
            c =  14;
        elseif filename(16) == 'R' && filename(18) == '5' % SRRN5
            c =  15;
        elseif filename(16) == 'R' && filename(18) == '6' % SRRN6
            c =  16;
        elseif filename(16) == 'R' && filename(18) == '7' % SRRN7 (final)
            c =  17;    
        elseif filename(16) == 'R' && filename(18) == '8' % restriction recovery
            c =  18;
        else
            error('Wrong filename');
        end  
        
end