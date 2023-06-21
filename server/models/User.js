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

  setUser(user) {
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

  // CREATE
  async newUser(name, email, phone, image, password, roleId, createdUser) {
    try {
      const sp = "CALL sp_create_user(?, ?, ?, ?, ?, ?, ?);";
      const newUser = await query(sp, [
        name,
        email,
        phone,
        image,
        password,
        roleId,
        createdUser,
      ]);
      return newUser;
    } catch (err) {
      console.error("Error executing query:", err);
      throw err;
    }
  }

  // UPDATE
  async updateUser(
    userId,
    name,
    phone,
    image,
    status,
    roleId,
    updatedUser,
    updatedTime
  ) {
    try {
      const sp = "CALL sp_update_user(?, ?, ?, ?, ?, ?, ?, ?);";
      const updateUser = await query(sp, [
        userId,
        name,
        phone,
        image,
        status,
        roleId,
        updatedUser,
        updatedTime,
      ]);
      return updateUser;
    } catch (err) {
      console.error("Error executing query:", err);
      throw err;
    }
  }

  async updatePassword(userId, password) {
    try {
      const sp = "CALL sp_update_password(?, ?);";
      const updateUser = await query(sp, [userId, password]);
      return updateUser;
    } catch (err) {
      console.error("Error executing query:", err);
      throw err;
    }
  }

  async getByEmail(email) {
    try {
      const results = await query("SELECT * FROM user WHERE email = ?", [
        email,
      ]);
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

  // GET USER LIST
  async getUserList(userId, k3y, page_limit, off_set) {
    try {
      const sp = "CALL sp_get_user_list(?, ?, ?, ?);";
      const users = await query(sp, [userId, k3y, page_limit, off_set]);
      return users;
    } catch (err) {
      console.log("Error executing query: ", err);
      throw err;
    }
  }
}

const user = Singleton.getModel("user", User);

export default user;
