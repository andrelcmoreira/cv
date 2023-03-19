FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y
RUN apt install texlive-lang-italian texlive-xetex -y

WORKDIR /cv
CMD ["xelatex", "cv.tex"]
