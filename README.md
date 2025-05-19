# Outline VPN Management Panel

A comprehensive management panel for Outline VPN servers with user management, server management, and monitoring capabilities.

## Features

- User Management
  - Create/Edit/Delete users
  - Set bandwidth quotas
  - Set expiry dates
  - Generate subscription and SS links
  - Monitor usage

- Server Management
  - Add/Edit/Remove servers
  - Support for domain/IP configuration
  - Server status monitoring
  - Location management
  - Auto-installation script

- Dashboard
  - Real-time statistics
  - User activity monitoring
  - Server health metrics
  - Bandwidth usage graphs

- Security
  - JWT authentication
  - Role-based access control
  - Secure API communication

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/outline-vpn-manager.git
   ```

2. Install dependencies:
   ```bash
   npm install
   cd frontend && npm install
   ```

3. Copy .env.example to .env and configure your environment variables:
   ```bash
   cp .env.example .env
   ```

4. Start the development server:
   ```bash
   npm run dev:full
   ```

## Server Installation

To install Outline VPN on a new server:

```bash
./scripts/install_outline.sh -k YOUR_API_KEY [-d YOUR_DOMAIN]
```

## License

MIT License
