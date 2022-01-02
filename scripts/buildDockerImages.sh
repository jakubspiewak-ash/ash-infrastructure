#!/usr/bin/env bash
declare -a projects=(
"ash-api-gateway"
"ash-auth-service"
"ash-discovery-service"
"ash-expense-service"
"ash-user-service"
)

for project in "${projects[@]}"
do
  echo "${project}"
  gradle bootBuildImage -b ../../"${project}"/build.gradle
done

