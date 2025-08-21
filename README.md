# Terraform Flask App Implementation

This project demonstrates infrastructure as code using Terraform to deploy a containerized Flask application with MySQL database. The application is a simple list management system where users can add, view, and delete items.

## Architecture

The project consists of:
- A Flask web application
- MySQL database
- Docker containers orchestrated by Terraform
- Custom network configuration for container communication

## Prerequisites

- Docker installed and running
- Terraform installed (version >= 1.0.0)
- Python 3.10 or higher (if running locally)

## Project Structure

```
├── app.py                 # Flask application
├── Dockerfile            # Docker configuration for Flask app
├── requirements.txt      # Python dependencies
├── config/              # Configuration files
│   └── db_config.py     # Database configuration
├── templates/           # HTML templates
│   ├── add.html        # Form for adding items
│   └── show.html       # Display list of items
└── terraform/          # Infrastructure as code
    ├── main.tf         # Main Terraform configuration
    ├── variables.tf    # Variable definitions
    └── modules/        # Terraform modules
        ├── flask/      # Flask app module
        ├── mysql/      # MySQL database module
        └── network/    # Network configuration module
```

## Setup and Deployment

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Terraform_FlaskApp_Implementation
   ```

2. Build the Docker image locally:
   ```bash
   # From the root directory
   docker build -t flask-app:latest .
   ```

3. Initialize Terraform:
   ```bash
   cd terraform
   terraform init
   ```

4. Deploy the infrastructure:
   ```bash
   terraform plan    # Review the changes
   terraform apply   # Apply the changes
   ```

## Features

- Add items to the list through a web interface
- View all items in the list
- Delete individual items
- Containerized deployment for consistency
- Automated infrastructure provisioning
- Isolated network for container communication

## Clean Up

To remove all created resources:
```bash
cd terraform
terraform destroy
```

## Technical Details

- **Flask Application**: Python web application with MySQL database integration
- **Docker**: Containerization of both Flask app and MySQL database
- **Terraform Modules**:
  - `network`: Creates an isolated Docker network
  - `mysql`: Provisions MySQL database container
  - `flask`: Deploys the Flask application container
  - Dependencies are managed to ensure proper startup order

## Notes

- The MySQL data is persisted using Docker volumes
- The application runs in debug mode for development purposes
- Environment variables for database configuration should be properly secured in production
