import jwt from 'jsonwebtoken'
import User from '../models/User.js'
import message from '../utils/message.js'
async function authenticateToken(req, res, next) {
    // const token = req.headers["authorization"] || req.query.token;
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InR1YW5odW5nQGdtYWlsLmNvbSIsInJvbGUiOlt7InJvbGVJZCI6MSwibmFtZSI6IlF14bqjbiBsw70ifV0sImlzYSI6MTY4NzM2NDc5NCwiZXhwIjoxNjg3NTgwNzk0LCJpYXQiOjE2ODczNjQ3OTR9.dt8M3PUAoydZtE8EPJl1zA1Q7oKsdQ02MsQZHc73LbI'
    if (!token) {
        return res.send(message(false, 'Không có quyền truy cập!', ''))
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET)
        const user = await User.getByEmail(decoded.email)

        if (user.length == 0) {
            return res.send(message(false, 'Token không hợp lệ', ''))
        }
        const userId = user.userId
        req.body = {...decoded, ...req.body, userId}

        next()
    } catch (error) {
        if (error.message == 'jwt expired') {
            return res.send(message(false, 'Token đã hết hạn', ''))
        }
        return res.send(message(false, 'Token không hợp lệ', ''))
    }
}

export {authenticateToken}
