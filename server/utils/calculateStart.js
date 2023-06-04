function calculateStart(paging) {
  return 10 * Number(paging - 1);
}
export function calculateTotal(number) {
  return Math.ceil(parseFloat(number) / 10);
}
export default calculateStart;
