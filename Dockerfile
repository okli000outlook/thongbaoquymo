FROM alpine:latest

ARG PB_VERSION=0.22.22

RUN apk add --no-cache \
    unzip \
    ca-certificates

# Tải PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# Expose port mặc định
EXPOSE 8080

# Chạy PocketBase và lắng nghe trên 0.0.0.0 để Choreo có thể truy cập
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080"]
