FROM stackbrew/ubuntu:trusty

RUN apt-get install -y gnupg

RUN gpg --keyserver keys.gnupg.net --recv-keys 803709B6
RUN gpg -a --export 803709B6 | apt-key add -

RUN echo "deb http://packages.flapjack.io/deb/v1 trusty main" | tee /etc/apt/sources.list.d/flapjack.list
RUN apt-get update
RUN apt-cache policy flapjack
RUN apt-get install -y flapjack

EXPOSE 3080 3081 3071

ADD flapjack_config.yaml.erb /etc/flapjack/flapjack_config.yaml.erb

CMD /opt/flapjack/embedded/bin/erb /etc/flapjack/flapjack_config.yaml.erb > /etc/flapjack/flapjack_config.yaml && /opt/flapjack/bin/flapjack server start --no-daemonize
