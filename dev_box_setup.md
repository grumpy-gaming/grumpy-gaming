# Dev Box Setup Checklist

## Essential Tools for Web Development on Windows ARM Laptop

### 1. Windows Updates & Cleanup
- [ ] Finish all Windows updates
- [ ] Defrag and clean up disk
- [ ] Remove bloatware or unnecessary startup apps

### 2. Install Git for Windows
- [ ] Download Git
- [ ] During setup:
  - Choose “Use Git from the command line and also from 3rd-party software”
  - Enable Git Credential Manager (for GitHub access)

### 3. Install Node.js (ARM-compatible)
- [ ] Download Node.js LTS
- [ ] Install Node.js to get `npm` for installing tools like `http-server`

### 4. Install Visual Studio Code (Insiders ARM Build)
- [ ] VS Code Insiders for ARM
- [ ] Install extensions:
  - [ ] Live Server
  - [ ] GitLens
  - [ ] Prettier
  - [ ] HTML/CSS/JS support

### 5. Install a Web Browser (Edge or Chrome Canary ARM)
- [ ] Use for testing your app and accessing GitHub
- [ ] Edge is pre-installed and optimized for ARM

### 6. Install `http-server` (via npm)
- [ ] Open terminal and run:
  ```bash
  npm install -g http-server
  ```
