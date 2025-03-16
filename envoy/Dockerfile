FROM envoyproxy/envoy:v1.29.0

# Install Lua and cjson
RUN apt-get update && apt-get install -y lua5.1 luarocks \
    && luarocks install lua-cjson