FROM node:22.12.0-alpine AS base

# Step1: Rebuild the source code
FROM base AS builder

WORKDIR /app

COPY package.json package-lock.json* ./
RUN \ 
  if [ -f package-lock.json ]; then npm ci; \
  else "Warning: Lockfile not found. It is recommended to commit lockfiles to version control."; \
  fi

COPY src ./src
COPY public ./public
COPY next.config.ts tsconfig.json postcss.config.mjs tailwind.config.ts ./

RUN \
  if [ -f package-lock.json ]; then npm run build;fi

# Step2: Copy all the file and run next
FROM base AS runner

WORKDIR /app

COPY --from=builder /app/public ./public
# FIXME: add user & add standalone & add static
COPY --from=builder /app/.next ./

CMD ["node", "server.js"]
