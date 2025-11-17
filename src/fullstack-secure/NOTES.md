## Additional Configuration Notes

### SSH Configuration
- The SSH server is configured via the sshd feature
- You may need to configure SSH keys for authentication
- Consider adding your public key to `~/.ssh/authorized_keys` in the container

### Web Development
- Multiple web servers are provided for flexibility
- Use `http-server` for simple static file serving
- Use `serve` for production-ready serving with additional features
- Use `live-server` for development with auto-reload capabilities

### Token Storage
- The `.tokens` directory is automatically created with secure permissions (700)
- This directory is suitable for storing API tokens, credentials, and secrets
- Remember to add `.tokens/` to `.gitignore` to prevent accidental commits

### Encryption Tools
This template includes multiple encryption tools to suit different needs:
- **OpenSSL**: Best for SSL/TLS, certificates, and general-purpose encryption
- **GPG**: Best for email encryption, code signing, and PGP compatibility
- **age**: Best for file encryption with a modern, simple interface
- **pass**: Best for managing passwords and credentials

### Environment Variables
The following environment variables are pre-configured:
- `TOKEN_DIR`: Points to the `.tokens` directory for secure token storage
- `SSH_AUTH_SOCK`: Configured for SSH agent forwarding

### Port Forwarding
The following ports are automatically forwarded:
- **2222**: SSH server
- **8080**: Common web server port
- **3000**: Common Node.js development server port

You can add additional ports in the `devcontainer.json` file as needed.

### Customization
To add additional packages or tools, modify the `postCreateCommand` in `devcontainer.json`:
```json
"postCreateCommand": "bash -c 'sudo apt-get update && sudo apt-get install -y your-package-here'"
```

### Security Considerations
1. The container runs as a non-root user by default for security
2. SSH server is isolated to the container environment
3. Token directory has restrictive permissions (700)
4. Consider using environment variables for sensitive configuration
5. Regular security updates are recommended
