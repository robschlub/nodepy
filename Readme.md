# Base
Image with Node.js with Python 3
Based on official Node JS 10.8.0-slim and Python 3.6.6-slim Dockerfiles.


# Dev
all node packages required for dev
all python packages required for dev


# To use in git:
git clone https://github.com/robschlub/nodepy


# First setup the DOCKER_HUB_USERNAME
export DOCKER_HUB_USERNAME=[enter_user_name_here]


# To build locally:
./build.sh base
./build.sh dev


# To enter an environment (docker container) to test
./start_env dev
./start_env base



# To build and push to docker hub:
./build.sh base deploy
./build.sh dev deploy

Or

Pull request branch into master, Travis will deploy


# Updating:

# To update npm packages:
cd nodepy
./start_env.sh dev
npm outdated
Go through each package and:
  npm install [package name]@latest
cp package* temp
exit container
cp temp/package* dev
./start_env.sh dev (to regenerate with new package.json)


# To update python packages:
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
pip freeze
copy and paste all lines into nodepy/dev/requirements.txt
./start_env.sh dev (to regenerate with new requirements.txt)


# To test in local environment:
./build.sh dev
cd dev_environment
./start_env.sh dev
