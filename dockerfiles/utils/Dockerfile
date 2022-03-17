FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install lynx vim screen curl \
 ca-certificates dirmngr proxychains \
 gpg-agent apt-transport-https -y
RUN mkdir ~/.gnupg && chmod 700 ~/.gnupg && \
 mkdir -p /usr/share/keyrings
RUN gpg --no-default-keyring \
 --keyring /usr/share/keyrings/weechat-archive-keyring.gpg \
 --keyserver hkps://keys.openpgp.org \
 --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
RUN echo "deb [signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg] https://weechat.org/ubuntu focal main" | tee /etc/apt/sources.list.d/weechat.list
RUN apt-get update && apt-get install weechat-curses weechat-plugins weechat-python weechat-perl -y
RUN useradd -d /home/anon -ms /bin/bash anon
ADD conf/proxychains.conf /etc/proxychains.conf
ADD scripts/entrypoint /entrypoint
RUN chmod +x /entrypoint
CMD ["/bin/bash", "/entrypoint"]