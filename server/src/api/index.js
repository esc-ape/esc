import Koa from 'koa'
import Router from '@koa/router';

const app = new Koa()
const router = new Router()

router.get('/test', (...args) => {
  console.log(args)
})

app.use(router.routes())

export default app