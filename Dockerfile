FROM alpine:latest

RUN apk add --no-cache \
	git \
	git-fast-import \
	icu-dev \
	subversion \
	apr-dev \
	subversion-dev \
	qt-dev \
	make \
	g++

RUN git clone https://github.com/svn-all-fast-export/svn2git

RUN cd /svn2git && qmake && make

RUN apk del \
	apr-dev \
	subversion-dev \ 
	make \
	g++ \
    && rm -fr /var/cache/apk/*

RUN mv /svn2git/svn-all-fast-export /bin/svn-all-fast-export
RUN rm -fr /svn2git

ENTRYPOINT ["/bin/svn-all-fast-export"]
