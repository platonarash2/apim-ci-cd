//*************************************************************************************

@description('Vnet name')
param vnetName string

@description('Vnet name')
param location string

//*************************************************************************************



resource myVnet 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '192.168.250.0/23'
        '192.168.0.0/26'
      ]
    }
    subnets: [
      {
        name: 'akv'
        properties: {
          addressPrefix: '192.168.251.16/29'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'apim'
        properties: {
          addressPrefix: '192.168.251.0/29'
          networkSecurityGroup: {
            id: apim_nsg.id
          }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'ase'
        properties: {
          addressPrefix: '192.168.250.0/24'
          delegations: [
            {
              name: 'arraasev34-delegation'
              properties: {
                serviceName: 'Microsoft.Web/hostingEnvironments'
              }
            }
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '192.168.0.0/26'
          // routeTable: {
          //   id: '/subscriptions/e9aac0f0-83bd-43cf-ab35-c8e3eccc8932/resourceGroups/test34/providers/Microsoft.Network/routeTables/_e41f87a2_AZBST_RT_72d9e813-fa4a-48ee-a5f6-c7387f2f5f13'
          // }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'cosmosdb'
        properties: {
          addressPrefix: '192.168.251.112/29'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'eventhub'
        properties: {
          addressPrefix: '192.168.251.80/29'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'jumpbox'
        properties: {
          addressPrefix: '192.168.251.32/29'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'monitor'
        properties: {
          addressPrefix: '192.168.251.64/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'servicebus'
        properties: {
          addressPrefix: '192.168.251.48/29'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'storage'
        properties: {
          addressPrefix: '192.168.251.96/29'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'iothub'
        properties: {
          addressPrefix: '192.168.251.128/28'
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource myVnet_akv 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'akv'
  properties: {
    addressPrefix: '192.168.251.16/29'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_apim 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'apim'
  properties: {
    addressPrefix: '192.168.251.0/29'
    networkSecurityGroup: {
      id: apim_nsg.id
    }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_ase 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'ase'
  properties: {
    addressPrefix: '192.168.250.0/24'
    delegations: [
      {
        name: 'arraasev34-delegation'
        properties: {
          serviceName: 'Microsoft.Web/hostingEnvironments'
        }
      }
    ]
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_AzureBastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'AzureBastionSubnet'
  properties: {
    addressPrefix: '192.168.0.0/26'
    // routeTable: {
    //   id: '/subscriptions/e9aac0f0-83bd-43cf-ab35-c8e3eccc8932/resourceGroups/test34/providers/Microsoft.Network/routeTables/_e41f87a2_AZBST_RT_72d9e813-fa4a-48ee-a5f6-c7387f2f5f13'
    // }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_cosmosdb 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'cosmosdb'
  properties: {
    addressPrefix: '192.168.251.112/29'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_eventhub 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'eventhub'
  properties: {
    addressPrefix: '192.168.251.80/29'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_iothub 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'iothub'
  properties: {
    addressPrefix: '192.168.251.128/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_jumpbox 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'jumpbox'
  properties: {
    addressPrefix: '192.168.251.32/29'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_monitor 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'monitor'
  properties: {
    addressPrefix: '192.168.251.64/28'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_servicebus 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'servicebus'
  properties: {
    addressPrefix: '192.168.251.48/29'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}

resource myVnet_storage 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' = {
  parent: myVnet
  name: 'storage'
  properties: {
    addressPrefix: '192.168.251.96/29'
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
}


resource apim_nsg 'Microsoft.Network/networkSecurityGroups@2020-11-01' = {
  name: 'apim-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Port_443'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'Internet'
          destinationAddressPrefix: '192.168.251.0/29'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_80'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: 'Internet'
          destinationAddressPrefix: '192.168.251.0/29'
          access: 'Allow'
          priority: 110
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_3443_APIM_Management'
        properties: {
          description: 'https://docs.microsoft.com/en-us/azure/api-management/api-management-using-with-vnet?tabs=stv2'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '3443'
          sourceAddressPrefix: 'ApiManagement'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 120
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_Storage'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'Storage'
          access: 'Allow'
          priority: 130
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_AAD'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'AzureActiveDirectory'
          access: 'Allow'
          priority: 140
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_SQL'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '1433'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'Sql'
          access: 'Allow'
          priority: 150
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_AKV'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'AzureKeyVault'
          access: 'Allow'
          priority: 160
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_EventHub'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'EventHub'
          access: 'Allow'
          priority: 170
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '5671'
            '5672'
            '443'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_445_Git'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '445'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'Storage'
          access: 'Allow'
          priority: 180
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_Health_Monitoring'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'AzureCloud'
          access: 'Allow'
          priority: 190
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '443'
            '12000'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_AzureMonitor'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'AzureMonitor'
          access: 'Allow'
          priority: 200
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '1886'
            '443'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_SMTP'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'Internet'
          access: 'Allow'
          priority: 210
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: [
            '25'
            '587'
            '25028'
          ]
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_Redis'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '6381-6383'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 220
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_4290'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '4290'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 230
          direction: 'Outbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_Redis_inbound'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '6381-6383'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 130
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_4290_inbound'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '4290'
          sourceAddressPrefix: 'VirtualNetwork'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 140
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'Port_6390_inbound'
        properties: {
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '6390'
          sourceAddressPrefix: 'AzureLoadBalancer'
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 150
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

output Id string = myVnet.id
output storageSubnetId string = myVnet_storage.id
output aseSubnetId string = myVnet_ase.id
output iothubSubnetId string = myVnet_iothub.id
output akvSubnetId string = myVnet_akv.id
output servicebusSubnetId string = myVnet_servicebus.id
output apimSubnetId string = myVnet_apim.id
