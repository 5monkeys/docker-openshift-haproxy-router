#!/bin/sh

# Generate snakeoil certificate
if [ ! -f "$DEFAULT_CERTIFICATE_DIR/tls.cert" ]; then
    echo "Generating snakeoil certificate..."
    mkdir -p $DEFAULT_CERTIFICATE_DIR
    openssl req \
        -new \
        -nodes \
        -x509 \
        -days 3650 \
        -subj "/C=AU/ST=Some-State/O=Internet Widgits Pty Ltd" \
        -out "$DEFAULT_CERTIFICATE_DIR/tls.crt" \
        -keyout "$DEFAULT_CERTIFICATE_DIR/tls.key"
fi

exec "$@"
