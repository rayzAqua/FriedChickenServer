import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class User {
  constructor() {
    this.userId = null;
    this.name = null;
    this.email = null;
    this.phone = null;
    this.image = null;
    this.password = null;
    this.status = null;
    this.createdDate = null;
    this.createdUser = null;
  }

  construct(user) {
    this.userId = user.userId;
    this.name = user.name;
    this.email = user.email;
    this.phone = user.phone;
    this.image = user.image;
    this.password = user.password;
    this.status = user.status;
    this.createdDate = user.createdDate;
    this.createdUser = user.createdUser;
  }

  async getByEmail(email) {
    try {
      const results = await query("SELECT * FROM user WHERE email = ?", [email]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  
  async getById(userId) {
    try {
      // const results = await query("SELECT * FROM user WHERE userId = ?", [
      //   userId,
      //
      //]);
      const sp = "CALL sp_get_user_by_id(?);";
      const results = await query(sp, [userId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const user = Singleton.getModel('user', User);

export default user;
