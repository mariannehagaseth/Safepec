BEGIN{
# local variables:
SPC					= "<http://data.safepec.eu/2016/bn/0.3";
COMMENT				= "###\n";
COMM				= "###";
SPACE				= "                    ";
RISK_MODEL_CLASS    = RISK_MODEL "_model";
#
#
print COMM  "Set up the risk model as a subclass of MODEL class:";
#
print ":" RISK_MODEL_CLASS " rdf:type owl:Class ;";
print   SPACE    "rdfs:subClassOf :model .\n";
#
print COMM  "Create RISK_MODEL = " RISK_MODEL " as subClassOf data_integration_definition:";
#
print SPC  "/"  RISK_MODEL "/" KEY "> rdf:type owl:Class ;";
print  SPACE     "rdfs:label \"" RISK_MODEL "/" KEY "\" ;";
print  SPACE     "rdfs:subClassOf :data_integration_definition .\n";
#
print COMM  "Create " KEY "_dependent as subclass of DEPENDENT: ";
#
print SPC   "/" RISK_MODEL "/" KEY "_dependent> rdf:type owl:Class ;";
print SPACE "rdfs:label \"" RISK_MODEL "/" KEY "_dependent\" ;";
print   SPACE  "owl:equivalentClass [ rdf:type owl:Restriction ;";
print   SPACE  "owl:onProperty :isDependentOn ;";
print   SPACE   "owl:someValuesFrom " SPC  "/" RISK_MODEL "/" KEY ">";
print   SPACE   " ] ;";
print   SPACE   "rdfs:subClassOf :dependent .\n";
#
print COMM  "Create " KEY "_pd> as subclass of PARAMETER_DEFINITION:";
#
print SPC "/"  RISK_MODEL "/" KEY "_pd> rdf:type owl:Class ;";
print SPACE   "rdfs:subClassOf :parameter_definition ,";
print SPACE		"[ rdf:type owl:Restriction ;";
print SPACE		"owl:onProperty :isParameterDefinitionFor ;";
print SPACE		"owl:someValuesFrom " SPC "/" RISK_MODEL "/" KEY ">";
print SPACE        "] ,";
print  SPACE       "[ rdf:type owl:Restriction ;";
print SPACE		"owl:onProperty :scope ;";
print SPACE		"owl:someValuesFrom :" KEY ;
print SPACE		"] .\n";
#
}