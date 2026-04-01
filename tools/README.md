# Mica Documentation - Docker Testing Tools

This folder contains Docker configuration files for local testing and preview of the Mica documentation.

## Prerequisites

- Docker with Compose V2 (version 20.10 or higher)

## Quick Start

From the `tools` directory, run:

```bash
docker compose up
```

The documentation will be built and served at: **http://localhost:8000**

## Usage

### Build and Serve Documentation

```bash
cd tools
docker compose up
```

This will:
1. Build a Docker image with Python 3.12 and Sphinx
2. Install all dependencies from `requirements.txt`
3. Build the HTML documentation
4. Serve it on port 8000

### Rebuild After Changes

The documentation source files are mounted as a volume, but you need to rebuild to see changes:

```bash
docker compose restart
```

Or for a complete rebuild:

```bash
docker compose down
docker compose up --build
```

### Run in Background

```bash
docker compose up -d
```

### View Logs

```bash
docker compose logs -f
```

### Stop the Server

```bash
docker compose down
```

## Manual Build Commands

If you prefer to run commands manually inside the container:

```bash
# Start a shell in the container
docker compose run --rm mica-docs sh

# Inside the container, you can run:
sphinx-build -b html . _build/html
```

## Troubleshooting

### Port 8000 Already in Use

Edit `docker compose.yml` and change the port mapping:

```yaml
ports:
  - "8080:8000"  # Use port 8080 instead
```

### Permission Issues

If you encounter permission issues with mounted volumes:

```bash
docker compose down -v
docker compose up --build
```

## File Structure

```
tools/
├── Dockerfile           # Docker image definition
├── docker compose.yml   # Docker Compose configuration
└── README.md           # This file
```

## Notes

- The `_build` directory is excluded from the volume mount to prevent conflicts
- Changes to `.rst` files require a rebuild to be visible
- The setup matches the ReadTheDocs build environment (Python 3.12)
- This Docker setup does not affect the documentation content or build process
