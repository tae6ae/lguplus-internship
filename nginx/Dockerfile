FROM ubuntu:20.04

# Install requirements
RUN apt-get clean
RUN apt-get update
RUN apt-get -y install wget libpcre3 libpcre3-dev zlib1g zlib1g-dev gcc g++ make curl

# Download nginx source
RUN wget --no-check-certificate https://nginx.org/download/nginx-1.20.2.tar.gz
RUN tar -zxf nginx-1.20.2.tar.gz
WORKDIR ./nginx-1.20.2

# Configuration
RUN ./configure --prefix=/usr/local/nginx --user=www-data --group=www-data
RUN make
RUN make install

COPY nginx.conf /usr/local/nginx/conf/nginx.conf
EXPOSE 80

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]