
az group create -g prod-apim -l northeurope

az deployment group create  -g prod-apim -f main-all.bicep --what-if


