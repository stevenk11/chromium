FROM stevenk11/ibus

RUN apt-get update && apt-get install -y --no-install-recommends \
	chromium \
	chromium-l10n \
	fonts-liberation \
	hicolor-icon-theme \
	libcanberra-gtk-module \
	libexif-dev \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpangox-1.0-0 \
	libv4l-0 \
	fonts-symbola \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/bin/startchromium

ENTRYPOINT ["/usr/bin/startchromium"]
