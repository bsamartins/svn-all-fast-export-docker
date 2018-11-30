FROM alpine:latest

RUN apk add git svn apr-devel subversion-devel qt-devel make gcc-c++
RUN git clone https://github.com/svn-all-fast-export/svn2git

RUN cd /svn2git && qmake-qt4 && make

ENTRYPOINT ["/svn2git/svn-all-fast-export"]