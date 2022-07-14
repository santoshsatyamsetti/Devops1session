set -x
read -p "please enter the username to create:" USER_NAME
echo $USER_NAME
if [ -z $USER_NAME ]
then
        echo "invalid username. please enter proper username"
else
        echo "$USER_NAME is valid. lets create user"
fi
EX_USER=$(cat /etc/passwd | awk -F ":" '{print $1}' | grep -w $USER_NAME)
if [ "$USER_NAME" = "$EX_USER" ]
then
        echo "$USER_NAME already exist. please enter different name"
else
        echo "$USER_NAME doesn't exist. lets go to create"
        useradd -m $USER_NAME
        echo "$USER_NAME user has been created sucessfully..."
        USERID=$(cat /etc/passwd | grep -w $USER_NAME | awk -F ":" '{print $3}')
        echo "$USER_NAME userid is $USERID"
        echo "now changing the password"
        read -p "Please enter the password:" PASSWORD
        echo "$USERNAME:$PASSWORD" | chpasswd
        fi