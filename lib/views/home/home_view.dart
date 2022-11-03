library home_view;

import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:shop_t/core/locator.dart';
import 'package:shop_t/core/logger.dart';
import 'package:shop_t/core/models/shop.dart';
import 'package:shop_t/core/services/shop_service.dart';
import 'package:shop_t/widgets/shopwidget.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _HomeMobile(),
        desktop: const _HomeDesktop(),
        tablet: const _HomeTablet(),
      );
    });
  }
}
