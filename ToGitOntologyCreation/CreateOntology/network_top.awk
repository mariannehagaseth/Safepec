BEGIN{
# local variables:
SPC					= "<http://data.safepec.eu/2016/bn/0.3";
COMMENT				= "###\n";
COMM				= "###";
SPACE				= "                    ";
RISK_MODEL_CLASS    = RISK_MODEL "_model";
#
#
print COMM  "Set up the link between the top node and the next level:";
#
print SPC  "/" RISK_MODEL "/" TOP_NODE "> rdf:type owl:Class .";
print SPC  "/" RISK_MODEL "/" TOP_NODE "> rdfs:label \"" RISK_MODEL "/" TOP_NODE "\" .";
print SPC  "/" RISK_MODEL "/" TOP_NODE "> rdfs:subClassOf " SPC "/"  RISK_MODEL "/" NODE_1 "_dependent> .";
print SPC  "/" RISK_MODEL "/" TOP_NODE "> rdfs:subClassOf :" RISK_MODEL_CLASS " .";
print SPC  "/" RISK_MODEL "/" TOP_NODE "> rdf:label \"" RISK_MODEL "/" TOP_NODE "\" .";
print SPC  "/" RISK_MODEL "/" TOP_NODE "> rdfs:comment \"subModel dependencies\" .\n";
}