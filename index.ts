import express from 'express';
import helmet from 'helmet';
import corsMiddleware from 'middleware/cors';
import cookieParser from 'cookie-parser';
import 'dotenv/config';
import connectPgDB from 'config/pgDB';
import { normalizePathMiddleware } from 'middleware/access';

// Create an Express application
const app = express();
const PORT = process.env.PORT || 5000;


// Connect pgDB
export const pgClient = connectPgDB();


// Middleware to parse JSON request bodies
app.use(helmet());
app.use(express.json({limit: '260mb'}));
app.use(express.urlencoded({limit: '260mb', extended: true }));

//Cors middleware
corsMiddleware(app);
// Cookie parser
app.use(cookieParser());

// Define routes
/* app.use('/api/administration/apps', apps.router);
app.use('/api/administration/factories', factories.router);
app.use('/api/administration/init', init.router);
app.use('/api/administration/db', db.router);
app.use('/api/administration/fixes', fixes.router);
app.use('/api/administration/constants', constants.router);
app.use('/api/administration/images', images.router); */

// Route validator
app.use(normalizePathMiddleware);
// Start the Express server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
