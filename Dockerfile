FROM --platform=amd64 flink:latest
 
RUN mkdir -p /opt/flink/usrlib
RUN wget -P /opt/flink/usrlib \
    https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka/3.1.0-1.18/flink-sql-connector-kafka-3.1.0-1.18.jar

WORKDIR /app
COPY . /app

RUN apt-get update
RUN apt-get install -y python3.11
RUN apt-get install -y python3-pip

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip3 install -r requirements.txt

