export REMOTE_SERVER="192.168.118.131"
export REMOTE_WORKSPACE="/home/user/workspace"
export LOCAL_WORKSPACE="/Users/user/workspace"
export PROJECT_NAME="bcl"

function runInRemote() {
	remote_file_name=$(basename "$1")
	chmod +x /tmp/remove.tmp
	scp $1 $REMOTE_SERVER:/tmp/ > /dev/null
	ssh $REMOTE_SERVER chmod +x /tmp/$remote_file_name
	ssh $REMOTE_SERVER /tmp/$remote_file_name
	ssh $REMOTE_SERVER rm /tmp/$remote_file_name
	rm $1
}
function message() {
	echo "=========================================================="
	echo $1
	echo "=========================================================="
}

message "Remove the old code ($REMOTE_SERVER:$REMOTE_WORKSPACE/$PROJECT_NAME) from remote"
ssh $REMOTE_SERVER rm -rf $REMOTE_WORKSPACE/$PROJECT_NAME

message "SCP $LOCAL_WORKSPACE/$PROJECT_NAME $REMOTE_SERVER:$REMOTE_WORKSPACE/$PROJECT_NAME"
scp -r $LOCAL_WORKSPACE/$PROJECT_NAME $REMOTE_SERVER:$REMOTE_WORKSPACE/$PROJECT_NAME >/tmp/scp.log

message "Build the remote code"
cat > /tmp/remove.tmp << "EOF"
export REMOTE_WORKSPACE="/home/user/workspace"
export PROJECT_NAME="bcl"

cd $REMOTE_WORKSPACE/$PROJECT_NAME
pwd
./build.sh
EOF

runInRemote /tmp/remove.tmp

message "Copy the code to remote"