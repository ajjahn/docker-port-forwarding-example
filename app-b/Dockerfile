FROM nginx

COPY forward.sh /
RUN apt-get update
RUN apt-get install -y ncat && \
  chmod +x /forward.sh
ENTRYPOINT ["/forward.sh"]

CMD ["nginx", "-g", "daemon off;"]
