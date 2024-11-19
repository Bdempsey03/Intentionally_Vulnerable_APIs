import mysql from 'mysql2';
import dotenv from 'dotenv';
dotenv.config();

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()

export async function getUsers() {
    const [rows] = await pool.query("SELECT * FROM users");
    return rows;
}

export async function makeUser(firstName, lastName){
    const status = await pool.query(`INSERT INTO users (firstName, lastName)  VALUES ('${firstName}', '${lastName}')`);
    // const status = await pool.query(`INSERT INTO users (?, ?)  VALUES ('A', 'Virus')`, [firstName, lastName]);

}
// const [rows] = await pool.query(
//     "INSERT INTO users (firstName, lastName)  VALUES ('A', 'Virus')")

// const stat = await makeUser("LeBron", "James");
// console.log(stat);
const users = await getUsers();
console.log(users);
