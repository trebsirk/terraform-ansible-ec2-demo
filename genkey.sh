ssh-keygen -t ed25519 -C "devops ssh"

cp ~/.ssh/id_ed25519 devops-ssh-key.pem 
chmod 400 devops-ssh-key.pem
# if you don't provision the ec2 with the public key with terraform
# then you can manually add the public key to the ~/.ssh/authorized_keys
# file on the ec2 instance. 
# note: ssh-copy-id only seems to be able to read files in ~/.ssh
# ssh-copy-id -i devops-ssh-key.pem 34.212.20.17 
# cp id_rsa.pem id_rsa.pub
ssh-copy-id -i ~/.ssh/id_rsa.pub 34.212.20.17
ssh-copy-id -i ~/.ssh/ansible.pub 34.212.20.17
ssh-copy-id -i ~/.ssh/ansible.pub ec2-user@34.212.20.17
ssh -i "devops-ssh-key.pem" ec2-user@ec2-35-86-141-187.us-west-2.compute.amazonaws.com
ssh -i devops-ssh-key.pem ec2-user@ec2-35-86-141-187.us-west-2.compute.amazonaws.com

ssh -i devops-ssh-key.pem ec2-user@54.201.98.144

# works
ssh -i devops-ssh-key.pem ec2-user@34.212.20.17

# for key-pairs with passcodes
alias ssha='eval $(ssh-agent) && ssh-add'

