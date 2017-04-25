#awk script to create classes and individuals for the parameter table mapping for the RISK_MODEL model and RISK_MODEL_CLASS:
#
# awk script to create RDFs for one NODE of FT_NODE in the RISK_MODEL model and RISK_MODEL_CLASS::
#
# An example from the vulnerability_bending_corrosion_model:
#
# $1= parameter values beta_1 ..beta_28
#
# $2-$7 = the various ship_types that are relevant for this risk model:	
# $2=general_cargo value	
# $3=container	 value
# $4=bulk_carrier	 value
# $5=pax	 value
# $6=tanker	 value
# $7=others	 value																					
#
BEGIN {
FS=";";
RISK_MODEL_CLASS    = RISK_MODEL "_model";
for (i = 2; i<=NF; i++) {JOIN_KEY[i] ="";}
}
# Main part:
{
if (NR<=NO_JOINS) ##First NO_JOINS lines containing data_item names.
  {
# An example from the vulnerability_bending_corrosion_model:
#KEY				= "ship_type";
#KEY_VALUE_2 		= "general_cargo"	;
#KEY_VALUE_3 		= "container"	 ;
#KEY_VALUE_4 		= "bulk_carrier"	;
#KEY_VALUE_5 		= "pax"	 ;
#KEY_VALUE_6 		= "tanker";	  
#KEY_VALUE_7 		= "ship_type_others";	 																					
# Set variables, NF= number of fields, here: the number of columns in the csv.
  KEY[NR] = $1;
for (i = 2; i<=NF; i++) 
	{KEY_VALUE[i][NR]=$i;
	# Only one list of input values, for instance pac, general_cargo, bulk_carrier etc for ship_type.
	if (NO_JOINS==1) {
	JOIN_KEY[i] = KEY_VALUE[i][1];
	}
	else 
	if (NR==NO_JOINS) 
	{
	for (j = 1; j<NO_JOINS; j++){ JOIN_KEY[i] = JOIN_KEY[i] KEY_VALUE[i][j] "_";}
	JOIN_KEY[i] = JOIN_KEY[i] KEY_VALUE[i][NO_JOINS];
	} 
	}
# local variables:
SPC					= "<http://data.safepec.eu/2016/bn/0.3";
COMMENT				= "###\n";
COMM				= "###";
SPACE				= "                    ";
# 
#
print COMM " Create SubClass for DATA_ITEM \n";
#
print ":" KEY[NR]  " rdfs:subClassOf :" DATA_ITEM_SUB_CLASS " .";
print ":" KEY[NR]  " rdfs:subClassOf [ rdf:type owl:Class ;";
print    SPACE                      " owl:oneOf (";
for (i = 2; i<=NF; i++) 
	{
print    SPACE	 ":" NODE "_" KEY_VALUE[i][NR];
	}
print    SPACE   ")";
print    SPACE   "] .\n";
#
print COMM;
#
for (i = 2; i<=NF; i++) 
{
print COMM  "Creating " SPC "/"  KEY_VALUE[i][NR] "as an individual of the leaf node " KEY[NR];
print COMM "Creating individ for DATA_ITEM: \n";
#
print ":" NODE "_" KEY_VALUE[i][NR] "  rdf:type :" KEY[NR] " ,";
print SPACE   "owl:NamedIndividual ;";
print SPACE "rdfs:label \""NODE "_" KEY_VALUE[i][NR]"\"" ".\n";
#
}
} # end if: This is done only once, that is, for the first lines containing the data item names.
else # all other lines containing number, but not the first lines containing the key and key parameter names:
{
#
# START FOR EACH ROW:
# 
print COMM "START FOR Setting up for parameter = " $1 ":";
#
for (i = 2; i<=NF; i++) 
{
for (j = 1; j<=NO_JOINS; j++) 
{
print COMM "Create class" SPC "/"  RISK_MODEL "/" KEY_VALUE[i][j] "_pd> as subclass of all the parameter classes following the hasProperPart property";
print COMM "Create subclass of PARAMETER_DEFINITION:\n";
#
print SPC  "/" RISK_MODEL "/" KEY[j] "_pd> rdfs:subClassOf [ rdf:type owl:Restriction ;";
print 							SPACE "owl:onProperty :hasProperPart;";
print 							SPACE "owl:someValuesFrom " SPC "/"  RISK_MODEL "/" NODE "/" $1 ">].\n";
#
print COMM "Create class for " SPC "/"  RISK_MODEL "/" KEY[j] "/" $1 "> that is a subclass of parameter";
print COMM "Create subclass of PARAMETER: \n";
#
print SPC  "/"   RISK_MODEL "/" NODE "/" $1 "> rdf:type owl:Class.";                                            
print SPC  "/"   RISK_MODEL "/" NODE "/" $1 "> rdfs:label \"" RISK_MODEL "/" NODE "/"  $1 "\".";
print SPC  "/"   RISK_MODEL "/" NODE "/" $1 "> rdfs:subClassOf :parameter .";
print SPC  "/"   RISK_MODEL "/" NODE "/" $1 "> :spc_label \"" $1 "\" .\n";
}
}#
print COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM;
print COMM;
print COMM "     Individs for model = " RISK_MODEL_CLASS;
print COMM;
print COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM COMM COMMENT;
#
for (i = 2; i<=NF; i++) 
{
for (j = 1; j<=NO_JOINS; j++) 
{
print COMM "Create an individual for the sub class of PARAMETER class: \n";
#
print SPC "#" $1 "_individ_" KEY_VALUE[i][j] "> rdf:type " SPC  "/"   RISK_MODEL "/" NODE "/" $1 "> ,";
print SPACE "owl:NamedIndividual ;";
print SPACE "rdfs:label \"" $1 "_individ_" KEY_VALUE[i][j] "\" ;";
print SPACE ":hasValue \"" $i "\"^^xsd:string  ;";
print SPACE ":spc_label \"" $1 "_individ_" KEY_VALUE[i][j] "\" .\n";                                                        
# 
}
}
#
# For all fields/colums in the file:
for (i = 2; i<=NF; i++) 
{
for (j = 1; j<=NO_JOINS; j++) 
{
print COMM "Set up hasProperPart (individual of the correct parameter subclass) for PARAMETER_DEFINITION subclass individual: \n";
#
print SPC "#" RISK_MODEL "_join_" JOIN_KEY[i] ">  :hasProperPart " SPC "#" $1 "_individ_" KEY_VALUE[i][j] "> .\n"; 
}
}
#
print COMM COMM;
print COMM "Finished setting up for parameter = " $1 "!";
print COMM COMMENT;
#
#
} # end else : all other lines, but not the first one.
}
END {
#
# For all fields/colums in the file: 
for (i = 2; i<=NF; i++) 
{
for (j = 1; j<=NO_JOINS; j++) 
{
print COMM  "Create PARAMETER_DEFINITION instance of the correct sub class: \n";
#
print SPC "#" RISK_MODEL "_join_"  JOIN_KEY[i] "> rdf:type " SPC "/" RISK_MODEL "/" KEY[j] "_pd> ,";
print SPACE        "owl:NamedIndividual ;";
print SPACE        "rdfs:label \"" RISK_MODEL "_join_"  JOIN_KEY[i] "\" ;";
print SPACE       ":scope :"  NODE "_"  KEY_VALUE[i][j] " .\n";
}
}
#
print COMM "Add dependent nodes for NODE= " NODE
#
print  SPC  "/"  RISK_MODEL "/" NODE "> rdf:type owl:Class .";                                                                                      
print  SPC   "/" RISK_MODEL "/" NODE "> rdfs:label \"" RISK_MODEL "/" NODE "\" .";
print  SPC   "/" RISK_MODEL "/" NODE "> rdfs:subClassOf :" RISK_MODEL_CLASS " .";
print  SPC   "/" RISK_MODEL "/" NODE "> rdfs:subClassOf " SPC "/"  RISK_MODEL "/" NODE "_dependent> .\n";
#
print COMM  "Create the _dependent node for NODE = " NODE "\n";
#
print SPC  "/"   RISK_MODEL "/" NODE "_dependent> rdf:type owl:Class .";                                                                                             
print SPC  "/"  RISK_MODEL "/" NODE "_dependent> rdfs:label \"" RISK_MODEL "/" NODE "_dependent\" .";
print SPC  "/"  RISK_MODEL "/" NODE "_dependent> owl:equivalentClass [ rdf:type owl:Restriction;";
print  	SPACE "owl:onProperty :isDependentOn ;";
print  	SPACE "owl:someValuesFrom " SPC "/"  RISK_MODEL "/" NODE ">";
print   SPACE "] .";
for (j = 1; j<=NO_JOINS; j++) 
{
print  SPC  "/"  RISK_MODEL "/" NODE "_dependent> rdfs:subClassOf " SPC "/"  RISK_MODEL "/" KEY[j] "_dependent> .\n";
}
#
#
print COMM COMM COMM COMM COMM COMM COMM;
print COMM;
print COMM "Add test vessel for risk model = " RISK_MODEL_CLASS ":";
print COMM;
print COMM COMM COMM COMM COMM COMM COMMENT;
#	
for (i = 2; i<=NF; i++) 
{
for (j = 1; j<=NO_JOINS; j++) 
{
print COMM  "Create test vessel: " SPC "/imo_" KEY_VALUE[i][j] "_14333\n";
#
print ":imo_"  KEY_VALUE[i][j] "_14333 rdf:type :vessel ,";
print  SPACE                   "owl:NamedIndividual ;";           
print  SPACE          ":hasIMOnumber \"14333\"^^xsd:string ;";     
print  SPACE          ":hasDataItem :"  NODE "_" KEY_VALUE[i][j] ",";
print  SPACE                       ":maintenance_iacs_membership_true ,";
print  SPACE                       ":hooks_young,";
print  SPACE                       ":hooks_Non_IACS,";
print  SPACE                       ":hooks_white,";
print  SPACE                       ":psc_flag_white .\n";
#			  
print COMM  "Create test vessel: " SPC "/imo_" KEY_VALUE[i][j] "_14334\n";
#
print ":imo_" KEY_VALUE[i][j] "_14334 rdf:type :vessel ,";
print  SPACE                   "owl:NamedIndividual ;";           
print  SPACE          ":hasIMOnumber \"14334\"^^xsd:string ;";     
print  SPACE          ":hasDataItem :"  NODE "_" KEY_VALUE[i][j] ",";
print  SPACE                       ":maintenance_iacs_membership_true ,";
print  SPACE                       ":hooks_old ,";
print  SPACE                       ":hooks_IACS,";
print  SPACE                       ":hooks_grey,";
print  SPACE                       ":psc_flag_white .\n";
#
}
} 
}										   