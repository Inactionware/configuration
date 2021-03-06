# The required java version for build environment
jversion=11.0

# Define java home for different development environment
jhome_mac="/Users/xiaoming/.sdkman/candidates/java/11.0.4-zulu"
jhome_vm="/home/min/Dev/zuluJdk-11.0.4"

os=`uname -s`
host=`hostname`
cmd_javac=`command -v javac`
ver_java=0
msg_err=""

# Check java version
if [ -n "$cmd_javac" ]
then
    echo -e "Java environment is detected...\c"
    ver_java=`$cmd_javac -version 2>&1`
    echo -e "version is $ver_java\n"
    ver_java=`echo ${ver_java:6:4}`
    if [ "$?" != "0" ]
    then
        msg_err="Run expr command error!"
    fi
fi

# Setup java development envirnoment
if [ -z "$msg_err" ] && [ "$ver_java" != "$jversion" ]
then
    echo "No Java environment found or the version of Java is not supported."
    echo -e "Initialize JAVA environment......"
    if [ $USER == "min" ] && [ $host == "min-vm-elementary" ]       # At Linux VM host development
    then
        export JAVA_HOME=$jhome_vm
        echo -e "The java home has been set to $jhome_vm"
    elif [ $USER == "xiaoming" ] && [ $host == "minmac.local" ]   # At MacOS host development
    then
        export JAVA_HOME=$jhome_mac
        echo -e "The java home has been set to $jhome_mac"
    else
        msg_err="\nUnsupported user - $USER@$host, please reconfig the user"
    fi
    export PATH=$JAVA_HOME/bin:$PATH
    echo "Done JAVA environment initialization"
fi

if [ -n "$msg_err" ]
then
    echo -e "$msg_err"
fi
