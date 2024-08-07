FROM node:20.12.2
LABEL maintainer="contact#hideip.network"

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install -g pnpm \
    && pnpm install

COPY . .

ENV PORT=56559 \
    HOST=0.0.0.0 \
    SECRET=hnet-secret \
    HNET_USER=hnet-admin \
    HNET_PWD=hnet-passwd \
    REDIRECT_HOST=www.google.com \
    MONGDB_CONNECTION=null \
    USE_DB=false \
    MODO=normal

EXPOSE 56559

CMD ["pnpm", "start"]