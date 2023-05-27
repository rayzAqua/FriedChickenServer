export const isNumericString = (str) => {
    // Sử dụng biểu thức chính quy để kiểm tra chuỗi chỉ chứa ký tự số từ 0-9
    const numericRegex = /^[0-9]+$/;

    return numericRegex.test(str);
};

export const isAlphabeticString = (str) => {
    // Sử dụng biểu thức chính quy để kiểm tra chuỗi chỉ chứa ký tự alphabet a-z và A-Z
    const alphabeticRegex = /^[a-zA-Z\s]+$/;

    return alphabeticRegex.test(str);
};