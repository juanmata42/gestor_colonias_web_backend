import cors from 'cors';
import express from 'express';
import config from 'config';


function corsMiddleware(app: express.Express) {

  const options: cors.CorsOptions = {
    allowedHeaders: [
      'Authorization',
      'x-auth-token',
      'Access-Control-Allow-Credentials',
      'Secret',
      'session-gi-active',
      'token',
      'Access-Control-Allow-Origin',
      'Content-Type',
      'Content-Security-Policy'
    ],
    methods: 'GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE',
    credentials: true,
    origin: config.get('originURL') as Array<string> | string
  };

  app.use(cors(options));
  
}

export default corsMiddleware;