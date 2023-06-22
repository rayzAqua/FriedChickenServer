import { connecting, query } from "../sql_connect/connected.js";
import { Singleton } from "../designPattern/singletonPattern.js";

class ProductPrice {
  constructor() {
    this.id = null;
    this.productId = null;
    this.priceListId = null;
    this.price = null;
    this.createdDate = null;
    this.createdUser = null;
    this.updatedUser = null;
  }

  setProductPrice(productPrice) {
    this.id = productPrice.id;
    this.productId = productPrice.productId;
    this.priceListId = productPrice.priceListId;
    this.price = productPrice.price;
    this.createdDate = productPrice.createdDate;
    this.createdUser = productPrice.createdUser;
    this.updatedUser = productPrice.updatedUser;
  }

  async create(productId, priceListId, price, createdUser) {
    try {
      // const results = await query(
      //   "insert into productprice(productId, priceListId, price, createdUser)" +
      //     " values (?,?,?,?)",
      //   [productId, priceListId, price, createdUser]
      // );
      const sp = "CALL sp_insert_productPrice(?,?,?,?);";
      const results = await query(sp, [
        productId,
        priceListId,
        price,
        createdUser,
      ]);
      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async checkDuplicate(productId) {
    try {
      // const results = await query(
      //   "SELECT pricelist.priceId,  pricelist.startDate, pricelist.enddate, productprice.productId" +
      //     " FROM railway.pricelist " +
      //     " join railway.productprice on pricelist.priceId = productprice.priceListId" +
      //     " where startDate<= CURRENT_DATE() and enddate >= CURRENT_DATE()  and productprice.productId = ?",
      //   [productId]
      // );
      const sp = "Call sp_checkDuplicate_ProductPrice(?);";
      const results = await query(sp, [productId]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }

  async getListByProductId(productId, page) {
    try {
      // const results = await query(
      //   "SELECT  productprice.id, " +
      //     " productprice.productId, " +
      //     " productprice.priceListId, " +
      //     " productprice.createdDate as 'productPriceCreatedDate'," +
      //     " productprice.createdUser as 'productPriceCreatedUser'," +
      //     " productprice.updatedDate as 'productPriceUpdatedDate'," +
      //     " productprice.updatedUser as 'productPriceUpdatedUser'," +
      //     "    pricelist.type," +
      //     "    pricelist.startDate," +
      //     "    pricelist.enddate," +
      //     "    pricelist.createdDate as 'priceListCreatedDate'," +
      //     "    pricelist.createdUser as 'priceListCreatedUser'," +
      //     "    pricelist.updatedDate as 'priceListUpdatedDate'," +
      //     "     pricelist.updatedUser as 'priceListUpdatedUser'  " +
      //     " FROM railway.pricelist " +
      //     " join railway.productprice on pricelist.priceId = productprice.priceListId" +
      //     " where productprice.productId = ?" +
      //     " order by productprice.createdDate DESC" +
      //     " limit 10 offset ?;",
      //   [productId, page]
      // );
      const sp = "call sp_get_list_productPrice_by_productId(?, ?);";
      const results = await query(sp, [productId, page]);
      return results[0];
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
  async updateProductPrice(prilistId, productId, price, userId) {
    try {
      const sp = "call sp_update_product_price(?, ?, ?, ?);";
      const results = await query(sp, [prilistId, productId, price, userId]);
      return results;
    } catch (error) {
      console.error("Error executing query:", error);
      throw error;
    }
  }
}

const productPrice = Singleton.getModel("productPrice", ProductPrice);

export default productPrice;
