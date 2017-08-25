FROM openjdk:8

ENV JANUSVERSION=0.1.1

RUN wget https://github.com/JanusGraph/janusgraph/releases/download/v${JANUSVERSION}/janusgraph-${JANUSVERSION}-hadoop2.zip -O /tmp/janusgraph.zip

RUN unzip /tmp/janusgraph.zip -d /

WORKDIR /janusgraph-${JANUSVERSION}-hadoop2

ADD wait_for_gremlin.sh .

ADD gremlin-server.yml /janusgraph-0.1.1-hadoop2/conf/gremlin-server/gremlin-server.yml

EXPOSE 8182

CMD bin/janusgraph.sh start && sh wait_for_gremlin.sh
