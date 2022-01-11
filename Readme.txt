az deployment group create  -g dev-apim -f main-all.bicep --what-if

az deployment group create  -g qa-apim -f main-all.bicep --what-if
