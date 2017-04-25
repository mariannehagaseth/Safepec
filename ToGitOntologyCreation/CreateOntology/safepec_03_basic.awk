# awk script to create the ontology classes for the SAFEPEC ontology that is needed as the basis for the mapping.
BEGIN {
print "@prefix : <http://data.safepec.eu/2016/bn/0.3/> ."
print "@prefix owl: <http://www.w3.org/2002/07/owl#> ."
print "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."
print "@prefix xml: <http://www.w3.org/XML/1998/namespace> ."
print "@prefix xsd: <http://www.w3.org/2001/XMLSchema#> ."
print "@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> ."
print "@base <http://data.safepec.eu/2016/bn/0.3> ."
#
print "<http://data.safepec.eu/2016/bn/0.3> rdf:type owl:Ontology ."
#
TAB= "                   ";
#
print "#################################################################"
print "#"
print "#    Annotation properties"
print "#"
print "#################################################################\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#iacs_short_label\n"
#
print ":iacs_short_label rdf:type owl:AnnotationProperty ;  "              
print    TAB "rdfs:subPropertyOf rdfs:label .\n"
# 
print "###  http://data.safepec.eu/2016/bn/0.3#ihs_label\n"
#
print ":ihs_label rdf:type owl:AnnotationProperty ;"
print    TAB        "rdfs:subPropertyOf rdfs:label .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#spc_label\n"
#
print  ":spc_label rdf:type owl:AnnotationProperty ;"
print   TAB          "<http://purl.org/dc/elements/1.1/description> \"an spc_label is used in the context of the Safepec data integration module. the value of the spc_label is used inside the ontop mappings and implementation SPARQL queries. the spc_labels have to be agreed and stable.\"^^xsd:string ;"
print TAB             "rdfs:subPropertyOf rdfs:label .\n"
#
print "###  http://purl.org/dc/elements/1.1/description\n"
#
print "<http://purl.org/dc/elements/1.1/description> rdf:type owl:AnnotationProperty .\n"

print "###  http://www.w3.org/1999/02/22-rdf-syntax-ns#label\n"
#
print "rdf:label rdf:type owl:AnnotationProperty .\n"
#
print "###  http://xmlns.com/foaf/0.1/homepage\n"
#
print "<http://xmlns.com/foaf/0.1/homepage> rdf:type owl:AnnotationProperty .\n"
#
print "#################################################################"
print "#"
print "#    Object Properties"
print "#"
print "#################################################################\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#hasDataItem"
print  ":hasDataItem rdf:type owl:ObjectProperty ;"
print     TAB         "rdfs:range :data_item .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#hasProperPart"
print  ":hasProperPart rdf:type owl:ObjectProperty .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#isAbout"
print  ":isAbout rdf:type owl:ObjectProperty .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#isDependentOn"
print  ":isDependentOn rdf:type owl:ObjectProperty ;"
print      TAB          "rdfs:range :model ;"
print        TAB        "rdfs:domain :model .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#isParameterDefinitionFor"
print  ":isParameterDefinitionFor rdf:type owl:ObjectProperty ;"
print         TAB                  "rdfs:domain :parameter_definition .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#scope"
print  ":scope rdf:type owl:ObjectProperty ;"
print      TAB  "rdfs:range :data_item ;"
print       TAB  "rdfs:subPropertyOf :isAbout ;"
print       TAB "rdfs:domain :parameter_definition .\n"
# 
print "#################################################################"
print "#"
print "#    Data properties"
print "#"
print "#################################################################\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#hasValue"
print  ":hasValue rdf:type owl:DatatypeProperty .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#hasIMOnumber"
print ":hasIMOnumber rdf:type owl:DatatypeProperty ;"
print    TAB        "rdfs:domain :vessel ."
#
print "#################################################################"
print "#"
print "#    Classes"
print "#"
print "#################################################################\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#administration_data"
print  ":administration_data rdf:type owl:Class ;                "  
print         TAB             "rdfs:subClassOf :data_item .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#data_integration_definition"
print ":data_integration_definition rdf:type owl:Class ;                   "    
print              TAB                "rdfs:label \"data integration definition\"^^xsd:string ;"                             
print              TAB                "rdfs:subClassOf :model ; "                            
print               TAB               "<http://purl.org/dc/elements/1.1/description> \"a data integration definition (did) is a model that states verbally or by a logic expression how (by which rule) source data is assembled to some aggregate data expression for a special purpose.\"^^xsd:string .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#data_item"
print SPC ":data_item rdf:type owl:Class .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#dependent"
print SPC ":dependent rdf:type owl:Class .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#inspection_data"
print SPC ":inspection_data rdf:type owl:Class ;           "
print  TAB               "rdfs:subClassOf :data_item .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#model"
print ":model rdf:type owl:Class .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#object"
print ":object rdf:type owl:Class .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#operational_data"
print  ":operational_data rdf:type owl:Class ;            "
print TAB              "rdfs:subClassOf :data_item .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#parameter"
print  ":parameter rdf:type owl:Class .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#parameter_definition"
print  ":parameter_definition rdf:type owl:Class .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#quality"
print  ":quality rdf:type owl:Class ;"
print  TAB "rdfs:subClassOf :data_item .\n"
#
print "###  http://data.safepec.eu/2016/bn/0.3#vessel"
print  ":vessel rdf:type owl:Class ;"
print  TAB "rdfs:subClassOf :object .\n"
# 
print "############## Finished general SAFEPEC Ontology defitinions" 
}