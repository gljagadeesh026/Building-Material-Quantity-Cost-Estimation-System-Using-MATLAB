clc;
clc;
fprintf('===Building Quantity Survey and Cost Estimation System Using MATLAB===  \n')
fprintf('   ==enter all the values in feets== \n')
fprintf('========================================\n');

length_of_footing= input('Enter length of footing=');
width_of_footing= input('Enter the width of footing=');
height_of_footing=input('enter the height of footing= ');
thickness_of_pcc_in_footing= input('Enter the thickness of pcc in footing=');
height_of_RCC_in_footing= input('height of rcc in footing=');  % after deducting pcc depth(0.33ft)
no_of_footings= input('Enter the no of footings=');
length_of_column= input('enter the length of column=');
width_of_column= input('enter the width of column=');
height_of_column=input('enter the height of column=');
no_of_column=input('enter the no of column= ');
no_of_floors=input('enter the no of floors=');
length_of_slab= input('enter length of slab=');
width_of_slab= input('enter the width of slab=');
thickness_of_slab= input('enter thickness of slab=');
external_wall_length=input('enter external wall length= ');
internal_wall_length=input('enter internal wall length=');
height_of_wall=input('enter height of wall= ');
depth_of_beam=input('enter depth of beam=');
width_of_beam=input('enter width of beam= ');
width_of_staircase = input('Enter width of staircase = ');
sloping_length_of_staircase = input('Enter sloping length of staircase(first flight(10-18 ft)+second flight(10-18 ft)) = ');
thickness_of_staircase = input('Enter waist slab thickness = ');
length_of_landing=input('enter the length of landing= ');
internal_wall_area = input('Enter internal wall area= ');     % ft^2
ceiling_area       = input('Enter ceiling area= ');      % ft^2
external_wall_area = input('Enter external wall area= ');      % ft^2
thickness_of_flooring=input('enter thickness of flooring(40mm=0.131ft)= ');
plaster_thickness = 12;         % 1000mm=1m
density_of_steel=7850; % kg/m^3
steel_percent_in_slab=0.01;
steel_percent_in_footing=0.008;
steel_percent_in_column=0.06;
steel_percent_in_beam=0.02;
steel_percent_in_staircase=0.015;
cement_part_in_rcc=1/5.5;
sand_part_in_rcc=1.5/5.5;
aggregrate_part_in_rcc=3/5.5;
cement_part_in_pcc=1/7;
sand_part_in_pcc=2/7;
aggregrate_part_in_pcc=4/7;
cement_part_in_plastering= 1/5;
sand_part_in_plastering = 4/5;
cement_part_in_brickwork= 1/5;
sand_part_in_brickwork= 4/5;
cement_part_in_flooring=1/5;
sand_part_in_flooring=4/5;
dry_volume_factor=1.54;
density_of_cement=1440; %units kg/m^3
weight_of_cementbag=50; %50 kgs
width_of_internal_wall=0.375; %in ft
width_of_external_wall=0.75; %in ft
wastage_of_bricks=0.05;   %  5percent wastage is added to total volume
volume_of_brick=0.001539; % 19*9*9=15.39cm^3=0.001539m^3
cost_of_single_cementbag=350; % per bag
cost_of_sand=500; %375-590 rs per m^3
cost_of_aggregrate=2000; %640-2250 rs per m^3
cost_of_steel=50000; %47000-68000 rs per tonne
cost_of_brick=11; %10-11 rs per piece
cost_of_water=10;% 10-12 rs per liter
water_by_cement_ratio=0.55; %w/c ratio



fprintf('   **quantity of eathwork and excavation**\n');

Quantity_of_Excavation=length_of_footing*width_of_footing*height_of_footing*no_of_footings;
Quantity_of_Excavation=Quantity_of_Excavation/35.31; %changing cuft to cumec
dressing=0.01;
dressing=Quantity_of_Excavation*dressing;
Quantity_of_Excavation=dressing+Quantity_of_Excavation;
fprintf('quantity of excavation=  %.0f m^3 \n', Quantity_of_Excavation)

fprintf('  **quantity of pcc**\n')

volume_of_pcc_in_footings=length_of_footing*width_of_footing*thickness_of_pcc_in_footing*no_of_footings; %it comes in cuft
volume_of_pcc_in_footings=volume_of_pcc_in_footings/35.31;  %units conversion from cuft to cumec
fprintf('volume of pcc in footing= %.0f m^3\n',volume_of_pcc_in_footings) 

