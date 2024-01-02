% generates the various contour plots included in the manuscript by
% filtering SeedData in various ways and passing the data to the
% "create_contour.m" function, which generates the figures and allows the
% user to specify titles, axis labels, contour labels, etc

%update filepath to the location of SeedData.csv
new_csv = readtable("C:\Users\hesse\Desktop\Code\ThinDiscFlightDynamics\Data\SimulationData\SeedData.csv");


%% phi-beta contours. Dispersal range as a function of launch orientation phi
% and launch angle beta. Figure 6 in "backspin in Ruellia ... conditions"

%phi-beta contours. omega 500 Hz, h 0.5m, velocity 10 m/s
filtered_o500h5v15 = new_csv(new_csv.Omega_Hz==500 & new_csv.H_m==0.5 & new_csv.V_ms_1==15,:);
x = filtered_o500h5v15(:,["Phi_deg"]).Phi_deg
y = filtered_o500h5v15(:,["Beta_deg"]).Beta_deg
z1 = filtered_o500h5v15(:,["Distance_m"]).Distance_m

create_contour(x,y,z1,"\_", "$\beta$ (deg)", "$\omega$=500 Hz", 1:1:15, 90:45:270, 0:15:65)

%phi-beta contours. omega 1000 Hz, h 0.5m, velocity 10 m/s
filtered_o1000h5v15 = new_csv(new_csv.Omega_Hz==1000 & new_csv.H_m==0.5 & new_csv.V_ms_1==15,:);
x = filtered_o1000h5v15(:,["Phi_deg"]).Phi_deg;
y = filtered_o1000h5v15(:,["Beta_deg"]).Beta_deg;
z1 = filtered_o1000h5v15(:,["Distance_m"]).Distance_m;

create_contour(x,y,z1,"$\phi$ (deg)", "", "$\omega$=1000 Hz", 1:1:15, 90:45:270, 0:15:65)

%phi-beta contours. omega 1500 Hz, h 0.5m, velocity 10 m/s
filtered_o1500h5v15 = new_csv(new_csv.Omega_Hz==1500 & new_csv.H_m==0.5 & new_csv.V_ms_1==15,:);
x = filtered_o1500h5v15(:,["Phi_deg"]).Phi_deg;
y = filtered_o1500h5v15(:,["Beta_deg"]).Beta_deg;
z1 = filtered_o1500h5v15(:,["Distance_m"]).Distance_m;

create_contour(x,y,z1,"\_", "", "$\omega$=1500 Hz", 1:1:15, 90:45:270, 0:15:65)


%% optimal-phi contour. 
% Scans through SeedData and determines the range-maximizing launch
% orientation phi for each unique pair of beta and omega. Used to generate
% Figure 7 in "Backsping in ruellia... conditions"

%fix launch height 0.5m and velocity 10m/s
filtered_h5v10 = new_csv(new_csv.H_m==0.5 & new_csv.V_ms_1==10,:);
betas = unique(filtered_h5v10(:,["Beta_deg"]).Beta_deg);
omegas = unique(filtered_h5v10(:,["Omega_Hz"]).Omega_Hz);

x=[];
y=[];

z = [];
%extract range-maximizing phi for each beta-omega pair
for i=1:numel(betas)

    beta = betas(i);
    for j=1:numel(omegas)

        omega = omegas(j);
        filtered_table = filtered_h5v10(filtered_h5v10.Beta_deg == beta & filtered_h5v10.Omega_Hz == omega,:);
        phis = filtered_table(:, ["Phi_deg"]).Phi_deg;

        %find best phi
        optimal_phi = -1;
        optimal_dist = -1;
        for k=1:numel(phis)
            phi = phis(k);
            if filtered_table(k,:).Distance_m > optimal_dist
                optimal_phi = phi;
                optimal_dist = filtered_table(k,:).Distance_m;
            end
        end


        x(end+1) = beta;
        y(end+1) = omega;
        z(end+1) = optimal_phi;

    end

end
%%

create_contour(y,x,z,"$\omega$ (deg)","$\beta$ (deg)", "Range-Maximizing Launch Orientation $\phi$ (deg)", 90:10:270,000:500:4000, 0:15:65 )




