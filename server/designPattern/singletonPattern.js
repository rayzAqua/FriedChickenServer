// ĐANG HOÀN THIỆN
// BÊN KẾT NỐI DB THÌ HOÀN THIỆN RỒI
// ĐÂY LÀ ĐỂ ÁP DỤNG CHO CÁC MODEL

export const Singleton = (function() {

    let instance = {};
  
    function createModel(model) {
        object = new model;
        return object;
    }
  
    return {
        getModel: function(modelName, model) {
            if (!instance[modelName]) {
                instance[modelName] = createModel(model);
            }
            return instance[modelName];
        }
    }
  })();