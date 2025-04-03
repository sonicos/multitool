FROM debian:bookworm
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ca-certificates \
        curl \
        gnupg \
        debian-archive-keyring \
        netbase \
        sq \
        wget \
        libyaml-dev \
        libpq-dev \
        libvips \
        pkg-config \
	; \
	rm -rf /var/lib/apt/lists/*

