FROM nginx:alpine

WORKDIR /var/www

ENV APP_LANDING_PAGE_VERSION 8884e65
ENV TOOLS_LANDING_PAGE_VERSION a6c9073

RUN wget -q https://github.com/viblo-asia/app-landing-page/releases/download/$APP_LANDING_PAGE_VERSION/dist.zip
RUN mkdir -p /var/www/app
RUN unzip dist.zip -d /var/www/app && rm dist.zip

RUN wget -q https://github.com/viblo-asia/tools-landing-page/releases/download/$TOOLS_LANDING_PAGE_VERSION/dist.zip
RUN mkdir -p /var/www/tools
RUN unzip dist.zip -d /var/www/tools && rm dist.zip

COPY nginx.conf /etc/nginx

CMD nginx -g "daemon off; pid /run/nginx.pid;"

EXPOSE 80
