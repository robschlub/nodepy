#!/usr/bin/env sh

PROJECT_NAME=nodepy

red=`tput setaf 1`
green=`tput setaf 2`
cyan=`tput setaf 6`
bold=`tput bold`
reset=`tput sgr0`

LINE_LEN=80
# Check current build status and exit if in failure state
check_status() {
  if [ $? != 0 ];
    then
    echo "${bold}${red}Build failed at" $1 "${reset}"
    exit 1    
  fi
  echo "${bold}${cyan}""$(nchars '=' $LINE_LEN)"
}

nchars() {
  OUTPUT=''
  for i in $(seq 0 $2)
  do
    OUTPUT=$OUTPUT$1
  done
  echo $OUTPUT
}

title() {
  TOTAL_LEN=$LINE_LEN
  STR_LEN=${#1}
  NUM_CHARS=$((($TOTAL_LEN-$STR_LEN-2)/2))
  echo "${cyan}${bold}"$(nchars "=" $NUM_CHARS) $1 $(nchars "=" $NUM_CHARS)"${reset}"
}

# Check there is something to build
if [ -z "${1}" ];
  then
  echo "Build failed - select a build:"
  echo "   ./build.sh ${bold}${cyan}base${reset}"
  echo "   ./build.sh ${bold}${cyan}dev${reset}"
  exit 1
fi

# Build base image
if [ $1 = "base" ];
  then
  title "Building Base Image"
  cp base/Dockerfile .
  docker build -t $DOCKER_HUB_USERNAME/$PROJECT_NAME .
  check_status "Building Base Image"
  rm Dockerfile
  title "Pushing Base Image"
  docker push $DOCKER_HUB_USERNAME/nodepy
  exit 0
fi

# Build dev image
if [ $1 = dev ];
  then
  title "Building Dev Image"
  cp dev/Dockerfile .
  docker build -t $DOCKER_HUB_USERNAME/$PROJECT_NAME:dev .
  check_status "Building Dev Image"
  rm Dockerfile
  title "Pushing Dev Image"
  docker push $DOCKER_HUB_USERNAME/nodepy:dev
  check_status "Building Dev Image"
  exit 0
fi

echo "Image ${bold}${cyan}$1${reset} doesn't exist"