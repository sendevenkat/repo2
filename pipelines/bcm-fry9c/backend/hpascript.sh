#!/bin/bash

echo "script its execitung" 
echo $env
echo $microsvc
if [[ $microsvc == "fry9c" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"30""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "fry9c" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"30""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "fry9cdataload" && $env = qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "fry9cdataload" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
else 
  echo "nothing to do"
fi
