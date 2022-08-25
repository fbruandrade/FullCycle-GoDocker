FROM golang:1.19-alpine as builder

WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o /app rocks.go

FROM scratch

MAINTAINER Felipe Brunelli de Andrade<fbruandrade@gmail.com>
COPY --from=builder /app /app
CMD ["/app"]
