# Init bare Ansible Role
Function_Check "agbare"
function agbare {
    ansible-galaxy init ansible-role-${1};
    cd ansible-role-${1};
    git init;
    git add .;
    git commit -m "Initial Commit";
}
