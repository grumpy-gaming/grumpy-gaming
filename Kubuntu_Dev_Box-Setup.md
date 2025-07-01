# Kubuntu Development Environment Setup Checklist

This checklist assumes a fresh installation of Kubuntu 24.04 LTS (Noble Numbat) or a very recent version. Adjust commands as necessary for older releases, though most will be the same.

---

## 1. Initial System Setup & Updates

* [ ] **Verify Installation & Basic Functionality:**
    * [ ] Check network connectivity (Wi-Fi/Ethernet).
    * [ ] Test sound output and input.
    * [ ] Verify display resolution and multi-monitor setup if applicable.
    * [ ] Ensure keyboard layout is correct.
* [ ] **System Updates:**
    * [ ] Open Konsole (terminal).
    * [ ] Run full system update:
        ```bash
        sudo apt update
        sudo apt full-upgrade -y
        sudo apt autoremove -y
        sudo apt autoclean
        ```
    * [ ] **Reboot** if kernel or critical system components were updated:
        ```bash
        sudo reboot
        ```

## 2. Essential Tools & Utilities

* [ ] **Build Essentials:** Install compilers and development libraries.
    ```bash
    sudo apt install build-essential -y
    ```
* [ ] **Git:** Version control system (usually pre-installed, but confirm).
    ```bash
    sudo apt install git -y
    ```
    * [ ] Configure Git (replace with your info):
        ```bash
        git config --global user.name "Your Name"
        git config --global user.email "your.email@example.com"
        git config --global init.defaultBranch main
        ```
* [ ] **cURL & Wget:** Command-line tools for transferring data.
    ```bash
    sudo apt install curl wget -y
    ```
* [ ] **htop/btop:** Advanced process viewer (btop is more modern and feature-rich).
    ```bash
    sudo apt install htop -y # Or use btop for a fancier alternative
    # For btop (if not in repos, check GitHub for installation instructions)
    # sudo apt install btop -y
    ```
* [ ] **Neofetch:** System information script (optional, but fun).
    ```bash
    sudo apt install neofetch -y
    ```
* [ ] **Archive Utilities:** For various archive formats.
    ```bash
    sudo apt install unrar unzip p7zip-full -y
    ```
* [ ] **Disk Usage Analyzer:** Helps visualize disk space usage (e.g., Baobab/Disk Usage Analyzer).
    ```bash
    sudo apt install baobab -y
    ```

## 3. Terminal & Shell Enhancements (Optional but Recommended)

* [ ] **Oh My Zsh!** (or Starship Prompt): For a powerful and customizable Zsh shell experience.
    * [ ] Install Zsh:
        ```bash
        sudo apt install zsh -y
        chsh -s $(which zsh)
        ```
        (Log out and back in, or reboot for Zsh to become default)
    * [ ] Install Oh My Zsh!:
        ```bash
        sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"
        ```
    * [ ] Install useful plugins (e.g., `zsh-autosuggestions`, `zsh-syntax-highlighting`):
        ```bash
        git clone [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone [https://github.com/zsh-users/zsh-syntax-highlighting.git](https://github.com/zsh-users/zsh-syntax-highlighting.git) ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        ```
        * Edit `~/.zshrc` to add them to `plugins=(...)` list.
        * Source `.zshrc`: `source ~/.zshrc`
* [ ] **Tmux/Screen:** Terminal multiplexer for persistent sessions.
    ```bash
    sudo apt install tmux -y
    ```

## 4. Development Environments & Runtimes

* [ ] **Node.js & npm (or pnpm/yarn):** For web development.
    * [ ] Recommended: Use `nvm` (Node Version Manager) for easy version switching.
        ```bash
        curl -o- [https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh](https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh) | bash
        ```
        * (Close and reopen terminal or `source ~/.bashrc` or `source ~/.zshrc`)
        * Install latest LTS: `nvm install --lts`
        * Set as default: `nvm alias default node`
    * [ ] Install `pnpm` or `yarn` (optional, if preferred over npm):
        ```bash
        npm install -g pnpm # or yarn
        ```
* [ ] **Python:** Usually comes pre-installed, but manage versions with `pyenv`.
    * [ ] Install `pyenv` dependencies:
        ```bash
        sudo apt install -y make build-essential libssl-dev zlib1g-dev \
        libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
        libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
        ```
    * [ ] Install `pyenv`:
        ```bash
        curl [https://pyenv.run](https://pyenv.run) | bash
        ```
        * (Follow instructions to add to shell RC file, then source RC file or restart terminal)
    * [ ] Install a Python version (e.g., 3.11.x): `pyenv install 3.11.x`
    * [ ] Set global default: `pyenv global 3.11.x`
* [ ] **Docker & Docker Compose:** Containerization.
    * [ ] Follow official Docker installation guide for Kubuntu/Ubuntu for the most up-to-date and secure method.
        * Remove old versions: `sudo apt remove docker docker-engine docker.io containerd runc`
        * Install dependencies:
            ```bash
            sudo apt install ca-certificates curl gnupg lsb-release -y
            ```
        * Add Docker's GPG key:
            ```bash
            sudo install -m 0755 -d /etc/apt/keyrings
            curl -fsSL [https://download.docker.com/linux/ubuntu/gpg](https://download.docker.com/linux/ubuntu/gpg) | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
            sudo chmod a+r /etc/apt/keyrings/docker.gpg
            ```
        * Add Docker repository:
            ```bash
            echo \
              "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) \
              "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
              sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
            ```
        * Install Docker Engine:
            ```bash
            sudo apt update
            sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
            ```
        * Add your user to the `docker` group (important for not using `sudo` with Docker):
            ```bash
            sudo usermod -aG docker $USER
            ```
            * **Log out and log back in** for group changes to take effect.
        * [ ] Test Docker: `docker run hello-world`
