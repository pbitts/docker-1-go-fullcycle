FROM golang:1.18-alpine AS go

WORKDIR /app

RUN apk add --no-cache git
COPY fc.go .

RUN go build fc.go

FROM scratch

COPY --from=go /app /

ENTRYPOINT ["./fc"]