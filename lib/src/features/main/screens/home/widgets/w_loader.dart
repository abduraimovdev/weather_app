import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/common/util/extension/context_extensions.dart';



class WLoader extends StatelessWidget {
  final Color? color;

  const WLoader({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Center(
            child: CupertinoActivityIndicator(
              color: color ?? context.color.white,
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: color ?? context.color.white,
            ),
          );
  }
}
