FROM python:3.4
MAINTAINER jalpardos@gmail.com

RUN apt-get update && apt-get install -y supervisor unzip
RUN mkdir -p /var/log/supervisor && mkdir -p /etc/supervisor/conf.d

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y openjdk-7-jdk && \
  rm -rf /var/lib/apt/lists/*

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Install prana
RUN wget http://dl.bintray.com/netflixoss/Prana/Prana-0.0.1.zip && unzip Prana-0.0.1.zip && mv Prana-0.0.1 /opt/Prana
ADD prana.sh /usr/local/bin/prana.sh
RUN chmod +x /usr/local/bin/prana.sh
ADD prana.properties /etc/prana/prana.properties

# Flask application code
ADD . /code
WORKDIR /code
RUN pip3 install -r requirements.txt
EXPOSE 5000

# Add configuration files
ADD supervisor.conf /etc/supervisor.conf
ADD supervisor/conf.d/* /etc/supervisor/conf.d/

EXPOSE 22 80
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf"]