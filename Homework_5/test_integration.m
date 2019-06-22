%Nathan Baledio
%ID: 1574353
%Integration Test

function [em,et,es] = test_integration()
    a = -3;
    b = 1;
    IRef = 1.6851344770476;
    x = linspace(2,100,99);
    func = @(x) (1./(1+x.^2)).*cos(3./2.*exp(-x.^2))-((x.^3)./30);
    et = [];
    es = [];
    em = [];
    %Solves using midpoint rule
    for i = 2:100
        em = [em,abs(IRef - int_midpoint_rule(func,a,b,i))];
    end 
    %Solves using trapezoidal rule
    for i = 2:100
        et = [et,abs(IRef - int_trapezoidal_rule(func,a,b,i))];
    end
    %Solves using simpson's rule
    for i = 2:100
        es = [es,abs(IRef - int_Simpson_rule(func,a,b,i))];
    end
    %Plots function from -5,5
    figure(1)
    x2 = linspace(-5,5,1000);
    y2 = func(x2);
    plot(x2,y2);
    clf;
    grid on;
    plot(x2,y2);
    %Plots Error vs N
    figure(2);
    grid on;
    clf;
    loglog(x,em,'-b');
    hold on
    loglog(x,et,'-r');
    loglog(x,es,'color',[0.9100    0.4100    0.1700]);
end

