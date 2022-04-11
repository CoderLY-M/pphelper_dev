import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/routes/app_pages.dart';

import '../controllers/wallet_controller.dart';

class WalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WalletController>(
        builder: (controller){
          return Stack(
            children: [
              Column(
                children: [
                  Column(children: [
                    Container(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_outlined,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text("我的钱包 (24H)",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500)),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.bell,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                    Container(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(150),
                      ),
                      child: IconButton(
                        iconSize: 50,
                        icon: Icon(
                          FontAwesomeIcons.sackDollar,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 50),
                    Text("${controller.walletMoney}",
                        style: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    // Text(
                    //   r"+ ￥0 (0%)",
                    //   style: TextStyle(
                    //       fontSize: 18.0,
                    //       fontWeight: FontWeight.w300),
                    // ),
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          //跳转到充值页面
                          Get.toNamed(Routes.RECHARGE);
                        }, child: Text("充值",)
                    ),
                  ),
                ],
              ),
              Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: FlatButton(onPressed: () {
                            //跳转到消息页面
                          }, child: Text("问题反馈")),
                        )
                      ],
                    ),
                  )
              )
            ],
          );
        },
      )
    );
  }
}


