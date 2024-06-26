# cvs2svn has some dependencies that are no longer widely available
# (e.g., Python 2.x and an oldish version of the Subversion library).
# This Dockerfile builds images that can be used to run or test
# cvs2svn. Note that it is based on debian:jessie, which is pretty
# old. But this is the most recent version of Debian where the
# required dependencies are easily available. One way to use this is
# to run
#
#     make docker-image
#
# to make an image for running cvs2svn, or
#
#     make docker-test
#
# to make an image for testing cvs2svn and to run those tests using
# the image.

FROM python:2 AS run

RUN cat /etc/apt/sources.list
RUN apt-get update && \
    apt-get install -y \
        python \
        python-bsddb3 \
        subversion \
        rcs \
        cvs \
        vim

RUN mkdir /src
WORKDIR /src
COPY ./cvs2svn-2.5 /bin







RUN echo $PATH
RUN echo ${PATH}

# RUN ${PYTHON} ./setup.py install

# The CVS repository can be mounted here:
VOLUME ["/cvs"]

# A volume for storing temporary files can be mounted here:
VOLUME ["/tmp"]

