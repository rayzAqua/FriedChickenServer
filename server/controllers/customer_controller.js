import Customer from "../models/Customer.js";
import { isAlphabeticString, isNumericString } from "../utils/checkInput.js";
import { createError } from "../utils/createError.js";

// CREATE CUSTOMER
export const createCustomer = async (req, res, next) => {

    const name = req.body.name;
    const phone = req.body.phone;
    const email = req.body.email || null;
    const address = req.body.address || null;

    // console.log(name, phone, email, address);

    const response = {
        state: true,
        message: "Tạo mới khách hàng thành công!",
    }
    
    // Hai trường không được phép null
    if (name && phone) {
        // Kiểm tra name có chứa ký tự a-z hoặc A-Z không. Nếu có thì tiếp tục xử lý. Nếu không thì báo lỗi.
        if (isAlphabeticString(name)) {
            // Kiểm tra xem có phone có kí tự khác ngoài ký tự số nguyên từ 0-9 không. Nếu không thì tiếp tục xử lý.
            // Nếu có thì báo lỗi.
            if (isNumericString(phone)) {
                // Kiểm tra xem độ dài chuỗi sđt có đúng là 10 số không. Nếu đúng thì tiếp tục xử lý. Nếu không thì báo lỗi.
                if (phone.length === 10) {
                    try {
                        // Tạo mới khách hàng từ thông tin của req
                        const newCustomer = await Customer.createCustomer(name, phone, email, address);
                        // Lọc lại dữ liệu trả về sau khi tạo mới khách hàng.
                        const filterNewCustomer = newCustomer ? (Array.isArray(newCustomer[0]) ? newCustomer[0] : [newCustomer[0]]) : [];
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

// GET CUSTOMER LIST
export const getCustomerList = async (req, res, next) => {

    // Lấy các giá trị truy vấn.
    const customerId = req.query.customerId || null;
    const name = req.query.name || null;
    const phone = req.query.phone || null;
    const email = req.query.email || null;
    // Giới hạn mẫu dữ liệu hiển thị cho một trang.
    const page_limit = 10;
    // Số trang hiện tại được truyền vào từ req, mặc định là 1.
    const page = Number(req.query.page) || 1;
    // Gía trị off_set là vị trí bắt đầu lấy mẫu dữ liệu trong truy vấn bằng sp_get_customer_list.
    const off_set = customerId ? 0 : ((page - 1) * 10);

    try {
        // Truy vấn lấy danh sách các khách hàng theo dữ liệu được truyền vào.
        const getCustomers = await Customer.getCustomerList(customerId, name, phone, email, page_limit, off_set);
        // Sau khi truy vấn thì mảng dữ liệu trả có chứa cả thông tin truy vấn nên cần lọc lại.
        // Mảng filterCustomerArray có nhiệm vụ chứa dữ liệu khách hàng sau khi truy vấn.
        const filterCustomerArray = Array.isArray(getCustomers[0]) ? getCustomers[0] : [getCustomers[0]];
        // Mảng totaCustomers có nhiệm vụ lưu lại tổng số mẫu dữ liệu có trong bảng customer. Dữ liệu này dùng để
        // tính tổng số trang.
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
            if (customerId || (name && filterCustomerArray.length === 1) || (phone && filterCustomerArray.length === 1) || (email && filterCustomerArray.length === 1)) {
                response.data = filterCustomerArray;
                res.status(200);
            } else {
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
