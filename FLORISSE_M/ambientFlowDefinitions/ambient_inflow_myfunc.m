classdef ambient_inflow_myfunc < ambient_inflow_interface
    %AMBIENT_INFLOW_LOG Creates an ambientInflow object with a logarithmic
    
    properties
        Vref % Wind velocity
%         Href % Reference height for logarithmic velocity inflow profile
        windDirection % Wind direction in radians
        TI0 % Atmospheric turbulence intensity
        rho % Air density
        myFunc
    end
    
    methods
        % TODO: Use inputParser
        function obj = ambient_inflow_myfunc(FuncString, myFunc, ...
                                             HHString, hubHeight, ...
                                             WDString, windDirection, ...
                                             TIString, TI0)
            %AMBIENT_INFLOW_LOG Construct an instance of this class
            obj.windDirection = windDirection;
            obj.TI0    = TI0;
            obj.rho    = 1.1716;
            obj.myFunc = myFunc;
            obj.Vref   = myFunc(hubHeight);
        end
        
        function V = Vfun(obj, Z)
%             VFUN describes the inflow velocity profile
            V = reshape(obj.myFunc(Z(:)),size(Z));
        end
    end
end