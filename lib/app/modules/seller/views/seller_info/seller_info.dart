import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/seller/controllers/seller_controller.dart';
import 'package:pphelper/app/routes/app_pages.dart';


class SellInfoView extends StatelessWidget {
  const SellInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerController>(
        builder: (controller) {
          var seller = controller.sellData;
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView(
                    children: [
                      ListTile(title: Text("UID"), leading: Icon(Icons.link), subtitle: Text("${seller.id}"),trailing: Icon(Icons.chevron_right),),
                      ListTile(title: Text("昵称"), leading: Icon(Icons.person_outlined),subtitle: Text("${seller.nickName}"), trailing: Icon(Icons.chevron_right),),
                      ListTile(title: Text("性别"), leading:  Icon(Icons.people), subtitle:Text("${seller.sex == 0 ? "男" : "女" }"),trailing: Icon(Icons.chevron_right),),
                      ListTile(title: Text("年龄"), leading:  Icon(Icons.access_time), subtitle:Text("${seller.age}"),trailing: Icon(Icons.chevron_right),),
                      ListTile(title: Text("联系方式"), leading:  Icon(Icons.phone), subtitle:Text("${seller.phone}"),trailing: Icon(Icons.chevron_right),),
                      ListTile(title: Text("邮箱"), leading:  Icon(Icons.email_outlined), subtitle:Text("${seller.email}"),trailing: Icon(Icons.chevron_right),),
                      ListTile(title: Text("个性签名"), leading:  Icon(Icons.flag), subtitle:Text("${seller.token}"),trailing: Icon(Icons.chevron_right),),
                    ]
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: ScreenUtil().screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(onPressed: () {
                          //跳转到消息页面
                          Get.toNamed(Routes.CHART, arguments: {"memberId", controller.sellData.id});
                        }, child: Text("联系他")),
                        width: ScreenUtil().setWidth(250),
                      )
                    ],
                  ),
                )
              )
            ],
          );
        }
    );
  }
}
