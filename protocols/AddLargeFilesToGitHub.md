# Adding large (>25MB) files to GitHub Repositories

GitHub has a browser upload file size limit of 25MB, but allows files up to 100MB to be committed through the Git command line tools.

## On Ubuntu
### Initial Setup
#### Install Git

```bash
sudo apt update
sudo apt install git
```

#### Set Identity

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

#### Generate SSH key

```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
```
On the GitHub website, go to Settings → SSH and GPG keys → New SSH key. Give the key a name, and paste in the entire contents provided by the above cat command.

### Committing Files
#### Clone the repository
The link to use can be found by navigating to the repository on the browser, then Code → HTTPS

```bash
git clone git@github.com:yourusername/repository.git
cd repository
```

#### Add large files
Drag your files into the cloned repository
```bash
git add .
```

#### Commit files
```
git commit -m "Add large files"
git push
```
