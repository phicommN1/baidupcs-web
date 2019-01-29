FROM arm64v8/alpine:edge


RUN apk update && apk add wget bash gnupg --no-cache

WORKDIR /app

#AriaNg
RUN wget -N --no-check-certificate https://github.com/liuzhuoling2011/baidupcs-web/releases/download/3.6.4/BaiduPCS-Go-3.6.4-linux-arm64.zip \
 && unzip BaiduPCS-Go-3.6.4-linux-arm64.zip && rm BaiduPCS-Go-3.6.4-linux-arm64.zip \
 && cd BaiduPCS-Go-3.6.4-linux-arm64 \
 && mv BaiduPCS-Go .. && cd .. \
 && mv BaiduPCS-Go baidupcs \
 && chmod +x baidupcs

EXPOSE 5299

CMD "/app/baidupcs"
