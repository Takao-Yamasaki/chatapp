FROM node:22.12.0-alpine

WORKDIR /app

COPY . .

RUN \ 
  if [ -f package-lock.json ]; then npm ci;fi

RUN npm run build

EXPOSE 3000

CMD \
  if [ -f package-lock.json ]; then npm run dev;fi
