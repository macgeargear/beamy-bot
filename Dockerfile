FROM golang:1.24.5-alpine AS builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/server ./...

FROM gcr.io/distroless/static:nonroot
WORKDIR /app
COPY --from=builder /out/server /app/server

ENV PORT=8080

USER nonroot:nonroot
EXPOSE 8080
ENTRYPOINT ["/app/server"]
