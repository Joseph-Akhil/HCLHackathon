const serverlessExpress = require('aws-serverless-express');
const app = require('./index');
const server = serverlessExpress.createServer(app);

exports.handler = (event, context) => {
  return serverlessExpress.proxy(server, event, context);
};
