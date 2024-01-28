FROM debian:trixie-slim

ADD https://github.com/mikefarah/yq/releases/download/v4.40.5/yq_linux_amd64 /
RUN chmod u+x /yq_linux_amd64

ADD script.sh /
ADD inventory.ini /

RUN chmod u+x /script.sh

CMD /script.sh
