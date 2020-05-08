const FastBootAppServer = require('fastboot-app-server');

let server = new FastBootAppServer({
  distPath: '../dist',
  disableShoebox: false,
  gzip: true, // Optional - Enables gzip compression.
  port: 4200, // Optional - Sets the port the server listens on (defaults to the PORT env var or 3000).
});

server.start();