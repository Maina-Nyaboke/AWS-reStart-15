# =============================================================================
# AWS DevOps Infrastructure Automation: Production Application Container Profile
# Target Platform Blueprint: Docker / Base Layer: Lightweight Alpine Linux
# Core Application Ingestion: Python 3.9 Web Application Runtime Engine
# =============================================================================

# 1. Base Layer Ingestion - Utilize optimized, secure Alpine Linux image template
FROM python:3.9-alpine

# 2. Environmental Optimization - Set isolated working directory space inside the image
WORKDIR /app

# 3. Dependency Ingestion - Copy tracking requirements logs into the container environment
COPY requirements.txt .

# 4. System Kernel Level Execution - Clean-install required software packages
RUN pip install --no-cache-dir -r requirements.txt

# 5. Core Asset Population - Copy backend software application code files into the working layout
COPY . .

# 6. Network Port Boundary Mapping - Open port 8080 for incoming app traffic flows
EXPOSE 8080

# 7. Operational Runtime Command - Launch the application engine process on startup
CMD ["python", "app.py"]
