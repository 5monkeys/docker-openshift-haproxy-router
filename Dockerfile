FROM openshift/origin-haproxy-router:v3.7.0
USER 0

RUN INSTALL_PKGS="openssl" && \
    yum install -y $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

COPY docker-entrypoint.sh /
COPY conf/ /var/lib/haproxy/conf

USER 1001

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/openshift-router"]
