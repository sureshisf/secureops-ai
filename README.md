# SecureOps AI — Azure prototype

Interactive demo with 6 screens, simulated security findings, framework readiness, and a 30-day remediation roadmap. No credentials, backend, real cloud scanning, or live remediation.

## Run locally
Install Node.js 20+ then:
```bash
npm install
npm run dev
```
Open the URL printed by Vite.

## Deploy to Azure Static Web Apps (Free)
1. Create a GitHub repository and push this folder.
2. In Azure Portal, create **Static Web App** and select **Free**.
3. Connect GitHub and select your repository and branch.
4. Choose **Custom** build preset; App location `/`, API location blank, Output location `dist`.
5. Save. GitHub Actions builds and deploys the site. View the URL in Azure Portal.

Build command: `npm run build`. Vite writes to `dist`.

## Budget safety
Use the Free hosting plan. Set Azure Cost Management budget alerts at $10, $15, and $20; alerts are not hard caps. Do not add paid databases, VMs, AI endpoints, or production scanning for this prototype.

## Security warning
All findings, framework percentages, remediation buttons and forecasts are simulated. Do not enter credentials or real customer data. This is not an actual compliance assessment.
