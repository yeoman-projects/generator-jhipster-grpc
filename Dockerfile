FROM ghcr.io/container-projects/base-docker-images:node-12-npm-yo-git-latest
RUN npm i -g generator-jhipster@6.6.0 && npm i -g "git://github.com/yeoman-projects/generator-jhipster-grpc.git#v0.22.0-patched"
 
RUN \
  # configure the "jhipster" user
  groupadd jhipster && \
  useradd jhipster -s /bin/bash -m -g jhipster -G sudo && \
  echo jhipster:jhipster |chpasswd 
RUN mkdir /home/jhipster/app
RUN chown -R jhipster:jhipster /home/jhipster/app
USER jhipster
ENV PATH $PATH:/usr/bin
WORKDIR "/home/jhipster/app"
VOLUME ["/home/jhipster/app"]
CMD ["yo"]
