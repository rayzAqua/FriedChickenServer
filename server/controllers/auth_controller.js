import Role from '../models/Role.js'
import User from '../models/User.js'
import getToken from '../utils/getToken.js'
import message from '../utils/message.js'
import {compare} from '../utils/my-bcrypt.js'

class AuthController {
    //[POST] /account/sign-in
    async logIn(req, res, next) {
        try {
            const {username, password} = req.body
            if (!username || !password) {
                return res.send(message(false, 'Tên đăng nhập và mật khẩu không được để trống!', ''))
            }

            const user = await User.getByEmail(username)

            if (!user || user.length === 0 || !compare(password, user.password)) {
                return res.send(message(false, 'Sai tên đăng nhập hoặc mật khẩu!', ''))
            }

            const listRole = await Role.getListRoleByUserId(user.userId)
            const token = getToken(user.email, listRole)
            res.setHeader('Authorization', token)
            res.setHeader('Access-Control-Expose-Headers', '*')
            return res.send(
                message(true, 'Đăng nhập thành công!', [{role: listRole, name: user.name, image: user.image}]),
            )
        } catch (error) {
            console.log(error)
        }
    }
}

export default new AuthController()
