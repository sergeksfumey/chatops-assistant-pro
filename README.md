# AI-Powered ChatOps Assistant for Infrastructure Management

A smart, secure, and cloud-native **ChatOps Assistant** that lets you manage infrastructure using natural language commands via Microsoft Teams or Slack. It integrates with Azure Function Apps, OpenAI, Terraform, Azure Monitor, Sentinel, and Logic Apps for automation, telemetry, and self-healing workflows.

---

## Features

- Natural Language Command Parsing with OpenAI  
- Azure Function App Backend (Python)  
- Slack & Teams Integration  
- Secure RBAC-Based Access Control  
- Real-Time System Health via Log Analytics (KQL)  
- Self-Healing with Azure Automation & Logic Apps  
- GitHub Actions CI/CD Pipeline  
- Dockerized Local Development  
- Azure Sentinel Integration for Threat Detection  

---

## Tech Stack

| Component         | Technology                          |
|------------------|-------------------------------------|
| Chat Interface    | Slack SDK / Teams Bot Framework     |
| Command Engine    | Azure Functions (Python)            |
| Infra Execution   | Azure CLI / PowerShell              |
| NLP Engine        | OpenAI GPT (via API)                |
| Monitoring        | Azure Monitor, Log Analytics        |
| Security & SIEM   | Microsoft Sentinel                  |
| Auto-Remediation  | Azure Logic Apps / Automation       |
| IaC Provisioning  | Terraform                           |
| CI/CD             | GitHub Actions                      |

---

## Project Structure

```
chatops-assistant-pro/
├── terraform/                 # Infra as Code
├── azure-function/           # Azure Function backend
├── slack-teams-bot/          # Bot integrations
├── openai-integration/       # GPT prompt + logic
├── rbac/                     # Access control
├── docker/                   # Local container dev
├── auto-remediation/         # Logic Apps & Runbooks
├── log-analytics/            # KQL telemetry
├── .github/workflows/        # GitHub Actions
└── README.md
```

---

## Setup & Deployment

### 1️. Clone This Repo

```bash
git clone https://github.com/your-username/chatops-assistant-pro.git
cd chatops-assistant-pro
```

### 2. Deploy Azure Resources with Terraform

```bash
cd terraform
terraform init
terraform apply
```

### 3️. Configure `.gitignore`

Ensure the following are included:

```gitignore
.terraform/
*.tfstate
*.tfstate.*
local.settings.json
*.PublishSettings
.env
```

### 4️. Set OpenAI API Key

In `azure-function/local.settings.json`:

```json
{
  "IsEncrypted": false,
  "Values": {
    "AzureWebJobsStorage": "UseDevelopmentStorage=true",
    "FUNCTIONS_WORKER_RUNTIME": "python",
    "OPENAI_API_KEY": "your-openai-key"
  }
}
```

### 5️. Run Locally

```bash
cd azure-function
func start
```

### 6️. Or Run with Docker

```bash
docker build -t chatops-assistant .
docker run -p 8080:80 chatops-assistant
```

---

## Example ChatOps Commands

| User Query                      | Action                            |
|--------------------------------|-----------------------------------|
| `restart vm01`                 | Restart Azure VM                  |
| `get CPU usage of vm02`        | Query Azure Monitor               |
| `top 5 high memory VMs`        | Run KQL via Log Analytics         |
| `any security alerts?`         | Pull alerts from Microsoft Sentinel |

---

## Security Practices

- Role-Based Access Control (RBAC)
- Secret Scanning and Blocking
- Terraform state and sensitive files excluded
- Integration with Azure Monitor and Sentinel

---

## Auto-Remediation Features

- CPU or memory alerts trigger:
  - Azure Automation Runbooks
  - Logic Apps workflows
- Self-healing responses:
  - Restart VMs
  - Notify via Slack or Teams
  - Log to Application Insights

---

## CI/CD with GitHub Actions

- Auto-deploy Azure Functions on push
- Publish profile stored as GitHub secret
- CI pipeline defined in `.github/workflows/deploy.yml`

---

## Future Enhancements

- [ ] Azure Key Vault Integration for Secrets
- [ ] Extend Self-Healing to AKS, App Services
- [ ] Add Support for Microsoft Sentinel Playbooks
- [ ] Power BI Dashboards for System Health

---

## Author

**Serge Fumey**  
[GitHub](https://github.com/sergeksfumey) • [LinkedIn](https://linkedin.com/in/sergeksfumey)

---

## 📄 License

MIT License. See `LICENSE` file for more information.