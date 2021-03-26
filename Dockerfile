FROM golang:1.11-alpine AS build

MAINTAINER junwon,seo <jwseo@xxx.cloud>
LABEL "purpose"="go application service deployment"

WORKDIR /src/
COPY main.go go.* /src/
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
