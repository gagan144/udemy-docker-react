# ----- Build Phase -----
# use 'as' to define a phase/block/layer
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build   

# ----- Run Phase -----
# Copy build files into nginx based docker image
FROM nginx

COPY  --from=builder /app/build /usr/share/nginx/html


