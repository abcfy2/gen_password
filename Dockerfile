FROM busybox

COPY gen_passwd.sh /usr/local/bin/

CMD ["/usr/local/bin/gen_passwd.sh"]
