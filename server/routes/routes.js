
const routeHieuLe = (app) => {
    // Route của Hiếu Lê

};

const routeHieuPhan = (app) => {
    // Route của Hiểu
};

const routeTuanKiet = (app) => {
    // Route của Kiệt
}

const routes = (app) => {
    routeHieuLe(app);
    routeHieuPhan(app);
    routeTuanKiet(app);

    // Đường dẫn mặc định của server.
    app.use("/", (req, res) => {
        res.send("WELCOME TO BACKEND SERVER!<br/>CREATE BY GROUP 20!<br/>HAVE FUN!");
    });
    // Site route
}

export default routes;