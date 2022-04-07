//根路径
const serviceUrl = "http://192.168.1.108:8899/pphelper";

//请求地址
var servicePath = {
  "shops": serviceUrl + "/home/shops", //获取商品数据
  "swiperImages":  serviceUrl + "/product/swiperImages",  //获取录播图商品图片数据
  "recommendProducts":  serviceUrl + "/product/recommendProducts",  //获取推荐商品数据
  "categories":  serviceUrl + "/category/getCategories",  //获取商品分类列表
  "sellProducts":  serviceUrl + "/product/sellProducts",  //获取在售商品
  "refreshViewCount":  serviceUrl + "/product/refreshViewCount",  //更新商品的浏览量
  "getProductsByCategoryId":  serviceUrl + "/product/getProductsByCategoryId",  //通过分类id获取商品列表
  "getProductById":  serviceUrl + "/product/getProductById",  //通过商品id获得商品数据
  "newStock":  serviceUrl + "/product/newStock",  //商品上架
  "soldOut":  serviceUrl + "/product/soldOut",  //商品下架
  "soldUp":  serviceUrl + "/product/soldUp",  //商品上架
  "uploadImages":  serviceUrl + "/product/uploadImages",  //上传文件图片
  "login":  serviceUrl + "/member/login",  //通过商品id获得商品数据
  "getSaleProducts":  serviceUrl + "/member/getSaleProducts",  //通过用户mid查询挂售的商品数据
  "updateMember":  serviceUrl + "/member/updateMember",  //更新用户数据
  "register":  serviceUrl + "/member/register",  //用户注册请求
  "messagePage": serviceUrl + "/message",
  "cartPage": serviceUrl + "/cart",
  "member": serviceUrl + "/member",
};
