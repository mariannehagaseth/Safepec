BEGIN{
# local variables:
SPC					= "<http://data.safepec.eu/2016/bn/0.3";
COMMENT				= "###\n";
COMM				= "###";
SPACE				= "                    ";
RISK_MODEL_CLASS    = RISK_MODEL "_model";
#
print COMM "Create NODE_1= " NODE_1 ", NODE_2=" NODE_2" and the dependency between them" ;
#
#
if (NODE_1 != "") ## Not add if blank
{
print COMM "Create dependent node for NODE_1 = " NODE_1;
print SPC  "/" RISK_MODEL "/" NODE_1 "_dependent> rdf:type owl:Class .\n";
}
#
if (NODE_2 != "") ## Not add if blank
{
print  SPC "/"  RISK_MODEL "/" NODE_2 "> rdf:type owl:Class .";                                                                                      
print  SPC "/"  RISK_MODEL "/" NODE_2 "> rdfs:label \"" RISK_MODEL "/" NODE_2 "\" .";
print  SPC "/"  RISK_MODEL "/" NODE_2 "> rdfs:subClassOf :" RISK_MODEL_CLASS " .\n";
print COMM  "Set up the dependencies from the NODE_1 to the NODE_2 =  " NODE_2;
#
print SPC "/"  RISK_MODEL "/" NODE_2 "_dependent> rdf:type owl:Class .";
print SPC "/"  RISK_MODEL "/" NODE_2 "_dependent> rdfs:label \"" RISK_MODEL "/" NODE_2 "_dependent\" .";
print SPC "/"  RISK_MODEL "/" NODE_2 "_dependent> rdfs:subClassOf " SPC   "/" RISK_MODEL "/" NODE_1 "_dependent> .";                                                                                                  
print SPC "/"  RISK_MODEL "/" NODE_2 "_dependent> rdf:label \"" RISK_MODEL "/" NODE_2 "_dependent\" .";
print SPC "/"  RISK_MODEL "/" NODE_2 "_dependent> owl:equivalentClass [ rdf:type owl:Restriction;";
print  SPACE "owl:onProperty :isDependentOn ;";
print  SPACE "owl:someValuesFrom " SPC  "/" RISK_MODEL "/" NODE_2 ">";
print   SPACE "] ;";
print SPACE    "rdfs:comment \"subModel dependencies\" .\n";
}
#
}