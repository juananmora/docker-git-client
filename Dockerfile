FROM debian:jessie

RUN apt-get update && apt-get install -y ca-certificates openssh-client git --no-install-recommends && rm -r /var/lib/apt/lists/*


COPY git.sh /tmp/git.sh

RUN chmod +x /tmp/git.sh && mkdir -p /root/.ssh && echo "Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile /dev/null\n" >> /root/.ssh/config

VOLUME "/root/project"

WORKDIR "/root/project"

ENV SHA="HEAD" \
 GIT_ROOT="/root/project" \
 SERVICE="" \
 USERNAME="" \
 REPOSITORY="" \
 METHOD="http" \
 BRANCH="" \
 DEPTH=20 \
 DEBUG=FALSE

CMD ["/tmp/git.sh"]
