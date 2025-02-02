function projectStartup
% projectStartup Initialize CubeSat MBSE Model

%  Copyright 2021-2024 The MathWorks, Inc.


% Close model asbCubeSat opened by referenced CubeSat Simulation Project startup
    if bdIsLoaded("asbCubeSat")
        close_system("asbCubeSat");
    end

    % Open Architecture model
    open_system("asbCubeSatArchModel");

    % Initialize visualization control
    d = Simulink.data.connect('asbCubeSatModelData.sldd');
    if ~builtin("license","test","Virtual_Reality_Toolbox")
        if d.get("variantVisualization") == 1
            d.set("variantVisualization") = 0; % Disable SL3D animation
        else
            clear d;
        end
    else
        % Open the animation window
        load_system("asbCubeSatVisualization");
        vrmfunc('FnOpen',getSimulinkBlockHandle("asbCubeSatVisualization/Visualization/Virtual Reality World/VR Sink"));
        clear d;
    end

end
