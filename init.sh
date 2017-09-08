#!/usr/bin/env bash
# run this program as sudo
echo "
#!/usr/bin/env bash
# Execute script after any ssh connection :D
sh /whereuhaveplacedthessh.sh/ssh.sh" > /etc/profile.d/telegram-ssh.sh
