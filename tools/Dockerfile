FROM python:3.12-slim

LABEL maintainer="OBiBa <info@obiba.org>"
LABEL description="Sphinx documentation server for Mica documentation"

# Set working directory
WORKDIR /docs

# Copy requirements first for better layer caching
COPY ../requirements.txt .

# Install Sphinx and dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy documentation source files
COPY .. /docs

# Expose port for live server
EXPOSE 8000

# Build documentation and serve it
CMD ["sh", "-c", "sphinx-build -b html . _build/html && python -m http.server 8000 --directory _build/html"]
