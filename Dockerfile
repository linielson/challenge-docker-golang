FROM golang:1.16-alpine AS builder

WORKDIR /go/src/app

COPY main.go .

RUN go build -ldflags="-s -w" main.go

FROM scratch

WORKDIR /go/src/app

COPY --from=builder /go/src/app/main .

CMD ["./main"]
