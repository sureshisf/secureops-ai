# SecureOps AI — Azure Terraform deployment

## Prerequisites
- Terraform >= 1.5, Azure CLI, Git, VS Code
- Azure subscription permission to create resource groups and Static Web Apps
- GitHub repository: `sureshisf/secureops-ai` containing Vite app at repository root

## Deploy infrastructure from VS Code PowerShell
```powershell
az login
az account set --subscription "YOUR-SUBSCRIPTION-ID"
$env:TF_VAR_subscription_id = (az account show --query id -o tsv)
cd terraform
terraform init
terraform fmt
terraform validate
terraform plan -out=secureops.tfplan
terraform apply secureops.tfplan
terraform output app_url
```

**If you already created** `rg-secureops-dev` or `secureops-ai-dev` through the portal, do not run `apply` on duplicates. Import existing resources or choose new names.

## Connect GitHub Actions deployment
1. In Azure Portal, open Static Web App `secureops-ai-dev` > **Manage deployment token** (label can vary) and copy the token.
2. In GitHub repository `sureshisf/secureops-ai` > Settings > Secrets and variables > Actions > New repository secret, create `AZURE_STATIC_WEB_APPS_API_TOKEN` and paste token. Never commit the token.
3. Copy `.github/workflows/deploy-static-web-app.yml` to the **root of your existing application repository** (same relative path). Do not replace your app files.
4. Commit and push workflow and application. GitHub Actions will build with Vite and deploy `dist`.
5. Check GitHub Actions, then run `terraform output app_url` to open the app.

The Static Web App resource does not itself publish app files. Terraform creates infrastructure; GitHub Actions deploys frontend code. This workflow is for Vite apps whose `package.json` is at repository root.

## Cost and security
- Static Web Apps **Free** tier; no database, VM, AKS, or paid AI service.
- Monitor Azure subscription spending; budget alerts do **not** hard-cap charges.
- Terraform local state can contain sensitive data; keep state files out of Git and protect the workstation. For a team, migrate to secure remote state.
- This deployment is a demo, not production hardened.

## Clean up
```powershell
terraform destroy
```
Review the destroy plan carefully. It removes resources managed by this Terraform state.
