import User from "../models/User.js";
import Role from "../models/Role.js";
import { isAlphaNumbericSpecialString, isAlphaNumbericString, isAlphabeticString, isNumericString, isValidateEmail } from "../utils/checkInput.js";
import { encode } from "../utils/my-bcrypt.js";

// CREATE
export const createUser = async (req, res, next) => {
    const name = req.body.name;
    const email = req.body.userEmail;
    const phone = req.body.phone;
    const image = req.body.image ? (req.body.image === "" ? null : req.body.image) : null;
    const password = req.body.password;
    const roleId = req.body.listRole;
    const createdUser = req.body.userId;

    try {
        // Kiểm tra name
        if (name) {
            if (!isAlphaNumbericString(name)) {
                res.status(200).json({
                    state: false,
                    message: "Name chỉ chấp nhận ký tự chữ, số và khoảng trống!",
                    data: []
                });
                return;
            }
        } else {
            res.status(200).json({
                state: false,
                message: "Không được bỏ trống thông tin về name!",
                data: []
            });
            return;
        }

        // Kiểm tra email
        if (email) {
            if (!isValidateEmail(email)) {
                res.status(200).json({
                    state: false,
                    message: "Email không hợp lệ!",
                    data: []
                });
                return;
            }
        } else {
            res.status(200).json({
                state: false,
                message: "Không được bỏ trống thông tin email!",
                data: []
            });
            return;
        }

        // Kiểm tra thông tin phone
        if (phone) {
            if (phone.length !== 10) {
                res.status(200).json({
                    state: false,
                    message: "Số điện thoại phải có 10 chữ số!",
                    data: []
                });
                return;
            }
            if (!isNumericString(phone)) {
                res.status(200).json({
                    state: false,
                    message: "Số điện thoại chỉ chấp nhận ký tự số!",
                    data: []
                });
                return;
            }
        } else {
            res.status(200).json({
                state: false,
                message: "Không được bỏ trống thông tin số điện thoại!",
                data: []
            });
            return;
        }

        // Kiểm tra password
        if (password) {
            if (!isAlphaNumbericSpecialString(password)) {
                res.status(200).json({
                    state: false,
                    message: "Mật khẩu có chứa ký tự không hợp lệ!",
                    data: []
                });
                return;
            }
        } else {
            res.status(200).json({
                state: false,
                message: "Không được bỏ trống mật khẩu!",
                data: []
            });
            return;
        }

        // Kiểm tra roleId - xử lý roleId
        if (roleId && roleId.length > 0) {
            await Promise.all(roleId.map(async (id) => {
                if (typeof id !== 'number') {
                    res.status(200).json({
                        state: false,
                        message: "Phải nhập số cho ID của role!",
                        data: []
                    });
                    return;
                }
                const existedRole = await Role.findById(id);
                if (existedRole.length <= 0) {
                    res.status(200).json({
                        state: false,
                        message: "Role không tồn tại!",
                        data: []
                    });
                    return;
                }
            }));
        } else {
            res.status(200).json({
                state: false,
                message: "Không được bỏ trống listRole!",
                data: []
            });
            return;
        }

        const isExistedEmail = await User.getByEmail(email);

        if (email && isExistedEmail) {
            res.status(200).json({
                state: false,
                message: "Email này đã tồn tại trong hệ thống!",
                data: []
            });
            return;
        }

        const encodePassword = encode(password);
        const newUser = await User.newUser(name, email, phone, image, encodePassword, JSON.stringify(roleId), createdUser);
        const filterNewUser = Array.isArray(newUser[0]) ? newUser[0] : [newUser[0]];
        const filterNewRole = Array.isArray(newUser[1]) ? newUser[1] : [newUser[1]];

        if (filterNewUser.length > 0) {
            const user = filterNewUser.map((user) => {
                const { ...otherDetails } = user;
                return {
                    ...otherDetails,
                    listRole: filterNewRole,
                }
            });

            res.status(200).json({
                state: true,
                message: "Tạo mới user thành công!",
                data: user
            });
            return;
        } else {
            res.status(200).json({
                state: false,
                message: "Tạo mới user thất bại!",
                data: []
            });
            return;
        }
    } catch (err) {
        next(err);
    }
}

