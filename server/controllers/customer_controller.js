import Customer from "../models/Customer.js";
import { isAlphabeticString, isNumericString, isValidateEmail } from "../utils/checkInput.js";
import { createError } from "../utils/createError.js";

// CREATE CUSTOMER
export const createCustomer = async (req, res, next) => {

    const name = req.body.name;
    const phone = req.body.phone;
    const email = req.body.email || null;
    const address = req.body.address || null;

    // console.log(name, phone, email, address);

    const existedEmailPhone = await Customer.getCustomerByEmailPhone(phone, email);
    const filterExistedEmailPhone = Array.isArray(existedEmailPhone[0]) ? existedEmailPhone[0] : [existedEmailPhone[0]];

    const response = {
        state: true,
        message: "Tạo mới khách hàng thành công!",
    }

    // Hai trường không được phép null
    if (name && phone) {
        if (filterExistedEmailPhone[0].count === 0) {
            // Kiểm tra name có chứa ký tự a-z hoặc A-Z không. Nếu có thì tiếp tục xử lý. Nếu không thì báo lỗi.
            if (isAlphabeticString(name)) {
                // Kiểm tra xem có phone có kí tự khác ngoài ký tự số nguyên từ 0-9 không. Nếu không thì tiếp tục xử lý.
                // Nếu có thì báo lỗi.
                if (isNumericString(phone)) {
                    if (isValidateEmail(email)) {
                        // Kiểm tra xem độ dài chuỗi sđt có đúng là 10 số không. Nếu đúng thì tiếp tục xử lý. Nếu không thì báo lỗi.
                        if (phone.length === 10) {
                            try {
                                // Tạo mới khách hàng từ thông tin của req
                                const newCustomer = await Customer.createCustomer(name, phone, email, address);
                                // Lọc lại dữ liệu trả về sau khi tạo mới khách hàng.
                                const filterNewCustomer = Array.isArray(newCustomer[0]) ? newCustomer[0] : [newCustomer[0]];
                                console.log(filterNewCustomer);

                                // Kiểm tra xem filterNewCustomer có rỗng không, nếu nó rỗng thì nghĩa là tạo mới khách hàng thất bại.
                                // Còn nếu không thì trả về thông tin khách hàng vừa tạo cho client
                                if (filterNewCustomer.length > 0) {
                                    response.data = filterNewCustomer;
                                    res.status(200);
                                }
                                // Trả về thông báo lỗi.
                                else {
                                    response.state = false;
                                    response.message = "Tạo mới khách hàng không thành công!";
                                    response.data = filterNewCustomer;
                                    res.status(500);
                                }
                            } catch (err) {
                                next(err);
                            }
                        } else {
                            response.state = false;
                            response.message = "Số điện thoại chỉ chứa ký tự số từ 0-9!";
                            response.data = [];
                            res.status(400);
                        }
                    } else {
                        response.state = false;
                        response.message = "Email không hợp lệ!";
                        response.data = [];
                        res.status(400);
                    }
                } else {
                    response.state = false;
                    response.message = "Số điện thoại phải có 10 chữ số!";
                    response.data = [];
                    res.status(400);
                }
            } else {
                response.state = false;
                response.message = "Tên không chứa ký tự số và ký tự đặc biệt!";
                response.data = [];
                res.status(400);
            }
        } else if (filterExistedEmailPhone[0].phone.toLowerCase().includes(phone.toLowerCase())) {
            response.state = false;
            response.message = "Số điện thoại này đã tồn tại trong hệ thống!";
            response.data = [];
            res.status(400);
        } else if (filterExistedEmailPhone[0].email.toLowerCase().includes(email.toLowerCase())) {
            response.state = false;
            response.message = "Địa chỉ email này đã tồn tại trong hệ thống!";
            response.data = [];
            res.status(400);
        }
    }
    // Trả về thông báo lỗi!
    else {
        response.state = false;
        response.message = "Không được bỏ trống thông tin tên và số điện thoại!";
        response.data = [];
        res.status(400);
    }
    res.json(response);
}

