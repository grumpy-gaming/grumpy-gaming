
# PowerShell script to set up a portable dev box on ARM Windows

# Install Git
winget install --id Git.Git -e

# Install Node.js (LTS)
winget install --id OpenJS.NodeJS.LTS -e

# Install Visual Studio Code (Insiders ARM build)
winget install --id Microsoft.VisualStudioCode.Insiders -e

# Install GitHub CLI
winget install --id GitHub.cli -e

# Install http-server via npm
npm install -g http-server

# Optional: Install WSL (Windows Subsystem for Linux)
wsl --install
