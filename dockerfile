FROM node:16.17-alpine3.16

RUN [ "mkdir", "/workspace" ]

WORKDIR /workspace

# Copy package.json and package-lock.json
COPY package*.json ./

COPY . .
# Install npm production packages 
RUN npm install 

# set timezone
RUN apk add tzdata
RUN rm -rf /etc/localtime; \
  ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime;

ENV PORT 22019

EXPOSE 22019

CMD ["npm", "start"]