// UPDATE
export const updateUser = async (req, res, next) => {
    const userId = req.body.updatedUserId;
    const name = req.body.name ? (req.body.name === "" ? null : req.body.name) : null;
    const phone = req.body.phone ? (req.body.phone === "" ? null : req.body.phone) : null;
    const image = req.body.image ? (req.body.image === "" ? null : req.body.image) : null;
    const status = req.body.status ? (req.body.status === "" ? null : req.body.status) : null;
    const roleId = req.body.listRole ? (req.body.listRole === "" ? null : req.body.listRole) : null;
    const updatedUser = req.body.userId;

    try {
        // Kiểm tra roleId
        const existedUser = await User.getById(userId);
        if (userId) {
            if (typeof userId !== 'number') {
                res.status(200).json({
                    state: false,
                    message: "Phải nhập số cho ID của user!",
                    data: []
                });
                return;
            }
            if (existedUser.length <= 0) {
                res.status(200).json({
                    state: false,
                    message: "User không tồn tại!",
                    data: []
                });
                return;
            }
        } else {
            res.status(200).json({
                state: false,
                message: "Không được bỏ trống thông tin của userId!",
                data: []
            });
            return;
        }


        // Kiểm tra name
        if (name !== null && !isAlphaNumbericString(name)) {
            res.status(200).json({
                state: false,
                message: "Name chỉ chấp nhận ký tự chữ, số và khoảng trống!",
                data: []
            });
            return;
        }

        // Kiểm tra thông tin phone
        if (phone !== null) {
            if (phone.length !== 10) {
                res.status(200).json({
                    state: false,
                    message: "Số điện thoại phải có 10 chữ số!",
                    data: []
                });
                return;
            }
            if (!isNumericString(phone)) {
                res.status(200).json({
                    state: false,
                    message: "Số điện thoại chỉ chấp nhận ký tự số!",
                    data: []
                });
                return;
            }
        }

        // Kiểm tra thông tin status
        if (status !== null && !isAlphaNumbericString(status)) {
            res.status(200).json({
                state: false,
                message: "Status chỉ chấp nhận ký tự chữ, số và khoảng trắng!",
                data: []
            });
            return;
        }

        // Kiểm tra roleId
        if (roleId !== null && roleId.length > 0) {
            await Promise.all(roleId.map(async (id) => {
                if (typeof id !== 'number') {
                    res.status(200).json({
                        state: false,
                        message: "Phải nhập số cho ID của role!",
                        data: []
                    });
                    return;
                }
                const existedRole = await Role.findById(id);
                if (existedRole.length <= 0) {
                    res.status(200).json({
                        state: false,
                        message: "Role không tồn tại!",
                        data: []
                    });
                    return;
                }
            }));
        }

        const updatedTime = new Date();
        const updateUser = await User.updateUser(userId, name, phone, image, status, roleId !== null ? JSON.stringify(roleId) : null, updatedUser, updatedTime);
        const filterUpdateUser = Array.isArray(updateUser[0]) ? updateUser[0] : [updateUser[0]];
        const filterUpdateRole = Array.isArray(updateUser[1]) ? updateUser[1] : [updateUser[1]];

        if (filterUpdateUser.length > 0) {
            const user = filterUpdateUser.map((user) => {
                const { ...otherDetails } = user;
                return {
                    ...otherDetails,
                    listRole: filterUpdateRole,
                }
            });

            res.status(200).json({
                state: true,
                message: "Cập nhật user thành công!",
                data: user,
            });
            return;
        } else {
            res.status(200).json({
                state: false,
                message: "Cập nhật user thất bại!",
                data: []
            });
            return;
        }
    } catch (err) {
        next(err);
    }
}

// GET LIST
export const getUserList = async (req, res, next) => {

    const userId = req.query.getUserId || null;
    const k3y = req.query.key || null;
    const page = Number(req.query.page) || 1;
    const page_limit = page < 0 ? 1000 : 10;
    const off_set = page < 0 ? 0 : (page - 1) * 10;

    try {
        const getUsers = await User.getUserList(userId, k3y, page_limit, off_set);
        const filterUserArray = Array.isArray(getUsers[0]) ? getUsers[0] : [getUsers[0]];
        const totalUsers = Array.isArray(getUsers[1]) ? getUsers[1] : [getUsers[1]];
        const total_page = Math.ceil(totalUsers[0].total_users / page_limit);

        // Tạo ra một đối tượng response để phản hồi kết quả truy vấn.
        const response = {
            state: true,
            message: "Lấy dữ liệu thành công!",
        }

        if (filterUserArray.length > 0) {

            const newUserArray = await Promise.all(filterUserArray.map(async (user) => {
                const { createdUser, createdTime, updatedUser, updatedTime, ...otherDetails } = user;

                const [created, updated] = await Promise.all([
                    User.getById(createdUser),
                    User.getById(updatedUser)
                ]);

                return {
                    ...otherDetails,
                    createdUser: created.length > 0 ? created[0].name : null,
                    createdTime: createdTime,
                };
            }));

            // Nếu truy vấn bằng customerId, chỉ địch danh họ tên, số điện thoại hoặc email thì không phân trang.
            // Nếu không phải các trường hợp đặc biệt nêu trên thì phân trang.
            if (userId) {
                response.data = newUserArray;
                res.status(200);
            }
            else if (page < 0) {
                response.data = newUserArray;
                res.status(200);
            }
            else {
                response.data = newUserArray;
                response.current_page = page;
                response.total_page = total_page;
                res.status(200);
            }
        } else {
            response.state = false;
            response.message = "Không tìm thấy dữ liệu!";
            response.data = filterUserArray;
            res.status(404);
        }
        // OUTPUT
        res.json(response);
    } catch (err) {
        next(err);
    }
};