import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/images.dart';
import '../theme/string_master.dart';



class MockData {
  static final List<String> interestItems = <String>[
    StringAssets.food,
    StringAssets.learn,
    StringAssets.techChip,
    StringAssets.homeChip,
    StringAssets.entertainmentChip,
    StringAssets.selfCareChip,
    StringAssets.scienceChip,
  ];

  static Map<String, bool> getTagsMap() {
    return {for (var v in interestItems) v: false};
  }

  static Map<String, bool> interestItemMap = getTagsMap();

  static final List<SubscribeModel> subscribeItems = <SubscribeModel>[
    SubscribeModel(
      title: StringAssets.sberPrimeTitle,
      description: StringAssets.feeTitle,
      costPerMonth: StringAssets.feeSumTitle,
      titleIcon: SvgPicture.asset(
        ImageAssets.sberbankIcon,
      ),
    ),
    SubscribeModel(
      title: StringAssets.transactionsTitle,
      description: StringAssets.autoSubscriptionTitle,
      costPerMonth: StringAssets.feeSumTitle,
      titleIcon: SvgPicture.asset(
        ImageAssets.icon2,
      ),
    ),
  ];
}

class SubscribeModel {
  final Widget titleIcon;
  final String title;
  final String description;
  final String costPerMonth;

  SubscribeModel({
    required this.titleIcon,
    required this.title,
    required this.description,
    required this.costPerMonth,
  });
}
class TarrifsModel {
  final String title;
  final String subtitle;
  final String pathToImage;
  final bool isLastItem;

  TarrifsModel({
    required this.title,
    required this.subtitle,
    required this.pathToImage,
    required this.isLastItem,
  });
}

