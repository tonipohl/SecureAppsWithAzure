# Secure Apps With Azure

Azure is Microsoft's platform to integrate company applications and workloads into the Microsoft 365 world. If you run applications in the cloud, Azure offers several services to secure them.  

This repository aims to provide some ideas and examples from real life scenarios of using Azure Identity and Platform as a Service, such as App Services, Logic Apps, Key Vault and other Azure resources to protect your data, your applications, and other solutions.  

This information is aimed at administrators and developers who want to learn more about the many services in Microsoft Azure in order to implement their applications and make them secure.

You can find an article how to use a Key Vault with a System Managed Identity and an Azure Logic App at https://blog.atwork.at/post/Azure-Logic-Apps-using-Key-Vault-and-Managed-Identity and the Logic App sample ([here](./LogicApps/GetManager.json).  

A blogpost will follow at https://blog.atwork.at describing step-by-step how to use modern auth with creating a certificate and using that in Azure Automation Accounts. I will update this information and provide the direct link here.

## Registration

https://forms.office.com/r/GEJ6yxAK8j	Form for Trial PROD
https://forms.office.com/r/m5NMyZy17M	Form for Trial DEV

Form startet eine Logic App mit Approval (to be documented) und schreibt in die jeweilige SQL Datenbank.
## Backend (alt)

URL	Azure Website Type
https://admin.governancetoolkit365.com	            governancetoolkit365backend	PROD
https://registerdev.governancetoolkit365.com	    governancetoolkit365backend-dev	DEV

## GT365 App Registration PRODUCTION

1. App
https://bit.ly/gt365app1  
short url for:  
https://login.microsoftonline.com/common/oauth2/authorize?client_id=f6108159-1168-475d-b3ca-be8104781bf8&response_type=code&resource=https://management.azure.com/&redirect_uri=https://register.governancetoolkit365.com/&response_mode=query&scope=openid&state=powerapps

2. App
https://bit.ly/gt365app2  
short url for:  
https://login.microsoftonline.com/common/oauth2/authorize?client_id=f6108159-1168-475d-b3ca-be8104781bf8&response_type=code&resource=https://analysis.windows.net/powerbi/api&redirect_uri=https://register.governancetoolkit365.com/&response_mode=query&scope=openid&state=powerbi

## GT365 App Registration DEVELOPMENT

3. App
https://bit.ly/gt365app1dev  
short url for:  
https://login.microsoftonline.com/common/oauth2/authorize?client_id=f6108159-1168-475d-b3ca-be8104781bf8&response_type=code&resource=https://management.azure.com/&redirect_uri=https://governancetoolkit365backend-registration-dev.azurewebsites.net/&response_mode=query&scope=openid&state=powerapps

4. App  
https://bit.ly/gt365app2dev  
short url for:  
https://login.microsoftonline.com/common/oauth2/authorize?client_id=f6108159-1168-475d-b3ca-be8104781bf8&response_type=code&resource=https://management.azure.com/&redirect_uri=https://governancetoolkit365backend-registration-dev.azurewebsites.net/&response_mode=query&scope=openid&state=powerbi
  
to be continued...  


