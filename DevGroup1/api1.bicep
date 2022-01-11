
//*************************************************************************************

@description('Required. Existing Azure API Management Name.')
param apimName string

//*************************************************************************************


// Existing APIM - DEV, QA, PROD depedning on branch
resource apim 'Microsoft.ApiManagement/service@2021-04-01-preview' existing = {
  name: apimName
}


resource api 'Microsoft.ApiManagement/service/apis@2021-04-01-preview' = {
  parent: apim
  name: 'petstore'
  properties:{
    description:'This is a Pet Store API'
    serviceUrl: 'https://weatherapi-func.azurewebsites.net/api'
    format: 'openapi+json-link'
    value: 'https://petstore.swagger.io/v2/swagger.json'
    path: '/petstore'
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
            <value>Notused</value>
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

