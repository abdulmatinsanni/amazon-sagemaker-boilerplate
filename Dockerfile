FROM python:3.11-slim

# Update and install necessary packages
RUN apt-get -y update && apt-get install -y --no-install-recommends \
    wget \
    nginx \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set some environment variables
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"

# Install required Python packages
COPY decision_trees/requirements.txt decision_trees/requirements.txt
RUN pip install --no-cache-dir -r decision_trees/requirements.txt

# copy the training code and set it as executable
COPY decision_trees/train decision_trees/train
RUN chmod +x decision_trees/train

# copy the serving code and set it as executable
COPY decision_trees/serve decision_trees/serve
RUN chmod +x decision_trees/serve

# Set up the program in the image
COPY decision_trees /opt/program

WORKDIR /opt/program
