#!/bin/sh 
#shebang

#check version
bash --version

#basic-echo
pwd
echo Hello World!
echo 'Hello World'

#basic-createfile
echo 'My name is Pakakorn' > text.txt
echo 'I am a data analyst' >> text.txt  
touch text2.txt
echo 'I can do anything' > text2.txt
ls

#basic-view/edit file
cat text.txt #view file (can use less/more funciton)
tac text.txt #view file start with backwart
wc text.txt #count word
head text.txt
nano text.txt #edit
man echo #view manual

#basic-conditional / loop
for i in {1..10};do echo 'Hello' $i;done

#basic-directory
tree -d #command to view all file
cd /home/runner/workspace # change directory
ls #list files
pwd # print working directory
cd ~ # change directory to home
pwd
mkdir Folder1 # making new directory
ls
cd Folder1
cp /home/runner/workspace/text2.txt copytext2.txt #copy file
ls

cd .. # change directory to parent directory
ls -la # list with long format + view hidden files options

#basic - search
find -name 'text2.txt' #search file name

#basic - remove
rm -r Folder1 # remove directory
ls

cd /home/runner/workspace 
mv text.txt newtext.txt # rename file
rm newtext.txt # remove file
ls 

#basic-date
date

#advance-variable
var1="this is my variable"
var2=""
echo $var1
read -r var2 #input variable
echo $var2

#add condition
if [ '$var1' == '$var2' ]
then 
  echo same
else 
  echo not same
fi

#advance-shell-builtin
ls -la ~ | grep -i .bash_aliases   # Check if file is available
touch ~/.bash_aliases #create empty aliase file
alias Ben="echo my name is ben" #create alias , first letter should be capital
alias #view all alias
Ben #run alias


#advance-change permission
chmod 700 text2.txt #change permission to rwx------

#advance-managing job
jobs -l #list all job
jobs -p #view all job

#advance-listing process
ps -ef | grep runner

#advance-realtime listing process
#top

#advance-scheldule future process
sleep #suspend exucute for time you need to fix
at #linux
cron #linux

#advance-backing up data
rsync#linux

#advance-compresion
gzip text2.txt #compress file
ls
tar -czf compresstar.tar.gz text2.txt.gz #compress
ls
tar -xvzf compresstar.tar.gz #decompress file
ls


#advance - del environment variable
env -i bash
