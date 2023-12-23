const dotenv = require('dotenv');
dotenv.config();

const secretApiKey = process.env.API_KEY_SECRET;
const publicApiKey = process.env.API_KEY_PUBLIC;
const dbPort = process.env.DB_PORT;
const dbName = process.env.DB_NAME;
const dbUser = process.env.DB_USER;
const dbUrl = process.env.DB_URL;
const dbPassword = process.env.DB_PASSWORD;

console.log('Secret API Key:', secretApiKey);
console.log('Public API Key:', publicApiKey);
console.log('Database Port:', dbPort);
console.log('Database Name:', dbName);
console.log('Database User:', dbUser);
console.log('Database URL:', dbUrl);
console.log('Database Password:', dbPassword)