volume_of_pcc_in_footings_in_drystate=volume_of_pcc_in_footings*dry_volume_factor;
cement_quantity_in_pcc=cement_part_in_pcc*density_of_cement*volume_of_pcc_in_footings_in_drystate/weight_of_cementbag;
cement_quantity_in_pcc=ceil(cement_quantity_in_pcc);
sand_quantity_in_pcc=volume_of_pcc_in_footings_in_drystate*sand_part_in_pcc;
aggregrate_quantity_in_pcc=volume_of_pcc_in_footings_in_drystate*aggregrate_part_in_pcc;
aggregrate_quantity_in_pcc=ceil(aggregrate_quantity_in_pcc);
fprintf('cement quantity in pcc=  %.2f bags\n',cement_quantity_in_pcc);
fprintf('sand quantity in pcc= % .2f m^3\n',sand_quantity_in_pcc);
fprintf('aggregrate quantity in pcc= %.2f m^3\n',aggregrate_quantity_in_pcc);
 

fprintf('  **quantity of rcc**\n')

%amount of rcc in slab
volume_of_slab=length_of_slab*width_of_slab*thickness_of_slab*no_of_floors;
volume_of_slab=volume_of_slab/35.314;
fprintf('volume of slab= %.2f m^3 \n',volume_of_slab)
%amount of rcc in footing
volume_of_footing=length_of_footing*width_of_footing*height_of_RCC_in_footing*no_of_footings;
volume_of_footing = volume_of_footing / 35.314;
fprintf('volume_of_RCC_in_footing=  %.2f m^3 \n',volume_of_footing)
% amount of rcc in column
volume_of_column=length_of_column*width_of_column*height_of_column*no_of_column*no_of_floors;
volume_of_column=volume_of_column/35.314;
fprintf('volume of column=  %.2f m^3 \n',volume_of_column)
%amount of rcc in beam
total_length_of_beam=external_wall_length+internal_wall_length;
volume_of_beam=total_length_of_beam*depth_of_beam*width_of_beam*no_of_floors;
volume_of_beam=volume_of_beam/35.314;
fprintf('volume of beam= %.2f m^3 \n',volume_of_beam)
%amount of rcc in staircase
volume_of_staircase = width_of_staircase*(sloping_length_of_staircase+length_of_landing)*thickness_of_staircase*no_of_floors;
volume_of_staircase = volume_of_staircase / 35.314;
fprintf('Volume of staircase = %.2f m^3\n', volume_of_staircase)
%total rcc volume
total_RCC_volume = volume_of_slab + volume_of_beam +volume_of_column + volume_of_footing+volume_of_staircase;
fprintf('total RCC volume= %.2f m^3\n',total_RCC_volume)


%quantities (M20 1:1.5:3)
total_RCC_volume_in_drystate=total_RCC_volume*dry_volume_factor;
cement_quantity_in_rcc=cement_part_in_rcc*total_RCC_volume_in_drystate*density_of_cement;
cement_quantity_in_rcc=cement_quantity_in_rcc/weight_of_cementbag;
fprintf('cementquantity in rcc= %.2f bags \n',cement_quantity_in_rcc)
sand_quantity_in_rcc=sand_part_in_rcc*total_RCC_volume_in_drystate;
fprintf('sand quantity in rcc= %.2f m^3 \n',sand_quantity_in_rcc)
aggregrate_quantity_in_rcc=aggregrate_part_in_rcc*total_RCC_volume_in_drystate;
fprintf('aggregrate quantity in rcc= %.2f m^3\n',aggregrate_quantity_in_rcc)

 fprintf('**quantity of steel** \n')

 quantity_of_steel_in_slab=volume_of_slab*steel_percent_in_slab*density_of_steel;
 quantity_of_steel_in_slab=quantity_of_steel_in_slab/1000;%units are tonnes
 fprintf('quantity of steel in slab= %.2f tonnes\n',quantity_of_steel_in_slab)

 quantity_of_steel_in_beam=volume_of_beam*steel_percent_in_beam*density_of_steel;
 quantity_of_steel_in_beam=quantity_of_steel_in_beam/1000; % units in tonnes
 fprintf('quantity of steel in beam= %.2f tonnes\n',quantity_of_steel_in_beam)

 quantity_of_steel_in_column=volume_of_column*steel_percent_in_column*density_of_steel;
 quantity_of_steel_in_column=quantity_of_steel_in_column/1000; % units in tonnes
 fprintf('quantity of steel in column= %.2f tonnes\n',quantity_of_steel_in_column)

 quantity_of_steel_in_footing=volume_of_footing*steel_percent_in_footing*density_of_steel;
 quantity_of_steel_in_footing=quantity_of_steel_in_footing/1000; % units in tonnes
 fprintf('quantity of steel in footing= %.2f tonnes\n',quantity_of_steel_in_footing)

 quantity_of_steel_in_staircase=volume_of_staircase*steel_percent_in_staircase*density_of_steel;
 quantity_of_steel_in_staircase=quantity_of_steel_in_staircase/1000; % units in tonnes
 fprintf('quantity of steel in staircase= %.2f tonnes\n',quantity_of_steel_in_staircase)

 total_quantity_of_steel=quantity_of_steel_in_slab+quantity_of_steel_in_column+quantity_of_steel_in_beam+quantity_of_steel_in_staircase+quantity_of_steel_in_footing;
 fprintf('total quantity of steel= %.2f tonnes\n',total_quantity_of_steel)


