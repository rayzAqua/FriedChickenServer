function calculateStart(paging) {
    return 10 * Number(paging - 1)
}
export function calculateTotal(number) {
    return Math.round(parseFloat(number) / 10)
}
export default calculateStart
