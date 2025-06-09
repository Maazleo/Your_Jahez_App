# How to Upload Your Code to GitHub

This guide will help you upload your KnowYourJahez app code to your GitHub repository.

## Prerequisites

1. [Git](https://git-scm.com/downloads) installed on your computer
2. A GitHub account (you already have one at https://github.com/Maazleo)
3. Your repository created at https://github.com/Maazleo/Your_Jahez_App.git

## Step-by-Step Instructions

### 1. Initialize Git in Your Project (if not already done)

Open a terminal or command prompt in your project directory and run:

```bash
git init
```

### 2. Add Your GitHub Repository as Remote

```bash
git remote add origin https://github.com/Maazleo/Your_Jahez_App.git
```

### 3. Add All Files to Git

```bash
git add .
```

### 4. Commit Your Changes

```bash
git commit -m "Initial commit: KnowYourJahez anti-dowry awareness app"
```

### 5. Push to GitHub

```bash
git push -u origin main
```

If you get an error about the branch name, try:

```bash
git push -u origin master
```

Then rename the branch on GitHub to "main" if needed.

## Uploading an APK Release

### 1. Build the APK

```bash
flutter build apk --release
```

This will create an APK at `build/app/outputs/flutter-apk/app-release.apk`

### 2. Copy the APK to the Releases Directory

```bash
cp build/app/outputs/flutter-apk/app-release.apk releases/KnowYourJahez_v1.0.0.apk
```

### 3. Commit and Push the APK

```bash
git add releases/KnowYourJahez_v1.0.0.apk
git commit -m "Add APK release v1.0.0"
git push
```

### 4. Create a GitHub Release (Optional)

1. Go to your repository on GitHub
2. Click on "Releases" on the right sidebar
3. Click "Create a new release"
4. Set the tag version (e.g., v1.0.0)
5. Add a release title and description
6. Upload the APK file
7. Click "Publish release"

## Troubleshooting

### Authentication Issues

If you're prompted for credentials and have trouble authenticating:

1. Generate a personal access token on GitHub:
   - Go to GitHub → Settings → Developer settings → Personal access tokens
   - Generate a new token with "repo" permissions
   - Use this token as your password when prompted

### Large File Issues

If you have large files that exceed GitHub's file size limit:

1. Add them to .gitignore
2. Consider using Git LFS for large files
3. Or host large files elsewhere and provide download links

## Keeping Your Repository Updated

Whenever you make changes to your code:

```bash
git add .
git commit -m "Description of your changes"
git push
```

## Need Help?

If you encounter any issues, refer to:
- [GitHub Documentation](https://docs.github.com/en)
- [Git Documentation](https://git-scm.com/doc)
- Stack Overflow for specific error messages 