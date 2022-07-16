# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory=${1}
destinationDirectory=$2

# [TASK 2]
echo ""
echo "Target directory: $targetDirectory"
echo "Backup destination: $distenationDirectory"
echo $targetDirectory
echo ""

# [TASK 3]
currentTS=`date+%s`

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
origAbsPath=`pwd`

# [TASK 6]
cd $destinationDirectory
destDirAbsPath=$(pwd)
echo "$destDirAbsPath"

# [TASK 7]
cd $origAbsPath
cd $targetDirectory

# [TASK 8]
yesterdayTS=$(date +%s)
yesterdayTS=$((yesterdayTS-60*24*60))

declare -a toBackup

for file in $(file_list) # [TASK 9]
do
  # [TASK 10]
  if ((`date -r $file +%s` -lt $yesterdayTSS))
  then
   toBackup+=($file)
   echo "Added $file to array"
  fi
done

# [TASK 12]
echo ""
echo "Trying to compress all files in the backup array"
echo ""
tar -czvf $backupFileName ${toBackup[*]}
mkdir new 
destDirAbsPath="/home/project/folder/new"
# [TASK 13]
ls
mv $backupFileName $destDirAbsPath

# Congratulations! You completed the final project for this course!