* [ ] **Java (Optional):** If needed for specific projects.
    * [ ] Recommended: Use `SDKMAN!` for managing Java, Scala, Kotlin, Groovy, etc.
        ```bash
        curl -s "[https://get.sdkman.io](https://get.sdkman.io)" | bash
        ```
        * (Follow instructions, then `source "$HOME/.sdkman/bin/sdkman-init.sh"`)
        * Install a JDK (e.g., OpenJDK 17 LTS): `sdk install java 17.0.10-tem` (check `sdk list java` for latest)
* [ ] **Other Languages/Runtimes (as needed):**
    * [ ] Go: `sudo apt install golang-go` (or download from official site)
    * [ ] Ruby: Use `rbenv` or `rvm` (similar to `pyenv`/`nvm`)
    * [ ] PHP: `sudo apt install php-cli php-fpm php-mysql php-curl php-json php-mbstring php-xml php-zip -y` (install specific modules as required)
    * [ ] .NET: Follow Microsoft's installation guide for Linux.

## 5. Development Tools & IDEs

* [ ] **Visual Studio Code (VS Code):** Highly recommended and popular.
    * [ ] Install via `snap` (easiest for updates):
        ```bash
        sudo snap install --classic code
        ```
    * [ ] Or via `.deb` package from official website.
    * [ ] Install essential extensions (e.g., GitLens, Docker, Prettier, ESLint, language-specific extensions).
* [ ] **JetBrains IDEs (Optional):** If you prefer commercial IDEs (IntelliJ IDEA, PyCharm, WebStorm, etc.).
    * [ ] Use JetBrains Toolbox App for easy management:
        * Download `jetbrains-toolbox-<version>.tar.gz` from JetBrains website.
        * Extract and run `./jetbrains-toolbox`.
* [ ] **DBeaver (Database Client - Optional):** Universal database tool.
    ```bash
    sudo snap install dbeaver-ce
    ```
* [ ] **Postman/Insomnia (API Testing - Optional):**
    ```bash
    sudo snap install postman # or insomnia
    ```
* [ ] **KDE Connect:** Integrate phone with desktop (for quick file sharing, notifications, etc.).
    ```bash
    sudo apt install kdeconnect -y
    ```

## 6. System Configuration & Optimization (Optional)

* [ ] **Laptop Mode Tools (Optional - for power saving):**
    ```bash
    sudo apt install laptop-mode-tools -y
    ```
    * Enable: `sudo systemctl enable laptop-mode`
    * Configure: `sudo nano /etc/laptop-mode/laptop-mode.conf` (adjust settings for power/performance)
* [ ] **Swap File/Partition:** If you didn't create a swap partition, a swap file is good.
    * Check if swap exists: `swapon --show`
    * If not, create (e.g., 8GB):
        ```bash
        sudo fallocate -l 8G /swapfile
        sudo chmod 600 /swapfile
        sudo mkswap /swapfile
        sudo swapon /swapfile
        echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
        ```
* [ ] **TLP (Advanced Power Management - Alternative to Laptop Mode Tools):**
    ```bash
    sudo apt install tlp tlp-rdw -y
    sudo systemctl enable tlp
    sudo tlp start
    ```
* [ ] **Font Installation:** Install popular developer fonts (e.g., Fira Code, JetBrains Mono, Hack) for better readability in terminals/IDEs.
    * Download from GitHub, extract, and copy `.ttf` or `.otf` files to `~/.local/share/fonts/` (create if doesn't exist).
    * Run `fc-cache -f -v` to update font cache.

## 7. Data Storage & Organization

* [ ] **Home Directory Organization:**
    * [ ] Create standard directories: `~/Projects`, `~/Work`, `~/Development`, etc. for your codebases.
    * [ ] Keep your `~/Documents`, `~/Downloads` clean.
* [ ] **Version Control Management:**
    * [ ] Clone your primary repositories into your designated project folders.
    * [ ] Generate SSH keys for Git (if using SSH for GitHub/GitLab/Bitbucket):
        ```bash
        ssh-keygen -t ed25519 -C "your.email@example.com"
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519
        ```
        * Add public key (`~/.ssh/id_ed25519.pub`) to your Git hosting provider.

## 8. Backup Strategy

* [ ] **Set up a Backup Solution:** Crucial for any development environment.
    * [ ] **Local Backup:** Use `rsync` scripts or tools like `FreeFileSync`, `Déjà Dup` (GNOME Disks Backup), or `Kup` (KDE backup solution) to an external drive.
    * [ ] **Cloud Backup (Optional):** Sync important config files (`dotfiles`), project directories to cloud storage (e.g., Dropbox, Google Drive, OneDrive client for Linux, Nextcloud).
    * [ ] **Dotfile Management:** Consider using a Git repository to manage your `~/.bashrc`, `~/.zshrc`, `~/.config/`, etc., for easy re-deployment.
