# script to create create statement for Knowledge tables:
#
BEGIN{FS=";";
print "CREATE TABLE " KB_TABLE "(";
}
# Main part:
{
if (NR==1) ##First line
{
for (i = 1; i<=NF; i++) 
{
print $i " VARCHAR(100) " ;
if (i!=NF) {print "," ;} 
}
print ");";
}
}
