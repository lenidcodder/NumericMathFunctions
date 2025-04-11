function result = secant_method(eps, x0, x1, func)
% Secant method with precision eps
    result = NaN;
    if ~simple_arg_check(x0, x1, func)
        return
    end

    % Initial func values
    f0 = func(x0);
    f1 = func(x1);

    % Table to store values
    iterations = [];
    i = 1;

    % Main loop
    while abs(x1 - x0) > eps
        if f1 - f0 == 0
            fprintf('Zero division error at iteration %d\n', i);
            return;
        end
        x2 = x1 - ((x1 - x0) * f1) / (f1 - f0);
        f2 = func(x2);

        % Store values
        iterations = [iterations; i, x0, x1, x2, abs(x1 - x0)];

        
        if f2 == 0
            break;
        end

        % Prepare next iteration
        x0 = x1;
        f0 = f1;
        x1 = x2;
        f1 = f2;
        i = i + 1;
    end

    % Final result
    result = x2;
    T = array2table(iterations, ...
        'VariableNames', {'i', 'x0', 'x1', 'x2', 'err'});
    disp(T);

    fprintf('Root approximated at: %.6f after %d iterations.\n', result, i-1);
    fprintf('Final error value: %.10f\n', abs(x1 - x0));
end