fprintf('**bricks required**\n')

volume_of_internal_wall=internal_wall_length*width_of_internal_wall*height_of_wall*no_of_floors; %in ft^3
volume_of_internal_wall=volume_of_internal_wall/35.314;
fprintf('volume of internal wall= %.2f m^3\n',volume_of_internal_wall)

volume_of_external_wall=external_wall_length*width_of_external_wall*height_of_wall*no_of_floors; %in ft^3
volume_of_external_wall=volume_of_external_wall/35.314;
fprintf('volume of external wall= %.2f m^3\n',volume_of_external_wall)

total_volume_of_wall=volume_of_external_wall+volume_of_internal_wall;
fprintf('total volume of wall= %.2f m^3\n',total_volume_of_wall)

no_of_bricks=total_volume_of_wall*500;
fprintf('no of bricks= %.2f nos \n',no_of_bricks)

wastage_in_bricks=no_of_bricks*wastage_of_bricks;
total_no_of_bricks=wastage_in_bricks+no_of_bricks;
fprintf('total no of bricks= %.0f no.s \n',total_no_of_bricks)

volume_of_brickwork=total_no_of_bricks*volume_of_brick;
fprintf('volume of brickwork= % .2f m^3 \n',volume_of_brickwork)

cement_quantity_in_brickwork=cement_part_in_brickwork*density_of_cement*dry_volume_factor*volume_of_brickwork/weight_of_cementbag;
fprintf('cement quantity in brickwork= %.0f bags \n',cement_quantity_in_brickwork)

sand_quantity_in_brickwork=sand_part_in_brickwork*dry_volume_factor*volume_of_brickwork;
fprintf('sand quantity in brickwork= %.2f m^3 \n',sand_quantity_in_brickwork)


fprintf('**plastering quantities**\n')

total_plastering_area_ft2 = internal_wall_area + ceiling_area + external_wall_area;  % Total plastering area
total_area_m2 = total_plastering_area_ft2 * 0.092903;% Convert area from ft^2 to m^2
thickness_m = plaster_thickness / 1000;% Convert plaster thickness from mm to m
total_plastering_volume = total_area_m2 * thickness_m; %% Wet mortar volume
fprintf('total plastering volume= %.2f m^3\n ',total_plastering_volume)
dry_mortar_in_plastering = total_plastering_volume * dry_volume_factor; % Dry mortar volume

%cement:sand(1:4)
cement_quantity_in_plastering=cement_part_in_plastering*density_of_cement*dry_mortar_in_plastering;
cement_quantity_in_plastering=cement_quantity_in_plastering/weight_of_cementbag;
fprintf('cement quantity in plastering= %.2f bags \n',cement_quantity_in_plastering)
sand_quantity_in_plastering=sand_part_in_plastering*dry_mortar_in_plastering;
fprintf('sand quantity in plastering= %.2f m^3 \n',sand_quantity_in_plastering)

fprintf('** flooring**\n')
fprintf('====================================\n')

