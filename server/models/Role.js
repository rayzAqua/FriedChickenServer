import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

const Role = function (role) {
  this.roleId = role.roleId;
  this.name = role.name;
  this.createdDate = role.createdDate;
  this.createdUser = role.createdUser;
};

Role.getListRoleByUserId = async function (userId) {
  try {
    // const results = await query(
    //   "SELECT role.roleId, role.name" +
    //     " FROM user" +
    //     " JOIN userrole ON user.userId = userrole.userId" +
    //     " JOIN role ON userrole.roleId = role.roleId" +
    //     " WHERE user.userId  = ?",
    //   [userId]
    // );

    const sp = "CALL sp_get_list_role_by_id(?);";
    const results = await query(sp, [userId]);
    console.log(results[0]);
    return results[0];
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

Role.getListRole = async function () {
  try {
    const results = await query("SELECT * FROM railway.role");
    console.log(results);
    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

const role = Singleton.getModel("role", Role);

export default role;
