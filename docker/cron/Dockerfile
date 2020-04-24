FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y --no-install-recommends cron vim supervisor curl unzip awscli

COPY cronschedule /etc/cron.d/
RUN chmod 777 /etc/cron.d/cronschedule
RUN crontab /etc/cron.d/cronschedule


COPY script.sh /
RUN chmod +x /script.sh

COPY startup.sh /
RUN chmod +x /startup.sh

ADD supervisord.conf /etc/
ENTRYPOINT ["supervisord","-c","/etc/supervisord.conf"]