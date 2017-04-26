# create Test database for the External data:
awk -f createVesselTable.awk "IHS_tblship.csv" > createVesselTable.sql
#
# insert test vessels from IHS database:
awk -f insertVesselTable.awk "IHS_tblship.csv" > insertVesselTable.sql
#
# Create Knowledge tables:
#
# For class society to IACS_membership true or false:
awk -v KB_TABLE="KB_IACS_membership" -f createKnowledgeTable.awk "KB_IACS_membership.csv" > KB_IACS_membership.sql
awk -v KB_TABLE="KB_IACS_membership" -f insertKnowledgeTable.awk "KB_IACS_membership.csv" >> KB_IACS_membership.sql
#
# For flag ranking for cause_fatigue model:
awk -v KB_TABLE="KB_flag_fatigue" -f createKnowledgeTable.awk "KB_flag_fatigue.csv" > KB_flag_fatigue.sql
awk -v KB_TABLE="KB_flag_fatigue" -f insertKnowledgeTable.awk "KB_flag_fatigue.csv" >> KB_flag_fatigue.sql
#
