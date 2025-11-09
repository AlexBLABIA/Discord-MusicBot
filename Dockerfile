FROM node:20-alpine

WORKDIR /usr/src/app

# 先只复制包文件，加快构建
COPY package*.json ./

RUN npm install

# 再复制剩余代码
COPY . .

# 不要在 build 阶段跑 npm run deploy，会因为环境变量等各种问题失败
# RUN npm run deploy

# 直接启动 bot
CMD [ "node", "index.js" ]
