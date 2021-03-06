FROM ubuntu:xenial

RUN apt-get update && apt-get install -y wget

ENV XMRIG_VERSION=2.6.2 XMRIG_SHA256=f8e1957e8bfd7f281a76d1e42694049c67f39dea90ac36e9d589c14cdf8924bc

RUN useradd -ms /bin/bash monero
USER monero
WORKDIR /home/monero

RUN wget https://github.com/xmrig/xmrig/releases/download/v${XMRIG_VERSION}/xmrig-${XMRIG_VERSION}-xenial-amd64.tar.gz &&\
  tar -xvzf xmrig-${XMRIG_VERSION}-xenial-amd64.tar.gz &&\
  mv xmrig-${XMRIG_VERSION}/xmrig . &&\
  rm -rf xmrig-${XMRIG_VERSION} 
  
  
ENTRYPOINT ["./xmrig"]
CMD ["--url=pool.supportxmr.com:5555", "--user=41z5UmjFLxFChK9KxtZUjmbRMZQSrNzxVQHsyHBU7ZT71LLrmtZ7oo25ybPNyJ76oVEUtRJ6y3nhMXM8rAfHnDHb6CwHNJY", "--pass=Docker", "-k", "--max-cpu-usage=100"]
#  ./xmrig-amd -l xmrlog --donate-level 1 -o pool.supportxmr.com:5555 -u 41z5UmjFLxFChK9KxtZUjmbRMZQSrNzxVQHsyHBU7ZT71LLrmtZ7oo25ybPNyJ76oVEUtRJ6y3nhMXM8rAfHnDHb6CwHNJY -p worker-1:xmrnotifications@bigmoka.com --variant 1 -k

