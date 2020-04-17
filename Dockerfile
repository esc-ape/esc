ARG FOLDER_BUILD=/build
ARG FOLDER_STATIC=/usr/share/nginx/html
ARG NPM_TOKEN

FROM node:12-alpine3.9 AS build

ARG FOLDER_BUILD
ARG NPM_TOKEN

WORKDIR ${FOLDER_BUILD}

COPY package*.json ./
RUN npm config set @ef:registry https://nexus3.englishtown.com/repository/npm-eflabs/
RUN echo -e "\n//nexus3.englishtown.com/repository/npm-eflabs/:_authToken=${NPM_TOKEN}" >> ~/.npmrc
RUN npm install
RUN rm -f ~/.npmrc

COPY ./ ./

RUN npm run build

FROM docker.pkg.github.com/efcloud/el-b2c-ui-docker-base/el-b2c-ui-docker-base:0.0.4

ARG FOLDER_BUILD
ARG FOLDER_STATIC

WORKDIR ${FOLDER_STATIC}

COPY --from=build ${FOLDER_BUILD}/dist/* ./