#/bin/bash
#
# Demo deploy
#
resource_group=$1
deploy_name=$(date '+m%d%H%M')

az group deployment create --resource-group $resource_group --template-file azuredeploy.json --parameters @parameters.json --mode incremental --name $deploy_name
