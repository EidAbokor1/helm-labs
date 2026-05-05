# Helm Labs

A collection of Helm charts demonstrating advanced Helm features including library charts, dependencies, templating, and reusable components.

## Overview

This repository contains several Helm charts that showcase best practices for Kubernetes application deployment using Helm:

- **mylibcharts**: A library chart providing reusable templates for common Kubernetes resources (deployments, services, configmaps, secrets)
- **exampleapp**: An application chart that depends on the library chart to demonstrate dependency management
- **myapp**: A simple application chart with custom deployment and service
- **mypod**: A basic pod chart
- **nginx**: An nginx chart with common library dependencies
- **umbrella-chart**: A parent chart that manages multiple sub-charts

## Features

- **Library Charts**: Reusable templates to avoid code duplication
- **Chart Dependencies**: Local and remote chart dependencies
- **Templating**: Go template syntax for dynamic Kubernetes manifests
- **Best Practices**: Proper chart structure, values handling, and helper functions

## Prerequisites

- Kubernetes cluster (local or remote)
- Helm 3.x installed
- kubectl configured

## Installation

### Using the Library Chart

1. Navigate to the exampleapp chart:
   ```bash
   cd charts/exampleapp
   ```

2. Update dependencies:
   ```bash
   helm dependency update
   ```

3. Install the chart:
   ```bash
   helm install myapp . --namespace default
   ```

### Using Individual Charts

For each chart in the `charts/` directory:

```bash
helm install <release-name> ./charts/<chart-name>
```

## Chart Structure

```
charts/
├── mylibcharts/          # Library chart with reusable templates
│   ├── _common.tpl       # Common labels and selectors
│   ├── _deployment.yaml  # Reusable deployment template
│   ├── _service.yaml     # Reusable service template
│   ├── _configmap.yaml   # Reusable configmap template
│   └── _secret.yaml      # Reusable secret template
├── exampleapp/           # Application using library dependencies
│   ├── Chart.yaml        # Chart metadata with dependencies
│   ├── values.yaml       # Default values
│   └── templates/        # Kubernetes manifests
├── myapp/                # Simple application chart
├── mypod/                # Basic pod chart
├── nginx/                # Nginx with common dependencies
└── umbrella-chart/       # Multi-chart deployment
```

## Usage Examples

### Templating

Render templates without installing:
```bash
helm template myapp ./charts/exampleapp
```

### Debugging

Use debug flag for troubleshooting:
```bash
helm template myapp ./charts/exampleapp --debug
```

### Values Override

Install with custom values:
```bash
helm install myapp ./charts/exampleapp -f my-values.yaml
```

## Contributing

1. Follow Helm chart best practices
2. Use semantic versioning for chart versions
3. Include proper documentation in Chart.yaml
4. Test templates with `helm template`

## Known Issues / Debugging

- Library chart dependencies may require manual path adjustments for local development
- Template includes must match the exact dependency alias/prefix
- Run `helm dependency update` after changing Chart.yaml dependencies
- Use `helm template --debug` to troubleshoot rendering issues
- Some charts may need values.yaml updates for proper templating

## License

MIT License
