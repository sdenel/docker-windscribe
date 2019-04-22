FROM ubuntu:18.04
# If you want to build this image by yourself, try: docker build . -t sdenel/docker-windscribe
COPY setup.sh /opt/setup.sh
# Avoid Warning: apt-key output should not be parsed (stdout is not a terminal)
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn
RUN chmod +x /opt/setup.sh && /opt/setup.sh
COPY init-windscribe.sh /init-windscribe.sh
RUN chmod +x /init-windscribe.sh
CMD /init-windscribe.sh && /bin/bash

