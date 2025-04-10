function result = bisection(eps, a, b, func)
    % Bisekction method with precision e
    result = NaN;
    if simple_arg_check(a, b, func) == false
        return
    end
    
    i = 0;
    tableData = [];

    % Main loop
    while (abs(b-a) >= 2 * eps)
        c = (a + b) / 2;
        fc = func(c);
        tableData(end+1, :) = [i, a, b, c, fc];

        if fc == 0
            break;
        end

        if func(a) * fc < 0
            b = c;
        else
            a = c;
        end

        i = i + 1;
    end

    result = (a + b) / 2;
    finalErr = (b - a) / 2;

    % Create and display table
    T = array2table(tableData, ...
        'VariableNames', {'Iter', 'a', 'b', 'c', 'f_c'});
    
    disp(T);

    % Show result
    disp(['Approximate value: ', num2str(result)])
    disp(['Error: ', num2str(finalErr)])
end