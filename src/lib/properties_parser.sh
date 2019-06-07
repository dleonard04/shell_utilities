################################################################################
# Parse a properties file, returning a value for a specified key
# Not the most efficient thing in the world because it has to grep the whole
# file per property.
# I: properties file
#    key
# O: value
################################################################################
function get_property {
 local prop_file=$1
 local prop_key=$2
 local line=$(egrep "^\s*$prop_key\s*=" $prop_file)

 if [ -z "$line" ]; then
  return
 fi

 echo "$line" | sed "s/[[:space:]]*$prop_key[[:space:]]*=//"
}
