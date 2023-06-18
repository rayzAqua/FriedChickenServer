// ĐANG HOÀN THIỆN
// BÊN KẾT NỐI DB THÌ HOÀN THIỆN RỒI
// ĐÂY LÀ ĐỂ ÁP DỤNG CHO CÁC MODEL

const Singleton = (function () {

    let instance = null;
  
    function createDBConnecting() {
        const database = new Database();
        const connecting = database.connect();
        return connecting;
    }
  
    return {
        getDBConnecting: function() {
            if (!instance) {
                instance = createDBConnecting();
            }
            return instance;
        }
    }
  })();