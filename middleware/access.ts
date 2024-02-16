import express from 'express';
import ERRORS from 'constants/errors';
import config from 'config';
import CryptoJS from 'crypto-js';
import { AppPermission } from 'models/app';
import { verifyAPIToken } from 'controllers/utilsController';
import path from 'path';

// ########### ONLY USE IF ROUTE REQUIRES GRANTED ACCESS VERIFICATION ###########

export function superUserAccess(req: any, res: express.Response, next: express.NextFunction) {
  try {

    if (!req.user) {
      console.error(ERRORS.ERROR_UNAUTHORIZED);
      return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
    }

    if (!req.user.su) {
      console.error(ERRORS.ERROR_FORBIDDEN);
      return res.status(403).send(ERRORS.ERROR_FORBIDDEN);
    }
  
    next();

  } catch (err) {
    console.error(err);
    return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
  }
}

export function specificAppAccess (app_id: string, level?: number) {

  return function (req: any, res: express.Response, next: express.NextFunction) {
    try {
      
      if (!req.user) {
        console.error(ERRORS.ERROR_UNAUTHORIZED);
        return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
      }
    
      if (!req.user.appPermissions.some((perm: AppPermission) => {return perm.app_id === app_id;}) && !req.user.su) {
        console.error(ERRORS.ERROR_FORBIDDEN);
        return res.status(403).send(ERRORS.ERROR_FORBIDDEN);
      }

      if (level && level > 0 && !req.user.su) {
        const permission = req.user.appPermissions.find((perm: AppPermission) => {return perm.app_id === app_id;});
        if (permission.level < level) {
          console.error(ERRORS.ERROR_FORBIDDEN);
          return res.status(403).send(ERRORS.ERROR_FORBIDDEN);
        }
      }
      
      next();
    } catch (err) {
      console.error(err);
      return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
    }
  };
}

export function managementAccess(req: any, res: express.Response, next: express.NextFunction) {
  try {

    if(CryptoJS.SHA3(req.body.password).toString() !== config.get('managementPass')){
      console.error(ERRORS.ERROR_UNAUTHORIZED);
      return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
    }
    next();

  } catch (err) {
    console.error(err);
    return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
  }
}

export async function APIAccess(req: any, res: express.Response, next: express.NextFunction) {
  try {

    if(!req.cookies['api-token']){

      console.error(ERRORS.ERROR_UNAUTHORIZED);
      return res.status(401).json(ERRORS.ERROR_UNAUTHORIZED);

    }else{

      const token: string = req.cookies['api-token'];
      // Verify token
      await verifyAPIToken(token);
      next();
    }

  } catch (err: any) {
    console.error(err);
    if (err.status) {
      return res.status(err.status).send(err);
    }
    return res.status(401).send(ERRORS.ERROR_UNAUTHORIZED);
  }
}

// Define una función de middleware para normalizar rutas
export const normalizePathMiddleware = (req: any, res: express.Response, next: express.NextFunction) => {
  if (!req.params[0]) {
    return res.status(400).send(ERRORS.ERROR_INVALID_PATH);
  }
  // Normaliza la ruta del parámetro de la URL
  req.params[0] = path.normalize(req.params[0]);
  next();
};

