FROM busybox

COPY gen_passwd.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/gen_passwd.sh"]
