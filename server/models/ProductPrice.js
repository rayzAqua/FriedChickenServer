import { connecting, query } from "../sql_connect/connected.js";

const ProductPrice = function (productPrice) {
  this.id = productPrice.id;
  this.productId = productPrice.productId;
  this.priceListId = productPrice.priceListId;
  this.price = productPrice.price;
  this.createdDate = productPrice.createdDate;
  this.createdUser = productPrice.createdUser;
  this.updatedUser = productPrice.updatedUser;
};

ProductPrice.create = async function (
  productId,
  priceListId,
  price,
  createdUser
) {
  try {
    const results = await query(
      "insert into productprice(productId, priceListId, price, createdUser)" +
        " values (?,?,?,?)",
      [productId, priceListId, price, createdUser]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

ProductPrice.checkDuplicate = async function (productId) {
  try {
    const results = await query(
      "SELECT pricelist.priceId,  pricelist.startDate, pricelist.enddate, productprice.productId" +
        " FROM railway.pricelist " +
        " join railway.productprice on pricelist.priceId = productprice.priceListId" +
        " where startDate<= CURRENT_DATE() and enddate >= CURRENT_DATE()  and productprice.productId = ?",
      [productId]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

ProductPrice.getListByProductId = async function (productId, page) {
  try {
    const results = await query(
      "SELECT  productprice.id, " +
        " productprice.productId, " +
        " productprice.priceListId, " +
        " productprice.createdDate as 'productPriceCreatedDate'," +
        " productprice.createdUser as 'productPriceCreatedUser'," +
        " productprice.updatedDate as 'productPriceUpdatedDate'," +
        " productprice.updatedUser as 'productPriceUpdatedUser'," +
        "    pricelist.type," +
        "    pricelist.startDate," +
        "    pricelist.enddate," +
        "    pricelist.createdDate as 'priceListCreatedDate'," +
        "    pricelist.createdUser as 'priceListCreatedUser'," +
        "    pricelist.updatedDate as 'priceListUpdatedDate'," +
        "     pricelist.updatedUser as 'priceListUpdatedUser'  " +
        " FROM railway.pricelist " +
        " join railway.productprice on pricelist.priceId = productprice.priceListId" +
        " where productprice.productId = ?" +
        " order by productprice.createdDate DESC" +
        " limit 10 offset ?;",
      [productId, page]
    );

    return results;
  } catch (error) {
    console.error("Error executing query:", error);
    throw error;
  }
};

export default ProductPrice;
