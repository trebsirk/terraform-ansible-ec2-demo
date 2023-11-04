git init .
10515  git branch -m main
10516  git status
10517  git config --global init.defaultBranch main

git remote add origin git@github.com:trebsirk/terraform-ansible-ec2-demo.git\ngit branch -M main\ngit push -u origin main
10535* 

git update-ref -d HEAD

ssh -i devops-ssh-key.pem ec2-user@34.212.20.17
IP=34.212.20.17
${IP}

ansible all --key-file ./devops-ssh-key.pem -i inventory.ini -m ping -u ec2-user
# same, but with some args in ansible.cfg
ansible all -m ping -u ec2-user
ansible all --list-hosts
ansible all -m gather_facts
# doesn't work
ansible all -m apt -a update_cache=true
ansible all -m yum -a upgrade --become --ask-become-pass -u ec2-user
# works
ansible all -m yum -a update_cache=true -u ec2-user
# pass is blank on new ec2 instances, so just press enter when prompted
ansible all -m yum -a "name=nmap state=latest" -u ec2-user --become --ask-become-pass



