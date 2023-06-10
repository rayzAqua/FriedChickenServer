import { connecting, query } from "../sql_connect/connected.js";

const User = function (user) {
  this.userId = user.userId;
  this.name = user.name;
  this.email = user.email;
  this.phone = user.phone;
  this.image = user.image;
  this.password = user.password;
  this.status = user.status;
  this.createdDate = user.createdDate;
  this.createdUser = user.createdUser;
};

User.getByEmail = async function (email) {
  try {
    const results = await query("SELECT * FROM user WHERE email = ?", [email]);

    // const sp = "CALL get_user_by_email(?);";
    // const results = await query(sp, [email]);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

User.getById = async function (userId) {
  try {
    // const results = await query("SELECT * FROM user WHERE userId = ?", [
    //   userId,
    // ]);

    const sp = "CALL sp_get_user_by_id(?);";
    const results = await query(sp, [userId]);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default User;