// UPDATE CUSTOMER
export const updateCustomer = async (req, res, next) => {
    const customerId = req.body.customerId;
    const name = req.body.name || null;
    const phone = req.body.phone || null;
    const email = req.body.email || null;
    const address = req.body.address || null;


    if (!customerId) {
        res.status(400).json({
            state: false,
            message: "Không được bỏ trống thông tin về customerId!",
            data: []
        });
        return;
    }

    // Kiểm tra nếu trường không null thì mới kiểm tra và xử lý
    if (name !== null && !isAlphabeticString(name)) {
        res.status(400).json({
            state: false,
            message: "Tên không chứa ký tự số và ký tự đặc biệt!",
            data: []
        });
        return;
    }

    if (phone !== null && !isNumericString(phone)) {
        res.status(400).json({
            state: false,
            message: "Số điện thoại chỉ chứa ký tự số từ 0-9!",
            data: []
        });
        return;
    }

    if (email !== null && !isValidateEmail(email)) {
        res.status(400).json({
            state: false,
            message: "Email không hợp lệ!",
            data: []
        });
        return;
    }

    if (phone !== null && phone.length !== 10) {
        res.status(400).json({
            state: false,
            message: "Số điện thoại phải có 10 chữ số!",
            data: []
        });
        return;
    }

    // Mail không đc giống với mail đã có trong hệ thống.
    // Phone không được giống với phone đã có trong hệ thống.

    const existedEmailPhone = await Customer.getCustomerByEmailPhone(phone, email);
    const filterExistedEmailPhone = Array.isArray(existedEmailPhone[0]) ? existedEmailPhone[0] : [existedEmailPhone[0]];

    const response = {
        state: true,
        message: "Cập nhật thông tin khách hàng thành công!",
    }
    if (filterExistedEmailPhone[0].count === 0) {
        try {
            // Cập nhật thông tin khách hàng
            const updatedCustomer = await Customer.updateCustomer(customerId, name, phone, email, address);
            // Lọc lại dữ liệu trả về sau khi cập nhật thông tin khách hàng.
            const filterUpdatedCustomer = Array.isArray(updatedCustomer[0]) ? updatedCustomer[0] : [updatedCustomer[0]];

            // Kiểm tra xem filterUpdatedCustomer có rỗng không, nếu nó rỗng thì nghĩa là cập nhật không thành công.
            // Nếu không thì trả về thông tin khách hàng đã được cập nhật cho client.
            if (filterUpdatedCustomer.length > 0) {
                response.data = filterUpdatedCustomer;
                res.status(200);
            } else {
                response.state = false;
                response.message = "Cập nhật thông tin khách hàng không thành công!";
                response.data = filterUpdatedCustomer;
                res.status(500);
            }
        } catch (err) {
            next(err);
        }
    } else if (phone && filterExistedEmailPhone[0].phone.toLowerCase().includes(phone.toLowerCase())) {
        response.state = false;
        response.message = "Số điện thoại này đã tồn tại trong hệ thống!";
        response.data = [];
        res.status(400);
    } else if (email && filterExistedEmailPhone[0].email.toLowerCase().includes(email.toLowerCase())) {
        response.state = false;
        response.message = "Địa chỉ email này đã tồn tại trong hệ thống!";
        response.data = [];
        res.status(400);
    }

    res.json(response);
};

// GET CUSTOMER LIST
export const getCustomerList = async (req, res, next) => {

    // Lấy các giá trị truy vấn.
    const customerId = req.query.customerId || null;
    const k3y = req.query.key || null;
    // Giới hạn mẫu dữ liệu hiển thị cho một trang.
    const page_limit = 10;
    // Số trang hiện tại được truyền vào từ req, mặc định là 1.
    const page = Number(req.query.page) || 1;
    // Gía trị off_set là vị trí bắt đầu lấy mẫu dữ liệu trong truy vấn bằng sp_get_customer_list.
    const off_set = (page - 1) * 10;

    try {
        // Truy vấn lấy danh sách các khách hàng theo dữ liệu được truyền vào.
        const getCustomers = await Customer.getCustomerList(customerId, k3y, page_limit, off_set);
        const filterCustomerArray = Array.isArray(getCustomers[0]) ? getCustomers[0] : [getCustomers[0]];
        const totaCustomers = Array.isArray(getCustomers[1]) ? getCustomers[1] : [getCustomers[1]];
        // Tính tổng số trang dựa vào tổng số mẫu dữ liệu và giới hạn hiển thị của mẫu dữ liệu trong 1 trang.
        const total_page = customerId ? 0 : (Math.ceil(totaCustomers[0].total_customers / page_limit));

        // Tạo ra một đối tượng response để phản hồi kết quả truy vấn.
        const response = {
            state: true,
            message: "Lấy dữ liệu thành công!",
        }

        // Nếu sau khi truy vấn mà mảng filterCustomerArray có dữ liệu thì tiến hành gửi dữ liệu cho client.
        // Nếu không thì thông báo lỗi không tìm thấy tài nguyên.
        if (filterCustomerArray.length > 0) {
            // Nếu truy vấn bằng customerId, chỉ địch danh họ tên, số điện thoại hoặc email thì không phân trang.
            // Nếu không phải các trường hợp đặc biệt nêu trên thì phân trang.
            if (customerId) {
                response.data = filterCustomerArray;
                res.status(200);
            }
            else if (filterCustomerArray.length === 1) {
                if (k3y && (
                    filterCustomerArray[0].name.toLowerCase().includes(k3y.toLowerCase()) ||
                    filterCustomerArray[0].phone.toLowerCase().includes(k3y.toLowerCase()) ||
                    filterCustomerArray[0].email.toLowerCase().includes(k3y.toLowerCase())
                )) {
                    response.data = filterCustomerArray;
                    res.status(200);
                } else if (page) {
                    response.data = filterCustomerArray;
                    response.current_page = page;
                    response.total_page = total_page;
                    res.status(200);
                }
            }
            else {
                response.data = {
                    customerLists: filterCustomerArray,
                    current_page: page,
                    total_page: total_page,
                };
                res.status(200);
            }
        } else {
            response.state = false;
            response.message = "Không tìm thấy dữ liệu!";
            response.data = filterCustomerArray;
            res.status(404);
        }
        // OUTPUT
        res.json(response);
    } catch (err) {
        next(err);
    }
};
