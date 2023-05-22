// Tạo mới một đối tượng lỗi để thông báo lỗi theo nhu cầu.
export const createError = (status, message) => {
    const err = new Error();
    err.status = status;
    err.message = message;
    return err;
}