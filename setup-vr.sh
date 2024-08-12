#!/bin/bash

#==============================================================================
# HELPER FUNCTIONS
#==============================================================================

check_prereq_exists() {
  # Test to see git is installed
  if ! command -v $1 &> /dev/null
  then
    if [ "$(apt list $1  2>/dev/null | grep -c "installed")" -lt 1 ]; then
      echo "$1 is not installed. Installing it now..."
      sudo apt install -y $1
    fi
  fi
}


#==============================================================================
# CONSTANTS
#==============================================================================

# define our list of prepreqs
prereqs=("python3-wheel-whl")

# Install Prereqs
echo [+] Checking for and installing prerequisites
for prereq in ${prereqs[@]}; do
  check_prereq_exists $prereq
done

# create the virtual environment
mkdir -p ~/.venvs
if [ ! -d "$HOME/.venvs/vr" ]; then
    python3 -m venv ~/.venvs/vr
fi

# activate the virtual environment
source $HOME/.venvs/vr/bin/activate

# install unblob
python3 -m pip install unblob
