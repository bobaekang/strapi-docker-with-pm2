FROM bobaekang/strapi:beta

RUN npm install -g pm2

COPY strapi.sh strapi-start-production.sh ./
RUN chmod +x ./strapi.sh

CMD ["./strapi.sh"]
