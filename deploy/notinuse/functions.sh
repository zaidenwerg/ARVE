#!/bin/bash
#
#location: bin/funtions.sh

# [OS]
function get_distro() {
  LSBFILE=$(awk '/ID=/' /etc/*-release | sed 's/ID=//' | tr '[:upper:]' '[:lower:]')
    if [[ $LSBFILE == "centos" ]]; then

    elif [[ $LSBFILE == "unbuntu" ]]; then
      #statements
    fi
}


# [Ansible] Installing Ansible prereqs
function validate_ansible_reqs() {
  for pkg in sshpass python-netaddr python-yaml python-support python-jinja2 python-paramiko python-markupsafe;
    do
        is_package_installed ${pkg} || install_package ${pkg}
        is_package_installed ${pkg} || (echo "Error installing packages '${pkg}'" && exit 2)
    done
}
# [Ansible]
function install_package() {
  echo "Installing package '${@}'" | tee -a ${LOG_FILE}
  if [[ condition ]]; then
    apt-get install "$@" -y --force-yes
  elif [[ condition ]]; then
    #statements
  fi
}
