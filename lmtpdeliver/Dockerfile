FROM ubuntu
ADD start.sh /
RUN  mkdir work && \
     cd work && \
     apt-get update && \
     apt-get install -y curl && \
     curl -L -o lmtpdeliver.tar.gz https://github.com/iseebi/lmtpdeliver/releases/download/v0.1.1/lmtpdeliver_0.1.1_Linux_x86_64.tar.gz && \
     tar xzf lmtpdeliver.tar.gz && \
     mv lmtpdeliver /bin && \
     cd .. && \
     rm -rf work  && \
     apt-get clean
CMD ["/start.sh"]
