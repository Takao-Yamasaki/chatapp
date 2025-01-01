FROM node:22.12.0-alpine

WORKDIR /app

COPY package.json package-lock.json* ./
RUN \ 
  if [ -f package-lock.json ]; then npm ci;fi

COPY src ./src
COPY public ./public
COPY next.config.ts tsconfig.json postcss.config.mjs tailwind.config.ts ./

CMD \
  if [ -f package-lock.json ]; then npm run dev;fi
