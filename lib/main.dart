import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pphelper/app/service.dart';

import 'app/routes/app_pages.dart';

void main() async{
  //注册服务
  await PphelperService.startService();
  runApp(
      ApplicationApp()
  );
}

class ApplicationApp extends StatelessWidget {
  const ApplicationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => GetMaterialApp(
          title: "pphelper",
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        )
    );
  }
}

