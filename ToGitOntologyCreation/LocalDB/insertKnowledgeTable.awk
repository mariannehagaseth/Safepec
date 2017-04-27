# script to create insert statement for knowledge tables:
#
BEGIN{FS=";";
}
# Main part:
{
if (NR>1) ## Not first line
{
print "INSERT INTO " KB_TABLE " VALUES (";
for (i = 1; i<=NF; i++) 
{
#####sub(/&/, " and ", $i);
sub(/'/, "''", $i);
print "'" $i "'" ;
if (i!=NF) {print "," ;} 
}
print ");";
}
}
