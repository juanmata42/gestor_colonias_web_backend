import config from 'config';
import ERRORS from 'constants/errors';
/* import { User } from 'models/user'; */
import jwt from 'jsonwebtoken';
import fs from 'fs';

// Regular expression to check email format is valid
export function validateEmail(emailAdress: string) {
  const regexEmail = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
  if (emailAdress.match(regexEmail)) {
    return true;
  }
  return false;
}

// Regular expression to check phone format is valid
export function validatePhone(phone: string) {
  const regexPhone = /(([+][(]?[0-9]{1,3}[)]?)|([(]?[0-9]{4}[)]?))\s*[)]?[-\s.]?[(]?[0-9]{1,3}[)]?([-\s.]?[0-9]{3})([-\s.]?[0-9]{3,4})/;
  if (phone.match(regexPhone)) {
    return true;
  } 
  return false;
}

export function validatePassword (password: string) {
  const regexPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,20}$/;
  if (password.match(regexPassword)) {
    return true;
  }
  return false;
}

export function validateFactoryID (id: string) {
  const regexID = /^[a-zA-Z0-9]+$/;
  if (id.match(regexID)) {
    return true;
  }
  return false;
}

export function validateDateISO (date: string | Date | number) {

  const validFormat = /^\d{2}\/\d{2}\/\d{4}$/;
  const validFormat2 = /^\d{2}-\d{2}-\d{4}$/;
  const ISOFormat = /^\d{4}-\d{2}-\d{2}$/;

  if (typeof(date) === 'string') {
    if (!ISOFormat.test(date)) {
      if (validFormat.test(date)) {
        const splitDate = date.split('/');
        const ISODate = `${splitDate[2]}-${splitDate[1]}-${splitDate[0]}`;
        return new Date(ISODate);
      } else if (validFormat2.test(date)) {
        const splitDate = date.split('-');
        const ISODate = `${splitDate[2]}-${splitDate[1]}-${splitDate[0]}`;
        return new Date(ISODate);
      } else {
        throw ERRORS.ERROR_INVALID_DATE;
      }
    }
    return new Date(date);
  } else if (typeof(date) === 'number') {
    return dateFromNumber(date);
  } else {
    const stringDate = date.toString().split('T')[0];
    if (!ISOFormat.test(stringDate)) {
      if (validFormat.test(stringDate)) {
        const splitDate = stringDate.split('/');
        const ISODate = `${splitDate[2]}-${splitDate[1]}-${splitDate[0]}`;
        return new Date(ISODate);
      } else if (validFormat2.test(stringDate)) {
        const splitDate = stringDate.split('-');
        const ISODate = `${splitDate[2]}-${splitDate[1]}-${splitDate[0]}`;
        return new Date(ISODate);
      } else {
        throw ERRORS.ERROR_INVALID_DATE;
      }
    }
    return new Date(date);
  }
}

export function dateFromNumber(number: number): Date {
  const MS_PER_DAY = 24 * 60 * 60 * 1000; // Ms per day
  const baseDate = new Date('1900-01-01'); // start date (1/1/1900)
  const date = new Date(baseDate.getTime() + number * MS_PER_DAY);

  // Set hours, minutes, secs and millisecs to 0.
  date.setHours(0, 0, 0, 0);

  return date;
}

// To check if date is today or not
export function isToday(date: string) {
  const today = new Date().toISOString().split(/[T ]/i, 1)[0];
  if (today === date) {
    return true;
  }
  return false;
}

// To check the language of the data
export function langSetter(data: string) {
  if(data.charCodeAt(0) >= 2432 && data.charCodeAt(0) <= 2559){
    return 'BN';
  }
  return 'EN';
}

// Function to obtain random numbers biased. Used for statistics, workaround in case some diagnostics 
// are not properly finished
// Right now it is not being used
export function getRandomBiased(min: number, max: number, bias: number, influence: number) {
  const rnd = Math.random() * (max - min) + min,   // random in range
    mix = Math.random() * influence;           // random mixer
  return Math.abs(Math.floor(rnd * (1 - mix) + bias * mix));           // mix full range and bias
}

/* export function checkUserPermissions (user: User, factory_id: string) {
  if(!user.su) {
    const uFacts = user.userFactories!.map((fact) => { return fact.factory_id;});
    if(!uFacts.includes(factory_id)) {
      throw ERRORS.ERROR_FORBIDDEN;
    }
  }
} */

// Yes, I know. This is not good practices. But it is the most suitable option
// at least for the moment and works like a charm. In case the process slows down, it would
// work even better. I'm not justifying a sleep in my code, but it could be worse
export function sleep(ms: number) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

export const dateFormatter = (dateString1: string, dateString2: string) => {

  let date1 = new Date(dateString1);
  let date2 = new Date(dateString2);

  //Change date orders in case is not the correct one
  if (date1 > date2) {
    const auxDate = date1;
    date1 = date2;
    date2 = auxDate;
  }
  return { date1, date2 };
};

export const verifyAPIToken = async (token: string) => {
  try {
    // Verify token
    const PublicKey = fs.readFileSync(config.get('jwtPublicSecretPath'));
    const jwtObject = jwt.verify(token, PublicKey, {algorithms: ['ES256']});
    const secret = config.get('microserviceSecret');
    if (typeof(jwtObject) === 'object' && jwtObject.secret !== secret) {
      throw ERRORS.ERROR_INVALID_TOKEN;
    }

  } catch (err: any) {
    console.error(err);
    if (err.status) {
      throw err;
    }
    if(err.expiredAt) {
      throw ERRORS.ERROR_EXPIRED_TOKEN;
    }
    throw ERRORS.ERROR_VERIFY_AUTH_TOKEN;
  }
};


//obtain jwt to communicate with microservices
export const generateAPIToken = async () => {
  try {

    const privateKey = fs.readFileSync(config.get('jwtPrivateSecretPath'));
    const secret: string = config.get('microserviceSecret');

    return jwt.sign({secret}, privateKey, { algorithm: 'ES256', expiresIn: '60s' });

  } catch (err: any) {
    console.error(err);
    if (err.status) {
      throw err;
    }
    throw ERRORS.ERROR_GENERATE_TOKEN;
  }
};

export const getConfigFactoryIDs = () => {
  let fIDs: string[] = process.env.factoryIDs?.split(',') || config.get('factoryIDs');
  if (fIDs.some((fID: string) => fID === 'MAIN') && fIDs.length > 1) {
    fIDs = ['MAIN'];
  }
  return fIDs;
};
