# Security

This repository is an educational/portfolio simulation and is intentionally structured to avoid publishing real secrets or personal information.

## Repository rules

Do not commit:
- AWS access keys or session tokens;
- SSH private keys;
- database credentials;
- `.env` files;
- production IPs that should remain private;
- real passenger/customer data;
- personal contact information.

## Application boundary

The public Nginx container is the intended ingress. The Express service uses Docker `expose` rather than a host-published port and is reached through the reverse proxy.

Cross-origin API access is disabled by default. If needed, set `CORS_ORIGIN` explicitly.

## Secrets

Runtime configuration belongs in environment variables. Use `.env.example` as documentation only and provide real values through a local `.env`, CI/CD secret store, AWS Systems Manager Parameter Store or AWS Secrets Manager.

## Production hardening

For a production implementation, add TLS, authentication/authorization where appropriate, database authentication, managed secret storage, least-privilege IAM, WAF/rate limiting, dependency scanning and centralized audit logging.
