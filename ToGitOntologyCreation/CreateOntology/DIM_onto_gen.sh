# bash script to create classes and individuals for the parameter table mapping for the DIM module: 
# 
###################################### 
# Create the general SAFEPEC ontology: 
awk -f safepec_03_basic.awk > DIM_ontology_without_ontop.ttl 
# 
################################################################# 
# Create RDFs for RISK_MODEL="vulnerability_bending_corrosion": 
# 
# 1) Create nodes for the parameter tables for each of the KEYs="ship_type_vulnerability_corrosion", that is, the link from KEY to BOTTOM_NODE: 
# NO_JOINS is the number of lines at the top of the csv parameter table file that contains Key values, for instance, iacs_membership_true, iacs_membership_false etc.
awk -v NODE="hogging_moment_strength" -v NO_JOINS=1 -v RISK_MODEL="vulnerability_bending_corrosion" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_vulnerability_bending_corrosion_hogging_parameters.csv" >> DIM_ontology_without_ontop.ttl 
awk -v NODE="sagging_moment_strength" -v NO_JOINS=1 -v RISK_MODEL="vulnerability_bending_corrosion" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_vulnerability_bending_corrosion_sagging_parameters.csv" >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operation_profile" -v NO_JOINS=1 -v RISK_MODEL="vulnerability_bending_corrosion" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_vulnerability_corrosion_operational_profile_parameters.csv" >> DIM_ontology_without_ontop.ttl 
# 
# 2) Create leaf nodes for all external values:    KEY must match the value in A1 in the corresponding csv containing the parameter table.
awk -v NODE="hogging_moment_strength" -v RISK_MODEL="vulnerability_bending_corrosion"  -v KEY="ship_type_vulnerability_corrosion"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="sagging_moment_strength" -v RISK_MODEL="vulnerability_bending_corrosion"  -v KEY="ship_type_vulnerability_corrosion"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operation_profile"       -v RISK_MODEL="vulnerability_bending_corrosion"  -v KEY="ship_type_vulnerability_corrosion"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
# 
# 3) Create dependencies: 
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="sagging_moment_strength" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="hogging_moment_strength" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="PDF_of_Mwv_s" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="PDF_of_Mwv_h" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="operation_profile" -v NODE_2="PDF_of_Mwv_s" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="operation_profile" -v NODE_2="PDF_of_Mwv_h" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
# 
# 4) Create dependencies for TOP_NODE:  
awk -v RISK_MODEL="vulnerability_bending_corrosion" -v NODE_1="probability_of_failure_of_section" -v TOP_NODE="probability_of_failure_of_ship" -f network_top.awk >> DIM_ontology_without_ontop.ttl 
# 
################################################################# 
# Create RDFs for RISK_MODEL="vulnerability_shear_corrosion": 
#   
# 1) Create nodes for the parameter tables for each of the KEYs="ship_type_vulnerability_corrosion", that is, the link from KEY to BOTTOM_NODE: 
awk -v NODE="shear_capacity" -v NO_JOINS=1 -v RISK_MODEL="vulnerability_shear_corrosion" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_vulnerability_shear_corrosion_shear_capacity_parameters.csv" >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operation_profile" -v NO_JOINS=1 -v RISK_MODEL="vulnerability_shear_corrosion" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_vulnerability_corrosion_operational_profile_parameters.csv" >> DIM_ontology_without_ontop.ttl 
# 
# 2) Create leaf nodes for all external values:    KEY must match the value in A1 in the corresponding csv containing the parameter table.
awk -v NODE="shear_capacity"    -v RISK_MODEL="vulnerability_shear_corrosion"  -v KEY="ship_type_vulnerability_corrosion"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operation_profile" -v RISK_MODEL="vulnerability_shear_corrosion" -v KEY="ship_type_vulnerability_corrosion"  -f network_model.awk >> DIM_ontology_without_ontop.ttl 
# 
# 3) Create dependencies: 
awk -v RISK_MODEL="vulnerability_shear_corrosion" -v NODE_1="shear_capacity" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_shear_corrosion" -v NODE_1="PDF_of_Qwv_pos" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_shear_corrosion" -v NODE_1="PDF_of_Qwv_neg" -v NODE_2="probability_of_failure_of_section" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_shear_corrosion" -v NODE_1="operation_profile" -v NODE_2="PDF_of_Qwv_pos" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="vulnerability_shear_corrosion" -v NODE_1="operation_profile" -v NODE_2="PDF_of_Qwv_neg" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
# 
# 4) Create dependencies for TOP_NODE:  
awk -v RISK_MODEL="vulnerability_shear_corrosion" -v NODE_1="probability_of_failure_of_section" -v TOP_NODE="probability_of_failure_of_ship" -f network_top.awk >> DIM_ontology_without_ontop.ttl 
# 
# 
################################################################# 
# Create RDFs for RISK_MODEL="cause_corrosion": 
#   
# 1) Create nodes for the parameter tables for each of the KEYs="iacs_membership_status", that is, the link from KEY to BOTTOM_NODE: 
awk -v NODE="maintenance" -v NO_JOINS=1 -v RISK_MODEL="cause_corrosion" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_cause_iacs_class_corrosion.csv" >> DIM_ontology_without_ontop.ttl 
awk -v NODE="maintenance" -v NO_JOINS=1 -v RISK_MODEL="cause_corrosion" -v DATA_ITEM_SUB_CLASS="inspection_data" -f node.awk "input_cause_psc_flag_rating_corrosion.csv" >> DIM_ontology_without_ontop.ttl 
# 
# 2) Create leaf nodes for all external values:   KEY must match the value in A1 in the corresponding csv containing the parameter table. 
awk -v NODE="maintenance" -v RISK_MODEL="cause_corrosion"  -v KEY="iacs_membership_status"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="maintenance" -v RISK_MODEL="cause_corrosion"  -v KEY="psc_flag_rating_corrosion"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
# 
# 3) Create dependencies: 
# 
# 4) Create dependencies for TOP_NODE:  
awk -v RISK_MODEL="cause_corrosion" -v NO_JOINS=1 -v  NODE_1="maintenance" -v TOP_NODE="coating_lifetime" -f network_top.awk >> DIM_ontology_without_ontop.ttl 
# 
################################################################# 
#Create RDFs for RISK_MODEL="cause_LSA_davit_launched_lifeboats": 
# 
# 1) Create nodes for the parameter tables (here: combination of class, flag and age) for each of the KEYs="ship_class_status", "ship_flag_status", "ship_age_status", that is, the link from KEY to BOTTOM_NODE: 
# The parameter values for node=hooks is dependent on three different Key values, namely age, class and flag => NO_JOINS=3.
awk -v NODE="hooks" -v NO_JOINS=3 -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_cause_davit_launched_lifeboats_hook.csv" >> DIM_ontology_without_ontop.ttl 
## Only test values: Correct values must be used: 
awk -v NODE="control_lever" -v NO_JOINS=3 -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_cause_davit_launched_lifeboats_control_lever.csv" >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operating_cables" -v NO_JOINS=3 -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v DATA_ITEM_SUB_CLASS="administration_data" -f node.awk "input_cause_davit_launched_lifeboats_operating_cables.csv" >> DIM_ontology_without_ontop.ttl 
# 
# 2) Create leaf nodes for all external values:  KEY must match the value in A1 in the corresponding csv containing the parameter table.
awk -v NODE="hooks" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_class_status"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="hooks" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_flag_status_LSA"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="hooks" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_age_status"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="control_lever" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_class_status" -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="control_lever" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_flag_status_LSA"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="control_lever" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_age_status"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operating_cables" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_class_status"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operating_cables" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_flag_status_LSA"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
awk -v NODE="operating_cables" -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v KEY="ship_age_status"   -f network_model.awk >> DIM_ontology_without_ontop.ttl 
# 
# 3) Create dependencies: 
awk -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v NODE_1="hooks" -v NODE_2="on_load_mechanism" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v NODE_1="control_lever" -v NODE_2="on_load_mechanism" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
awk -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v NODE_1="operating_cables" -v NODE_2="on_load_mechanism" -f network_dep.awk >> DIM_ontology_without_ontop.ttl 
# 
# 4) Create dependencies for TOP_NODE:  
awk -v RISK_MODEL="cause_LSA_davit_launched_lifeboats" -v NODE_1="on_load_mechanism" -v TOP_NODE="failure_of_davit_launched_lifeboats" -f network_top.awk >> DIM_ontology_without_ontop.ttl 

