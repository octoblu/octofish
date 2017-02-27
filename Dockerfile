FROM octoblu/octobash:latest

WORKDIR /workdir

RUN apk add -q --no-cache fish
COPY config /home/octoblu/.config/omf/
RUN chown -R octoblu:octoblu /home/octoblu/.config
RUN curl --silent -L http://get.oh-my.fish > /tmp/install \
  && su octoblu - -c 'fish /tmp/install --noninteractive --path=/home/octoblu/.local/share/omf --config=/home/octoblu/.config/omf' \
  && rm /tmp/install

LABEL io.whalebrew.name octofish

ENTRYPOINT ["octoswarm", "fish"]
