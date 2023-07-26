# ThinDiscFlightDynamics
Repository containing all codes used in the development of _Thin Disc Flight Dynamics with Applications to Ballochore Seed Dispersal_
Contact jlha2018@mymail.pomona.edu with questions

full5_drag_lift_g.m is a Mathematica notebook that contains the derived equation of motion for the thin disc, the numerical solver, and several plots and visualizations of disc motion and relevant forces. It is useful to simulate single flights to build familiarity with the motion of the disc and how the various initial conditions and disc parameters influence the flight trajectory of the disc.

functional_solver.m is a Mathematica notebook that contains a functionized form of the equation and solver, allowing one to use the Table[] command to simulate batches of flights under varied initial conditions. It is most useful to generate large amounts of flight data to map out the parameter space of initial launch conditions.

