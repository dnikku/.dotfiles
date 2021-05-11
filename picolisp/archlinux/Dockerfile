
FROM archlinux:base

RUN pacman --noconfirm -Sy  \
  curl make clang llvm readline libffi openssl

#RUN pacman --noconfirm -S vim

RUN mkdir -p /home \
  && curl https://software-lab.de/pil21.tgz | tar xz -C /home \
  && (cd /home/pil21/src; make) 
  

RUN /bin/bash
