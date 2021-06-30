# aks-versions
Tracking Repository for Azure Service Versions

## How to Use

```
k8s_version                = "1.20.7" # renovate: depName=Kubernetes extractVersion=^aks-(?<version>.*)$
```

Renovate:
```
"regexManagers": [
    {
      "fileMatch": ["terraform\\.tfvars$"],
      "matchStrings": [
        "k8s_version\\s+=\\s+\"(?<currentValue>.*?)\" # renovate: depName=(?<depName>.*?)\\s+extractVersion=(?<extractVersion>.*?)\n"
      ],
      "lookupNameTemplate": "fikaworks/azure-versions",
      "datasourceTemplate": "github-tags"
    }
]
```
