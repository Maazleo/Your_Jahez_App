# How to Deploy Your Flutter Web App to Vercel

Since we're encountering issues with GitHub integration, follow these manual steps to deploy your Flutter web app to Vercel:

## Option 1: Deploy via Vercel Dashboard

1. Go to [Vercel](https://vercel.com/) and sign in (you can use your GitHub account)
2. Click on "Add New..." > "Project"
3. Select "Import Third-Party Git Repository" and enter your GitHub username/repo or use the "Upload" option
4. If using Upload:
   - Download the `vercel-deploy` folder as a ZIP
   - Extract it locally
   - Upload the extracted folder to Vercel
5. In the configuration page:
   - Framework Preset: Select "Other"
   - Root Directory: Leave as default (/)
   - Build Command: Leave empty (we've already built the app)
   - Output Directory: Leave empty (files are already in the root)
6. Click "Deploy"

## Option 2: Use Vercel CLI (if you can run npm)

```bash
# Install Vercel CLI
npm install -g vercel

# Navigate to your build directory
cd vercel-deploy

# Deploy to Vercel (follow the prompts)
vercel
```

## Fixing 404 Errors

If you encounter 404 errors after deployment:

1. Make sure your `vercel.json` file has the correct configuration:
```json
{
  "version": 2,
  "routes": [
    { "src": "/(.*)", "dest": "/index.html" }
  ],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        { "key": "Cache-Control", "value": "public, max-age=0, must-revalidate" }
      ]
    },
    {
      "source": "/(.+\\.[a-zA-Z0-9]+)$",
      "headers": [
        { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
      ]
    }
  ]
}
```

2. In your Vercel project settings, ensure:
   - The "Output Directory" is set correctly (should be empty for our case)
   - The "Build Command" is empty (we've already built the app)

3. Try redeploying after making these changes 