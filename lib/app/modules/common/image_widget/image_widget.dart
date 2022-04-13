import 'package:flutter/material.dart';

import '../../../service/service_url.dart';

//封装图片加载控件，增加图片加载失败时加载默认图片
/**
 * 使用Image.net获取
 */
class ImageWidget extends StatefulWidget {
  ImageWidget({required this.url, this.defImagePath = "assets/1.0x/images/empty.png"});

  final String url;
  final String defImagePath;

  @override
  State<StatefulWidget> createState() {
    return _StateImageWidget();
  }
}

class _StateImageWidget extends State<ImageWidget> {
  late Image _image;
  @override
  void initState() {
    super.initState();
    _image = Image.network(imagePreUrl + widget.url, fit: BoxFit.fill
    );

    var resolve = _image.image.resolve(ImageConfiguration.empty);
    resolve.addListener(
      ImageStreamListener((_, __) {
          //加载成功
        }, onError: (Object exception, StackTrace? stackTrace) {
          //加载失败，加载本地图片
          if(mounted) {
            setState(() {
              _image = Image.asset(
                  widget.defImagePath, fit: BoxFit.fill
              );
            });
          }
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _image;
  }
}