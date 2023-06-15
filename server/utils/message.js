export default function message(
  state = true,
  message = "",
  data,
  isShowPage = false,
  currentPage = 0,
  totalPage = 0
) {
  if (!Array.isArray(data)) {
    data = [data];
  }
  if (typeof state != "boolean") throw new Error("Status must be a boolen");
  if (typeof message != "string") throw new Error("Message must be a string");
  if (isShowPage) return { state, message, data, currentPage, totalPage };
  else return { state, message, data };
}
