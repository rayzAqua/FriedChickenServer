import { connecting, query } from "../sql_connect/connected.js";

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

    const sp = "CALL sp_get_list_role_by_id(?)";
    const results = await query(sp, userId);
    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default Role;
