
# Full-Stack Secure Development (fullstack-secure)

A comprehensive development environment with SSH server, HTML/web tools, encryption utilities, and token management.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Base image variant: | string | ubuntu-24.04 |
| nodeVersion | Node.js version for HTML/web development: | string | lts |

This template provides a complete development environment with:

## Included Features

### SSH Server
- **sshd feature**: Provides SSH server functionality for secure remote access
- Default SSH port forwarding on port 2222
- Configured with SSH agent socket support

### HTML/Web Development Tools
- **Node.js**: Installed via devcontainer features with configurable version
- **Web Servers**: http-server, serve, and live-server installed globally
- **VS Code Extensions**: ESLint, Prettier, Live Server, Auto Close/Rename Tag
- Default port forwarding on 8080 and 3000 for web development

### Encryption Utilities
- **OpenSSL**: Industry-standard encryption toolkit
- **GnuPG2 (GPG)**: GNU Privacy Guard for encryption and signing
- **pass**: Standard Unix password manager
- **age**: Modern file encryption tool
- **libssl-dev**: Development libraries for SSL/TLS

### Token Management
- **Token Directory**: Automatic creation of `.tokens` directory with secure permissions (700)
- **Environment Variables**: TOKEN_DIR and SSH_AUTH_SOCK configured for token management
- Secure storage location for API keys, tokens, and credentials

## Usage

After creating a container from this template, you can:

### SSH Access
```bash
# SSH server runs automatically
# Connect from outside the container using port 2222
ssh user@localhost -p 2222
```

### HTML/Web Development
```bash
# Serve static HTML files
http-server ./public -p 8080

# Or use serve
serve ./dist -p 3000

# Or use live-server for auto-reload
live-server ./public
```

### Encryption
```bash
# Generate encryption keys
openssl genrsa -out private.key 2048
openssl rsa -in private.key -pubout -out public.key

# Encrypt/decrypt files
openssl enc -aes-256-cbc -salt -in file.txt -out file.enc
openssl enc -aes-256-cbc -d -in file.enc -out file.txt

# Use GPG for encryption
gpg --gen-key
gpg --encrypt --recipient user@example.com file.txt
gpg --decrypt file.txt.gpg

# Use age for modern encryption
age-keygen -o key.txt
age -r $(cat key.txt.pub) -o file.age file.txt
age -d -i key.txt file.age
```

### Token Management
```bash
# Store tokens securely
echo "your-api-token" > .tokens/github-token
chmod 600 .tokens/github-token

# Use tokens in scripts
export GITHUB_TOKEN=$(cat .tokens/github-token)

# Initialize password store
pass init your-gpg-id
pass insert github/token
pass show github/token
```

## Security Best Practices

1. **Never commit tokens or secrets** to version control
2. Add `.tokens/` to your `.gitignore` file
3. Use encryption for sensitive data
4. Rotate tokens and credentials regularly
5. Use SSH keys with strong passphrases
6. Keep encryption tools and libraries up to date

---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/devcontainers/templates/blob/main/src/fullstack-secure/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
