FROM alpine:latest

RUN apk add git subversion apr-dev subversion-dev qt-dev make g++
RUN git clone https://github.com/svn-all-fast-export/svn2git

RUN cd /svn2git && qmake && make
RUN mv /svn2git/svn-all-fast-export /bin/svn-all-fast-export
RUN rm -fr /svn2git

ENTRYPOINT ["/bin/svn-all-fast-export"]