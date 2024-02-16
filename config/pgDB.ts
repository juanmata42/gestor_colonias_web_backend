import config from 'config';
import pg from 'pg';


const user: string = config.get('pgUser');
const password: string = config.get('pgPsw');
const host: string = config.get('pgHost');

const connectPgDB = () => {
  try {
  
    const client = new pg.Client({
      user,
      password,
      database: 'postgres',
      host
    });
    client.connect();
   
    client.query('SELECT $1::text as message', ['PostgreSQL DB connected']).then((res) => {
      console.log(res.rows[0].message);
    });
    return client;
  
  }catch (err: any){
    console.error(err);
    process.exit(1);
  }
};

export default connectPgDB;