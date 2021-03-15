FROM solr:alpine

USER solr
RUN bin/solr start && bin/solr create_core -c nodebb

EXPOSE 8983
