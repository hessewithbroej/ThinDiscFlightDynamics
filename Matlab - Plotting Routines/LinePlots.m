%Compare experimental recordings of seed flight to simulation data

new_csv = readtable("C:\Users\hesse\Desktop\Code\ThinDiscFlightDynamics\Data\SimulationData\SeedSimVsExp.csv");


figure
hold on
plot(new_csv.Exp_X_m,new_csv.Exp_Y_m,'g-.','LineWidth',1.5)
plot(new_csv.Sim_X_m,new_csv.Sim_Y_m,'b--','LineWidth',1.5)


axis equal
xlabel("X (m)", 'Interpreter','latex','FontSize',16)
ylabel("Y (m)",'Interpreter','latex','FontSize',16)
xlim([0,.6])
ylim([0,.5])

legend(["Experimental", "Simulation"])

%% Range vs phi, standard

filepath = "C:\Users\hesse\Desktop\Code\ThinDiscFlightDynamics\Data\SimulationData\SeedTrajectories.xlsx";

%read in the data
trajs = {};
opt=detectImportOptions(filepath);
shts=sheetnames(filepath);
for i=2:numel(shts)
  traj = readmatrix(filepath,'Sheet',shts(i),'Range','A2:F1002');
  trajs{i-1} = traj;
end
%% 

figure
hold on
rngs = [];
%plot the trajectory from launch until the first instance where the seed's
%y coordinate goes negative (aka seed has reached the ground)
for i =9:numel(trajs)+8
    gndrow = find(trajs{mod(i-1,36)+1}(:,3) <= 0, 1); %find when seed hits ground
    rngs = [rngs, sqrt( trajs{mod(i-1,36)+1}(gndrow,2)^2 + trajs{mod(i-1,36)+1}(gndrow,3)^2 + trajs{mod(i-1,36)+1}(gndrow,4)^2 )];
end

rngs(end+1) = rngs(1);
plot(90:10:450,rngs, 'LineWidth', 1.5)
plot([90,90],[0,10],'k:')
plot([180,180],[0,10],'k:')
plot([270,270],[0,10],'k:')
plot([360,360],[0,10],'k:')
plot([450,450],[0,10],'k:')
xlim([85,455])
ylim([0,10])
