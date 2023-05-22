import * as authRouter from "./auth.routes.js";

function hieu56(app) {
  //viet route trong nay
  app.use("/auth", authRouter);
}

function hieu57(app) {
  //viet route trong nay
}

function route(app) {
  hieu56(app);
  hieu57(app);

  //API chung
  app.use("/site", siteRouter);
  app.use("/", (req, res) => {
    res.send("Hello");
  });
}

export default route;
