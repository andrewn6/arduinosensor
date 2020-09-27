FROM cpp-build-base:0.1.0 AS build

WORKDIR /cpp

COPY app.cpp ./

RUN cmake . && make

FROM ubuntu:bionic

WORKDIR /cpp /

COPY --from=build /src/app.cpp ./

CMD ["./helloworld"]