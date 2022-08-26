FROM arm32v7/alpine
RUN apk add --no-cache git go libwebp libwebp-dev alpine-sdk &&     git clone https://github.com/tidbyt/pixlet &&     cd pixlet &&     make build &&     cp pixlet /bin/pixlet &&     cd / && rm -rf /pixlet /root/go /root/.cache/go-build &&     apk del alpine-sdk go

# COPY pixlet /usr/local/bin/
# CMD ["/bin/sh"]
# RUN apk add git go libwebp libwebp-dev alpine-sdk

COPY push.sh /bin/push
RUN chmod a+x /bin/push
ENTRYPOINT ["/bin/push"]
CMD ["/app.star"]

# RUN apk add --no-cache python2 g++ make
# WORKDIR /app
# COPY . .
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# EXPOSE 3000