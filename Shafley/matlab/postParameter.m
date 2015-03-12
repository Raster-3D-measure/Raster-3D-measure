function postParameter()
    p = 1;
    i = 2;
    %按值传递参数
    parameterByValue(p);
    disp('     p');
    disp(p);
    %按引用传递参数
    R = parameterByReference(p);
    disp('     R');
    disp(R);
    %按引用多参数传递单参数返回
    S = MultiParameterSingleReturnByReference(p,i);
    disp('     S');
    disp(S);
    %按引用多参数传递多返回
    [R1,R2] = MultiParameterByReference(p,i);
    disp('     R1    R2');
    disp([R1,R2]);
end

function parameterByValue(p)
    p = 2 * p;
    disp('     p');
    disp(p);
end

function p = parameterByReference(p)
    p = 2 * p;
    disp('     p');
    disp(p);
end

function g = MultiParameterSingleReturnByReference(p,i)
    p = 2 * p;
    i = 2 * i;
    g = p + i + 1;
    disp('     p     i');
    disp([p, i]);
end

function [p,i] = MultiParameterByReference(p,i)
    p = 2 * p;
    i = 2 * i;
    disp('     p     i');
    disp([p, i]);
end