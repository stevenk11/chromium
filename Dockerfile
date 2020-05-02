FROM debian:buster-slim

RUN sed -i -e "s/deb.debian/ftp.hk.debian/g" /etc/apt/sources.list \
	&& apt-get update && apt-get install -y --no-install-recommends \
	wget \
	gnupg \
	ca-certificates \
	&& echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium:/testing/Debian_Buster/ /' > /etc/apt/sources.list.d/home:ungoogled_chromium:testing.list \
	&& wget -nv https://download.opensuse.org/repositories/home:ungoogled_chromium:testing/Debian_Buster/Release.key -O Release.key \
	&& apt-key add - < Release.key \
	&& apt-get update && apt-get install -y --no-install-recommends \
	ungoogled-chromium \
	ungoogled-chromium-l10n \
	fonts-liberation \
	hicolor-icon-theme \
	libcanberra-gtk-module \
	libexif-dev \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libpango1.0-0 \
	libv4l-0 \
	fonts-symbola \
        fonts-noto \
        fonts-noto-cjk \
        fonts-noto-color-emoji \
        && apt-get install -y --no-install-recommends \
        fcitx fcitx-sunpinyin \
        fcitx-frontend-gtk3 fcitx-ui-classic \
        && apt-get purge --autoremove -y wget gnupg \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG zh_CN.UTF-8
ENV LC_MESSAGES en_US.UTF-8

COPY entrypoint.sh /usr/bin/startchromium
COPY vk.conf /usr/share/fcitx/data/vk.conf

ENTRYPOINT ["/usr/bin/startchromium"]
