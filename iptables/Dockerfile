FROM alpine:latest

RUN apk --no-cache add iptables

# CMD ["sh", "-c", "iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 10000 && sleep infinity"]
CMD ["sh", "-c", "iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 10000 && iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDIRECT --to-port 10000"]

# docker build -t gcr.io/celi12/iptables-setup:latest iptables-setup/
# docker push gcr.io/celi12/iptables-setup:latest
