const connection = require("../sql_connect/connected.js");

async function getId(email) {
  try {
    let [rows, field] = await connection.execute(
      "select * from user where email ='?'",
      email
    );

    userId = rows[0].userId;
    return { userId };
  } catch (error) {
    return undefined;
  }
}

module.exports = getId;
