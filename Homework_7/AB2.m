%Nathan Baledio
%ID:1574354
%Adams-Bashforth 2 Method

function [y,t] = AB2(fun,y0,NSTEPS,DT,IOSTEP)
    SNAPS = floor(NSTEPS/IOSTEP)+1;
    y = [];
    t = [0];
    y = [y0]; % Initial condition
    %Heun method
    tcurr = DT;
    tprev = 0;
    u = y0 + DT/2*(fun(y0,0)+fun(y0 + DT*fun(y0,0),tcurr));
    uprev = y0;
    tprev = tcurr;
    tcurr = tcurr + DT;
    %Adams-Bashforth
    for n = 2:SNAPS
        u_next = u + (DT/2)*(3*fun(u,tcurr)-fun(uprev,tprev)); 
        if mod(n,IOSTEP) == 0
            t = [t,tcurr];
            y = [y,u_next];
        end
        uprev = u;
        u = u_next;
        tprev = tcurr;
        tcurr = tcurr + DT;
    end    
end

