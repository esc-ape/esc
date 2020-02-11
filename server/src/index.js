import Koa from 'koa'
import mount from 'koa-mount'
import APIApp from './api'

function createApp() {
  const app = new Koa()

  app.use(mount('/api', APIApp))

  return app
}

function startServer(config) {
  createApp().listen(config.port)
}

startServer({
  port: 8080
})