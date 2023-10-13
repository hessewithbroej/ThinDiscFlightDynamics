# ThinDiscFlightDynamics
Repository containing all codes used in the development of _Thin Disc Flight Dynamics with Applications to Ballochore Seed Dispersal_
Contact jlha2018@mymail.pomona.edu with questions

Simulation codes are all written in Mathematica and contained the in the Mathematica folder.

full5_drag_lift_g.m is a Mathematica notebook that contains the derived equation of motion for the thin disc, the numerical solver, and several plots and visualizations of disc motion and relevant forces. It is useful to simulate single flights to build familiarity with the motion of the disc and how the various initial conditions and disc parameters influence the flight trajectory of the disc. This script is a useful first-stop for developing an understanding of the implementation of the simulation, as well as for building intuition for the motion of discs in 3d space. We encourage users to simulate the flight of a drink coaster using the provided constants in the beginning of the file, then to watch the animation of the flight dynamics at the bottom of the file, then finally throw a real coaster under the same conditions that were simulated to convince themselves of the fidelity of this equation of motion.

functional_solver.m is a Mathematica notebook that contains a functionized form of the equation and solver, allowing one to use the Table[] command to simulate batches of flights under varied initial conditions. It is most useful to generate large amounts of flight data to map out the parameter space of initial launch conditions. This script is ultimately what was used to generate the wealth of simulation data presented in the _Backspin in Ruellia... conditions_ manuscript. It is here where researchers interested in extending this work to other disc-throwing ballochores will find the most utility. The morphological constants of seeds can be updated in the beginning of the file, and the desired ranges of launch conditions can be adjusted as desired to simulate seed dispersal in different species (such as the tropical tree _Hura crepitans_) and develop a more broad understanding of seed dispersal strategies in these species.

* * * 

All plots and charts presented in _Backspin in Ruellia ... conditions_ were generated using the MATLAB scripts and functions contained within the MATLAB folder.

trajectory_plots.m creates the 3d trajectory plots of _Ruellia ciliatiflora_ seeds using the trajectory and orientation data contained in "Data/SimulationData/SeedTrajectries.csv".
 
contour_generation_seed_data.m creates the various contours of dispersal distances under varied initial conditions. This script parses the file "Data/SimulationData/SeedData.csv" to extract specific sets of data, then passes them to the create_contour.m function, which generates the plots.

create_contour.m is a function that generates the contour plots based on the provided data. It provides a standardized method of creating the contours provided in the manuscript. Interested readers can modify contour_generation_seed_data to extract data (and pass it to create_contour.m) in order to generate contours of dispersal range as a function of any of the five simulated launch parameters (for example, contouring dispersal range as a function of launch height and launch angle)