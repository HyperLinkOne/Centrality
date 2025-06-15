#!/bin/bash


function help()
{
  echo "Usage: $0 -h -c [-o folder]"
  echo "  "
  echo "  This script automaticaly grants access to you and the www-data User"
  echo "  -h Helpscreen "
  echo "  -c create Folder if not present "
  echo "  -a add  facls"
  echo "  -d delete all facls"
  echo "  -l list facls"
  echo "  -r do everything recursivly"
  echo "  -s save facl to permissions.facl File"
  echo "  -f restore facl from permissions.facl File" 
  echo " " 
  echo "Example: " 
  echo " $0 -arl -o dir_to_change" 
  echo " " 
  echo "or for aktuall directory"
  echo " $0 -arl -o ." 

  exit 1
}


function createFolder(){
  mkdir -p "$DIR"
  echo "${DIR} created"

}

function addFACL(){
	setfacl -${RECURSIV}m d:u:${DOCKER_USER_ID}:rwX,${HOST_USER_ID}:rwX,u:${DOCKER_USER_ID}:rwX,${HOST_USER_ID}:rwX "$DIR"
}

function deleteFACL(){
#alle ACLs rekursiv wieder löschen
  setfacl -${RECURSIV}b "${DIR}"
}

# NOT JET IMPLEMENTED ----
#alle ACLs für eine Datei Löschen
#setfacl -b <filename>


function saveFACL(){
  #alle ACL für diesen Ordner sichern
  getfacl -R "$DIR" > permissions.facl
}

function restoreFACL(){
 setfacl --restore=permissions.facl "$DIR"
}

function listFACL(){
  getfacl  "${DIR}"
}


# ----------------------------------
if [ $# -eq 0 ]; then
    help
    exit 1
fi


HOST_USER_ID="$(id -u)"
# 33 equals  www-data in ubuntu php containers ...
DOCKER_USER_ID="33"

CREATEDIR=0
DIR=${pwd}
echo $DIR

while getopts "fschardlo:" opt; do
  case $opt in
    h)
      help
      exit 1
      ;;
    c)
    #create dir
	  CREATEDIR=1  
      ;;
    a)
    #add facl
	  ADDFACL=1
      ;;
    d)
	#delete facl on dir
	DELETEFACL=1
      ;;
    r)
	# recursively
	RECURSIV="R"
      ;;
    s)
	#save facl to file
	SAVEFACL=1
      ;;
    l)
	#list facl
	LISTFACL=1
      ;;
    f)
	#restore facl from file
	RESTOREFACL=1
      ;;
     o)
       DIR=${OPTARG} 
      ;;    
    \?) # all other options
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :) # all other options not being catched above will be used here
      echo "Option -$OPTARG needs an argument." >&2
      exit 1
      ;;
  esac
done
 

if [ "$CREATEDIR" = 1 ] 
then
	createFolder
fi

if [ "$ADDFACL" == 1 ] 
then
	addFACL
fi

if [ "$DELETEFACL" == 1 ] 
then
	deleteFACL
fi

if [ "$SAVEFACL" == 1 ] 
then
	saveFACL
fi

if [ "$LISTFACL" == 1 ] 
then
	listFACL
fi

if [ "$RESTOREFACL" == 1 ] 
then
	restoreFACL
fi


echo 'All done on `'$DIR'`'
exit 0
