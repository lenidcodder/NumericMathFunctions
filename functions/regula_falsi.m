function result = regula_falsi(eps, a, b, func)
% Regula Falsi method with precision eps
    result = NaN;
    if simple_arg_check(a, b, func) == false
        return
    end

    % Table to store values
    iterations = [];
    
    % 0 iteration
    fa = func(a);
    fb = func(b);
    c = b - ((b - a) * fb) / (fb - fa);
    fc = func(c);

    i = 0;

    % Main loop
    while (func(c - eps) * func(c + eps) > 0)

        iterations = [iterations; i, a, b, c, fa * fc];

        if fc == 0
            break;
        end

        if fa * fc < 0
            b = c;
            fb = func(b);
        else
            a = c;
            fa = func(a);
        end

        c = b - ((b - a) * fb) / (fb - fa);
        i = i + 1;
    end

    % Final row
    iterations = [iterations; i, a, b, c, fc * fa];

    T = array2table(iterations, ...
        'VariableNames', {'Iter', 'a', 'b', 'c', 'f_a * f_c'});
    disp(T);

    % Final result
    result = c;
    fprintf('Root approximated at: %.6f after %d iterations.\n', result, i);

    % Error
    if size(iterations, 1) > 1
        c_prev = iterations(end-1, 4);
        f_prev = func(c_prev);
        err = abs((fc * (c - c_prev)) / (fc - f_prev));
    else
        err = NaN;
    end
    fprintf('Final maximum possible error is: %.10f\n', err);

end