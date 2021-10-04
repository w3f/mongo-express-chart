const express = require('express')
const mongo_express = require('mongo-express/lib/middleware')

const app = express()
const port = 8080
const mongo_express_config = require('./config.js')

async function bootstrap() {
  // https://github.com/mongo-express/mongo-express/issues/612
  const resolvedMiddleware = await mongo_express(mongo_express_config);
 
  /* Endpoint for healthchecks. */
  app.get('/__healthcheck__', (req, res) => res.send('Up and running!'));

  app.use('/', resolvedMiddleware)

  app.listen(port, () => console.log(`mongo-express listening on port ${port}!`))
}
bootstrap()