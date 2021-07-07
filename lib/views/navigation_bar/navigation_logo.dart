import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../router_manager.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {RouterManager.router.navigateTo(context, RouterManager.home_route);},
      child: SizedBox(
        height: 80,
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
