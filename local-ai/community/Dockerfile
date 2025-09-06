# Build argument for base image tag
ARG N8N_VERSION=1.109.2
FROM n8nio/n8n:${N8N_VERSION}

# Build argument for community nodes (space-separated list)
ARG COMMUNITY_NODES="n8n-nodes-mcp"

USER root

# Create the nodes directory and install community nodes following n8n documentation
# Reference: https://docs.n8n.io/integrations/community-nodes/installation/manual-install/#install-a-community-node
RUN if [ -n "$COMMUNITY_NODES" ]; then \
        # Create ~/.n8n/nodes directory
        mkdir -p /home/node/.n8n/nodes && \
        chown -R node:node /home/node/.n8n && \
        # Switch to node user and install nodes
        su - node -c "cd /home/node/.n8n/nodes && npm i $COMMUNITY_NODES"; \
    fi

# Switch back to node user
USER node

EXPOSE 5678

# Use the default n8n entrypoint and command
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]