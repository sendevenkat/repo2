#!/bin/bash

echo "script its execitung" 
echo $env
echo $microsvc
if [[ $microsvc == "audit" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"900Mi""
elif [[ $microsvc == "audit" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1000Mi""

elif [[ $microsvc == "auditui" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"50Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1Gi""
elif [[ $microsvc == "auditui" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1Gi""

elif [[ $microsvc == "authentication" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"600Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "authentication" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "authorization" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "authorization" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "bcmconfigurationrules" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "bcmconfigurationrules" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "bcmregmonitoring" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "bcmregmonitoring" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "bcmregreporting" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "bcmregreporting" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "boardreporting" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "boardreporting" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "camundawrapper" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"3Gi""
elif [[ $microsvc == "camundawrapper" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"7Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "clamav" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"3Gi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"4Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"4Gi""
elif [[ $microsvc == "clamav" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"3Gi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"4Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"4Gi""

elif [[ $microsvc == "comments" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"2000Mi""
elif [[ $microsvc == "comments" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"850Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"1000m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"9""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "configserver" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"600Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1000Mi""
elif [[ $microsvc == "configserver" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"600Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"200m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1000Mi""

elif [[ $microsvc == "configuration" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "configuration" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "dataprovider" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "dataprovider" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "dlqprocessor" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "dlqprocessor" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"850Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "dlqprocessorui" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"50Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1Gi""
elif [[ $microsvc == "dlqprocessorui" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1Gi""

elif [[ $microsvc == "dmsdataintake" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "dmsdataintake" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "document" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1300Mi""
elif [[ $microsvc == "document" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1300Mi""

elif [[ $microsvc == "download" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1200Mi""
elif [[ $microsvc == "download" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1200Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"9""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1200Mi""

elif [[ $microsvc == "expensereporting" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"600Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "expensereporting" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"650Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "finreport" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "finreport" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"900m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "frpdfextraction" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"15Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "frpdfextraction" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"150Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "gateway" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "gateway" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "logging" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "logging" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"800Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "metadata" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "metadata" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"7Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"1000m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "notifieragent" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "notifieragent" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "pbireport" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "pbireport" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "regreporting" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1000Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "regreporting" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"1500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"7Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"2500Mi""
  
elif [[ $microsvc == "rrcollaboration" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "rrcollaboration" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "sbadmin" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "sbadmin" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "taxreporting" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "taxreporting" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"900Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"6""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "tracker" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"500Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"5""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""
elif [[ $microsvc == "tracker" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"10Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"150m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"30""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"7Gi""

elif [[ $microsvc == "trackerui" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"50Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1Gi""
elif [[ $microsvc == "trackerui" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"2Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"3""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"2""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1Gi""

elif [[ $microsvc == "zipkin" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"3Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "zipkin" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"700Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"5Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""

elif [[ $microsvc == "zipkinui" && $env == qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"1Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"50m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
elif [[ $microsvc == "zipkinui" && $env != qa* ]]; then
  echo "##vso[task.setvariable variable=MEMORY_REQUEST]"100Mi""
  echo "##vso[task.setvariable variable=MEMORY_LIMIT]"1Gi""
  echo "##vso[task.setvariable variable=CPU_REQUEST]"100m""
  echo "##vso[task.setvariable variable=MAX_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MIN_REPLICAS]"1""
  echo "##vso[task.setvariable variable=MEMORY_AUTOSCALE]"1500Mi""
else 
  echo "nothing to do"
fi
