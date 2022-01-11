
//*************************************************************************************

@description('Required. Existing Azure API Management Name.')
param apimName string = 'qa-apimarra'

//*************************************************************************************


// Existing APIM - DEV, QA, PROD depedning on branch
resource apim 'Microsoft.ApiManagement/service@2021-04-01-preview' existing = {
  name: apimName
}


resource api 'Microsoft.ApiManagement/service/apis@2021-04-01-preview' = {
  parent: apim
  name: 'DEVGROUP2-petstore'
  properties:{
    displayName: 'DEVGROUP2-petstore'
    description:'This is a Pet Store API'
    serviceUrl: 'https://petstore.swagger.io/v2'
    format: 'openapi+json-link'
    value: 'https://petstore.swagger.io/v2/swagger.json'
    path: '/devgroup2-petstore'
    protocols:[
      'https'
    ]
    type:'http'
    apiType:'http'
    subscriptionRequired:true
  }
}


var api_policy_xml  = '''
<policies>
    <inbound>
        <set-query-parameter name="code" exists-action="override">
            <value>Notused-DEVGROUP2</value>
        </set-query-parameter>
        <base />
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
'''

var api_policy_format = 'rawxml'


resource apiPolicy 'Microsoft.ApiManagement/service/apis/policies@2019-01-01' = {
  parent: api
  name: 'policy'
  properties: {
    value: api_policy_xml
    format: api_policy_format
  }
}

