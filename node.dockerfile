FROM uselagoon/node-18-builder:latest as builder
COPY package.json package-lock.json /app/
RUN npm install

FROM uselagoon/node-18:latest
RUN npm install -g gatsby-cli
COPY --from=builder /app/node_modules /app/node_modules
COPY . /app/

RUN mkdir /home/.config/ && fix-permissions /home/.config

EXPOSE 3000

CMD ["/app/scripts/runGatsbyDevelop.sh"]