total_flooring_area=length_of_slab*width_of_slab*no_of_floors;
fprintf('Total_Flooring_Area = %.2f ft^2\n', total_flooring_area);
total_flooring_volume=length_of_slab*width_of_slab*no_of_floors*thickness_of_flooring;
total_flooring_volume=total_flooring_volume/35.314;
fprintf('total flooring volume= %.2f m^3\n',total_flooring_volume)
 %cement:sand 1:4
 cement_quantity_in_flooring=total_flooring_volume*dry_volume_factor*density_of_cement*cement_part_in_flooring
 cement_quantity_in_flooring=cement_quantity_in_flooring/weight_of_cementbag;
 fprintf('cement quantity in flooring= %.2f bags \n',cement_quantity_in_flooring)

 sand_quantity_in_flooring=total_flooring_volume*sand_part_in_flooring*dry_volume_factor;
 fprintf('sand quantity in flooring=% .2f m^3\n',sand_quantity_in_flooring)


 % total quantities
 fprintf('****total quantities****\n')
 
 total_cement_quantity=cement_quantity_in_pcc+cement_quantity_in_rcc+cement_quantity_in_plastering+cement_quantity_in_flooring+cement_quantity_in_brickwork;
 fprintf('total cement quantity= %.0f bags \n',total_cement_quantity)
  
 total_sand_quantity=sand_quantity_in_pcc+sand_quantity_in_rcc+sand_quantity_in_plastering+sand_quantity_in_flooring+sand_quantity_in_brickwork;
  fprintf('total sand quantity= % .0f m^3 \n',total_sand_quantity)
  
  total_aggregrate_quantity=aggregrate_quantity_in_pcc+aggregrate_quantity_in_rcc;
  fprintf('total aggregrate quantity= % .0f m^3 \n',total_aggregrate_quantity)
  
  total_quantity_of_steel=quantity_of_steel_in_slab+quantity_of_steel_in_column+quantity_of_steel_in_beam+quantity_of_steel_in_staircase+quantity_of_steel_in_footing;
  fprintf('total quantity of steel= %.2f tonnes\n',total_quantity_of_steel)

  fprintf('total no of bricks= %.0f no.s \n',total_no_of_bricks)

  %cost estimation

  total_cementbags_cost=total_cement_quantity*cost_of_single_cementbag;
 fprintf('total cement bags cost = %.0f rs \n',total_cementbags_cost)

 total_sand_cost=total_sand_quantity*cost_of_sand;
fprintf('total sand cost= %.0f rs \n',total_sand_cost)

total_aggregrate_cost=total_aggregrate_quantity*cost_of_aggregrate;
fprintf('total_aggregrate_cost= %.0f rs \n',total_aggregrate_cost)

total_steel_cost=total_quantity_of_steel*cost_of_steel;
fprintf('total_steel_cost= %.0f rs \n',total_steel_cost)

total_bricks_cost=total_no_of_bricks*cost_of_brick;
fprintf('total_bricks_cost= %.0f rs \n',total_bricks_cost)

total_volume=total_flooring_volume+total_RCC_volume+total_plastering_volume+volume_of_pcc_in_footings+volume_of_brickwork;
total_volume=total_volume*water_by_cement_ratio;
total_water_cost=total_volume*cost_of_water;
fprintf('total water cost= %.0f rs \n',total_water_cost)

total_material_cost=total_cementbags_cost+total_sand_cost+total_aggregrate_cost+total_steel_cost+total_bricks_cost+total_water_cost;
fprintf('Total material cost= %.0f rs \n',total_material_cost)

fprintf('\n========== the end ==========\n');




fprintf('\n========== CONSTANTS ==========\n');

fprintf('Plastering thickness = 12/1000 m\n');
fprintf('Density of steel = 7850 kg/m^3\n');

fprintf('Steel percentage in slab = 0.01\n');
fprintf('Steel percentage in footing = 0.008\n');
fprintf('Steel percentage in column = 0.06\n');
fprintf('Steel percentage in beam = 0.02\n');
fprintf('Steel percentage in staircase = 0.015\n');

fprintf('Cement part in RCC = 1/5.5\n');
fprintf('Sand part in RCC = 1.5/5.5\n');
fprintf('Aggregate part in RCC = 3/5.5\n');

fprintf('Cement part in PCC = 1/7\n');
fprintf('Sand part in PCC = 2/7\n');
fprintf('Aggregate part in PCC = 4/7\n');

fprintf('Cement part in plastering = 1/5\n');
fprintf('Sand part in plastering = 4/5\n');

fprintf('Cement part in flooring = 1/5\n');
fprintf('Sand part in flooring = 4/5\n');

fprintf('Dry volume factor = 1.54\n');
fprintf('Density of cement = 1440 kg/m^3\n');
fprintf('Weight of cement bag = 50 kg\n');

fprintf('Width of internal wall = 0.375 ft\n');
fprintf('Width of external wall = 0.75 ft\n');
fprintf('Wastage of bricks = 0.05\n');
fprintf('Cement part in brickwork = 1/5\n');
fprintf('Sand part in brickwork = 4/5\n');
fprintf('volume of brick=0.001539 m^3\n');

fprintf('Cost of single cement bag = Rs.350/bag\n');
fprintf('Cost of sand = Rs.500/m^3\n');
fprintf('Cost of aggregate = Rs.2000/m^3\n');
fprintf('Cost of steel = Rs.50000/tonne\n');
fprintf('Cost of brick = Rs.11/piece\n');
fprintf('Cost of water = Rs.10/litre\n');

fprintf('Water-cement ratio = 0.55\n');


fprintf('================================\n');