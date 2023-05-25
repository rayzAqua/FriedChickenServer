import Customer from "../models/Customer.js";
import { createError } from "../utils/createError.js";

// CREATE CUSTOMER
export const createCustomer = async (req, res, next) => {

    const name = req.query.name;
    const phone = req.query.phone;
    const email = req.query.email || null;
    const address = req.query.address || null;

    console.log(name, phone, email, address);

    // Hai trường không được phép null
    if (name && phone) {
        try {
            // Tạo mới khách hàng từ thông tin của req
            const newCustomer = await Customer.createCustomer(name, phone, email, address);
            // Lọc lại dữ liệu trả về sau khi tạo mới khách hàng.
            const filterNewCustomer = Array.isArray(newCustomer[0]) ? newCustomer[0] : [newCustomer[0]];
            console.log(filterNewCustomer);

            // Kiểm tra xem filterNewCustomer có rỗng không, nếu nó rỗng thì nghĩa là tạo mới khách hàng thất bại.
            // Còn nếu không thì trả về thông tin khách hàng vừa tạo cho client
            if (filterNewCustomer.length > 0) {
                res.status(200).json({
                    state: true,
                    message: "Tạo mới khách hàng thành công!",
                    data: filterNewCustomer,
                });
            }
            // Trả về thông báo lỗi.
            else {
                res.status(500).json({
                    state: false,
                    message: "Tạo mới khách hàng không thành công!",
                    data: filterNewCustomer,
                });
            }
        } catch (err) {
            next(err);
        }
    }
    // Trả về thông báo lỗi!
    else {
        res.status(400).json({
            state: false,
            message: "Không được bỏ trống thông tin tên và số điện thoại!",
            data: [],
        })
    }
}

// GET CUSTOMER LIST
export const getCustomerList = async (req, res, next) => {

    try {

    } catch (err) {
        next(err);
    }

};
