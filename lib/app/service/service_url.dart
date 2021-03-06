//根路径
//dev地址
// const serviceUrl = "http://124.220.20.209:8899/pphelper";
//pre地址
const serviceUrl = "http://192.168.1.108:8899/pphelper";

//图片地址
const imageHeader = "http://124.220.20.209:8899/pphelper";

const imagePreUrl = imageHeader + "/upload/images/";

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
  "searchProductRecommend":  serviceUrl + "/product/searchProductRecommend",  //获取推荐商品
  "searchProducts":  serviceUrl + "/product/searchProducts",  //获取推荐商品
  "login":  serviceUrl + "/member/login",  //通过商品id获得商品数据
  "getSaleProducts":  serviceUrl + "/member/getSaleProducts",  //通过用户mid查询挂售的商品数据
  "getSaleCounts":  serviceUrl + "/member/getSaleCounts",  //通过用户mid查询挂售的商品数量
  "updateMember":  serviceUrl + "/member/updateMember",  //更新用户数据
  "register":  serviceUrl + "/member/register",  //用户注册请求
  "getMemberInfo":  serviceUrl + "/member/getMemberInfo",  //请求卖家消息请求

  "messagePage": serviceUrl + "/message",
  "cartPage": serviceUrl + "/cart",
  "member": serviceUrl + "/member",

  "chartConnectCreate": serviceUrl + "/chartMaster/chartConnectCreate", //建立连接请求
  "memberList": serviceUrl + "/chartMaster/memberList", //获取（好友）消息列表
  "sendMessage": serviceUrl + "/chartDetail/sendMessage", //发送消息
  "messageList": serviceUrl + "/chartDetail/messageList", //获取消息数据


  "account": serviceUrl + "/memberWallet/account", //查询用户的余额
  "recharge": serviceUrl + "/memberWallet/recharge", //充值
  "buyProducts": serviceUrl + "/memberWallet/buyProducts", //购买商品

  "orderList":  serviceUrl + "/order/orderList",  //获取订单列表数据
  "orderDetail":  serviceUrl + "/order/orderDetail",  //获取订单id获取订单详细数据

};
