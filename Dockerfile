FROM redislabs/rejson:2.6.6
WORKDIR /opt/redis
RUN groupadd -g 322 redis &&
    useradd -r -u 322 -g redis redis

RUN chown -R redis:redis /opt/redis

RUN apt-get update && apt-get install git build-essential cmake -y

RUN git clone https://github.com/tair-opensource/TairHash/ && cd TairHash && mkdir b && cd b && cmake ../ -DSLAB_MODE=yes -DCMAKE_BUILD_TYPE=Release && make -j12 && cp ../lib/tairhash_module.so /opt/redis
