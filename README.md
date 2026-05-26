# tallyfin/infra

Terraform for Tallyfin's AWS infrastructure.

- `modules/`: reusable modules
- `environments/production/`: the production stack

Plan locally with `terraform -chdir=environments/production plan`. Applies run from CI only.
