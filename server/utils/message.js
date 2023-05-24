export default function message(status = true, message = "", data) {
  if (!Array.isArray(data)) {
    data = [data];
  }
  if (typeof status != "boolean") throw new Error("Status must be a boolen");
  if (typeof message != "string") throw new Error("Message must be a string");
  return { status, message, data };
}
