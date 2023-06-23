import path from "path";
import fs from "fs";

export const getJsonData = (filePath) => {

    // Lấy ra đường dẫn đến thư mục gốc (thư mục server)
    const currentDirname = path.dirname(new URL(import.meta.url).pathname);
    let rootDirname = path.dirname(currentDirname);

    // Lọc lại đường dẫn đến thư mục gốc.
    const storageNameArray = rootDirname.split("/");
    const filterStorageNameArray = storageNameArray.slice(1, storageNameArray.length);
    rootDirname = filterStorageNameArray.join("\\");

    const fileLocation = path.join(rootDirname, filePath[0], filePath[1]);
    // console.log(fileLocation);

    const jsonData = fs.readFileSync(fileLocation);
    const data = JSON.parse(jsonData);

    return data;
};
