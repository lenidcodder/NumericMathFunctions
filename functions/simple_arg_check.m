function isLegal = simple_arg_check(a, b, func)
% Checks if interval is legal
    isLegal = true;
    if b <= a
        isLegal = false;
        disp('b must be bigger!');
    end
    
    if func(a) * func(b) > 0
        isLegal = false;
        disp('Wrong interval!')
    end
    
    if func(a) == 0
        isLegal = false;
        disp('a is solution');
    end
    
    if func (b) == 0
        isLegal = false;
        disp('b is solution');
    end

end

