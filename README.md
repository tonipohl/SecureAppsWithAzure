# Secure Apps With Azure

Azure is Microsoft's platform to integrate company applications and workloads into the Microsoft 365 world. If you run applications in the cloud, Azure offers several services to secure them.  

This repository aims to provide some ideas and examples from real life scenarios of using Azure Identity and Platform as a Service, such as App Services, Logic Apps, Key Vault and other Azure resources to protect your data, your applications, and other solutions.  

This information is aimed at administrators and developers who want to learn more about the many services in Microsoft Azure in order to implement their applications and make them secure.

You can find an article how to use a Key Vault with a System Managed Identity and an Azure Logic App at https://blog.atwork.at/post/Azure-Logic-Apps-using-Key-Vault-and-Managed-Identity and the Logic App sample ([here](./LogicApps/GetManager.json).  

## Automate Exchange Online at Scale

This repository includes samples for the session "Automate Exchange Online at Scale" held together with [@magrom](http://twitter.com/magrom) at [Microsoft Exchange Community Airlift](https://mecairlift.event.microsoft.com/ ) in September 2022.

## Using System Managed Identity

In this screenshot, we see an Azure Logic App using a System Managed Identity to access a resource in the Microsoft Graph REST API.

![using-managed-identity.png](./LogicApps/using-managed-identity.png)

Don´t forget to add the required permissions to the app or to the Azure resource.

## More to come

We will update this repository from time to time with additional samples. Pls. check blogposts at https://blog.atwork.at with step-by-step How-To´s, such as how to use modern auth with creating a certificate and using that in Azure Automation Accounts.
