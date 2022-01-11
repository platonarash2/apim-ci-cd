//*************************************************************************************
// PARAMS
//

@description('Location of resources')
param location string = 'northeurope'

@description('Virual Network Name')
param vnetName string = 'qa-my-vnet'


@description('APIM')
param apimName string = 'qa-apimarra'

//*************************************************************************************


// Vnet
module vnet './modules/vnet.bicep' = { 
  name: vnetName
  params: {
    vnetName: vnetName
    location: location
  }
}

// APIM 
module apim './modules/apim.bicep' = { 
  name: apimName
  params: {
    apimName: apimName
    location: location
    aseSubnetId: vnet.outputs.apimSubnetId
  }
}
