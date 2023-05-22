import bcrypt from "bcryptjs";
const salt = 10;

export function encode(password) {
  let encodedPass = bcrypt.hashSync(password, salt);
  return encodedPass;
}
export function compare(unencodedPassword, encodedPassword) {
  return bcrypt.compareSync(unencodedPassword, encodedPassword);
}
