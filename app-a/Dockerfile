FROM nginx

# First, we need to copy the forward script into the image
COPY forward.sh /

# Then, we need to install ncat. This process may be different depending upon 
# our base image
RUN apt-get update
RUN apt-get install -y ncat && \
  chmod +x /forward.sh # Also make forward executable

# Set forward script as an entry point
ENTRYPOINT ["/forward.sh"]

CMD ["nginx", "-g", "daemon off;"]
