import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/common/image_widget/image_widget.dart';
import 'package:pphelper/app/modules/settlement/controllers/settlement_controller.dart';


/**
 * 结算页面
 */

class SettlementView extends StatelessWidget {
  SettlementController settlementController = Get.put(SettlementController());


  Widget _checkOutItem(item) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 5),
            child: Text("${item.productName}", style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(160),
                child: ImageWidget(url: item.imageUrl,)
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("${item.productDesc}", maxLines: 2),
                        SizedBox(height: 10,),
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                              Text("￥${item.productPrice}", style: TextStyle(color: Colors.red)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text("x${item.orderCount}"),
                            )
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("结算"),
      ),
      body: GetBuilder<SettlementController>(
        builder: (controller) {
          if(controller.isLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            List<Widget> productList = [];
            controller.selectProducts.forEach((element){
              productList.add(_checkOutItem(element));
            });
            return Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          // ListTile(
                          //   leading: Icon(Icons.add_location),
                          //   title: Center(
                          //     child: Text("请添加收货地址"),
                          //   ),
                          //   trailing: Icon(Icons.navigate_next),
                          // ),
                          SizedBox(height: 10),
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("${controller.memberInfo.nickName}  ${controller.memberInfo.phone}"),
                                SizedBox(height: 10),
                                Text("北京市海淀区西二旗"),
                              ],
                            ),
                            trailing: Icon(Icons.navigate_next),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: productList
                      )
                    ),
                    SizedBox(height: 20),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("运费:￥0"),
                          Divider(),
                          Text("商品总金额:￥${controller.totalPrice}"),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(100),
                  child: Container(
                      width: ScreenUtil().setWidth(750),
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(
                                  width: 1,
                                  color: Colors.black26
                              )
                          )
                      ),

                      child: Container(
                        margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("总价:￥${controller.totalPrice}", style: TextStyle(color: Colors.red)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: RaisedButton(
                                child:
                                Text('立即下单', style: TextStyle(color: Colors.white)),
                                color: Colors.red,
                                onPressed: (){

                                },
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                )
              ],
            );
          }
        },
      )
    );
  }

//处理结算
// handleBuyProduct(context) async{
//   //获取选择的商品
//   var dataProducts = await Get.find<BusController>().getCheckedShops();
//   var productsNames = [];
//   dataProducts.forEach((element) {
//     productsNames.add(element.productName);
//   });
//   showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Row(
//             children: [
//               Text("确定购买"),
//               Text("${productsNames.toString()}", style: TextStyle(color: Colors.red),),
//               Text("商品？"),
//             ],
//           ),
//           actions: <Widget>[
//             ElevatedButton(child: Text('取消'),onPressed: (){
//               Navigator.of(context).pop();
//             }, style: ElevatedButton.styleFrom(primary: Colors.red),),
//             ElevatedButton(child: Text('确认'),onPressed: () async{
//               if(dataProducts.length > 0) {
//                 await Get.find<BusController>().handleBuyProduct();
//                 Navigator.of(context).pop();
//               }else{
//                 Fluttertoast.showToast(
//                     msg: "你没有选择任何商品~~~",
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.CENTER,
//                     timeInSecForIosWeb: 1,
//                     backgroundColor: Colors.white,
//                     textColor: Colors.red,
//                     fontSize: 16.0
//                 );
//               }
//             },),
//           ],
//         );
//       });
// }
}


