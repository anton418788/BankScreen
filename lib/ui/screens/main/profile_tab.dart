import 'package:bankscreen/ui/screens/main/theme/colors.dart';
import 'package:bankscreen/ui/screens/main/theme/fonts.dart';
import 'package:bankscreen/ui/screens/main/theme/images.dart';
import 'package:bankscreen/ui/screens/main/theme/paddings.dart';
import 'package:bankscreen/ui/screens/main/theme/string_master.dart';

import 'package:flutter/material.dart';
import '../../utils/hover.dart';
import 'model/ModelData.dart';
import 'package:flutter_svg/svg.dart';


class ProfileTab extends StatelessWidget {
  const   ProfileTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ColorAssets.containerColor,
        // padding: EdgeInsets.all(PaddingAssets.mediumPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: PaddingAssets.titlePadding),
            Padding(
              padding: EdgeInsets.only(
                  left: PaddingAssets.mediumPadding,
                  right: PaddingAssets.mediumPadding),
              child: TitleSection(
                title: StringAssets.subscriptionTitle,
                subTitle: StringAssets.subscriptionsTitle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: PaddingAssets.normalPadding,
                  right: PaddingAssets.smallPadding),
              child: const SubscribeList(),
            ),
            SizedBox(height: PaddingAssets.largePadding),
            Padding(
              padding: EdgeInsets.only(
                  left: PaddingAssets.mediumPadding,
                  right: PaddingAssets.mediumPadding),
              child: TitleSection(
                title: StringAssets.limitsAndSubscriptionsTitle,
                subTitle: StringAssets.onlySberTitle,
              ),
            ),
            TariffsAndLimits(),
            SizedBox(height: PaddingAssets.largePadding),
            Padding(
              padding: EdgeInsets.only(
                  left: PaddingAssets.mediumPadding,
                  right: PaddingAssets.mediumPadding),
              child: TitleSection(
                title: StringAssets.interestTitle,
                subTitle: StringAssets.historyCaption,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: PaddingAssets.mediumPadding,
                right: PaddingAssets.mediumPadding,
              ),
              child: const TagsBlock(),
            ),
            SizedBox(height: PaddingAssets.bottomPadding),
          ],
        ),
      ),
    );
  }
}

class TagsBlock extends StatefulWidget {
  const TagsBlock({super.key});

  @override
  State<TagsBlock> createState() => _TagsBlockState();
}

class _TagsBlockState extends State<TagsBlock> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: PaddingAssets.smallPadding,
      children: List<Widget>.generate(
        MockData.interestItems.length,
            (int index) => Builder(
          builder: (BuildContext context) {
            return SelectableInterestChip(
              label: Text(MockData.interestItemMap.keys.elementAt(index)),
              selected: MockData.interestItemMap.values.elementAt(index),
              onSelected: (bool selected) {
                setState(() {
                  MockData.interestItemMap[MockData.interestItemMap.keys
                      .elementAt(index)] = selected;
                });
              },
            );
          },
        ),
      ),
    );
  }
}

class SelectableInterestChip extends StatefulWidget {
  final Widget label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const SelectableInterestChip({
    Key? key,
    required this.label,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  @override
  _SelectableFilterChipState createState() => _SelectableFilterChipState();
}

class _SelectableFilterChipState extends State<SelectableInterestChip> {
  bool _selected = false;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: widget.label,
      selected: _selected,
      onSelected: (bool selected) {
        setState(() {
          _selected = selected;
          widget.onSelected(selected);
        });
      },
      showCheckmark: false,
      selectedColor:
      _selected ? ColorAssets.chipContainerSelected : ColorAssets.grayColor,
    );
  }
}

class TariffsAndLimits extends StatelessWidget {
  TariffsAndLimits({Key? key}) : super(key: key);

  final items = <TarrifsModel>[
    TarrifsModel(
      title: StringAssets.changeLimitTitle,
      subtitle: StringAssets.transactionsAndFeeTitle,
      pathToImage: ImageAssets.icon3,
      isLastItem: false,
    ),
    TarrifsModel(
      title: StringAssets.transactionsWithoutExtraTitle,
      subtitle: StringAssets.showBalanceTitle,
      pathToImage: ImageAssets.icon1,
      isLastItem: false,
    ),
    TarrifsModel(
      title: StringAssets.limitInformationTitle,
      subtitle: '',
      pathToImage: ImageAssets.transferIcon,
      isLastItem: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Column(
          children: [
            HoverBuilder(
              paddingSize: EdgeInsets.only(
                  top: PaddingAssets.smallPadding,
                  bottom: PaddingAssets.smallPadding),
              foregroundColor: ColorAssets.chipContainer,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(PaddingAssets.zeroPadding),
                  side: BorderSide(
                      color: Colors.transparent,
                      width: PaddingAssets.zeroPadding)),
              builder: (isHovered) {
                return Padding(
                  padding: EdgeInsets.only(left: PaddingAssets.mediumPadding),
                  child: TariffAndLimitsItem(
                    tariffAndLimitModel: TarrifsModel(
                      title: item.title,
                      subtitle: item.subtitle,
                      pathToImage: item.pathToImage,
                      isLastItem: item.isLastItem,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }).toList(),
    );
  }
}

class TariffAndLimitsItem extends StatelessWidget {
  final TarrifsModel tariffAndLimitModel;

  const TariffAndLimitsItem({
    required this.tariffAndLimitModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PaddingAssets.tarriffItemHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: PaddingAssets.lightPadding,
            ),
            child: SvgPicture.asset(
              tariffAndLimitModel.pathToImage,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: PaddingAssets.mediumPadding),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: PaddingAssets.strokeWidth,
                    color: tariffAndLimitModel.isLastItem
                        ? Colors.transparent
                        : ColorAssets.blackColor
                        .withOpacity(ColorAssets.lightOpacity),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tariffAndLimitModel.title,
                    style: TextStyle(
                      fontFamily: FontAssets.sfProTextMedium,
                      fontSize: FontAssets.bigFontSize16,
                      fontWeight: FontWeight.w500,
                      color: ColorAssets.blackColor,
                    ),
                  ),
                  SizedBox(height: PaddingAssets.lightPadding),
                  if (tariffAndLimitModel.subtitle.isNotEmpty) ...[
                    Text(
                      tariffAndLimitModel.subtitle,
                      style: TextStyle(
                        fontFamily: FontAssets.sfProTextMedium,
                        fontSize: FontAssets.bigFontSize16,
                        fontWeight: FontWeight.w500,
                        color: ColorAssets.blackColor
                            .withOpacity(ColorAssets.mediumOpacity),
                      ),
                    )
                  ]
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: tariffAndLimitModel.isLastItem
                    ? PaddingAssets.zeroPadding
                    : PaddingAssets.bigPadding,
                right: PaddingAssets.mediumPadding),
            decoration: BoxDecoration(
              border: Border(
                bottom: tariffAndLimitModel.isLastItem
                    ? BorderSide.none
                    : BorderSide(
                  width: PaddingAssets.strokeWidth,
                  color: tariffAndLimitModel.isLastItem
                      ? ColorAssets.whiteColor
                      : ColorAssets.blackColor
                      .withOpacity(ColorAssets.lightOpacity),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.arrow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String title;
  final String? subTitle;

  const TitleSection({
    required this.title,
    this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: FontAssets.sfProTextBold,
              color: ColorAssets.blackColor,
              fontWeight: FontWeight.bold,
              fontSize: FontAssets.bigFontSize20),
        ),
        SizedBox(height: PaddingAssets.smallPadding),
        if (subTitle != null && subTitle!.isNotEmpty) ...[
          Text(
            subTitle!,
            style: TextStyle(
                fontFamily: FontAssets.sfProTextMedium,
                color: ColorAssets.blackColor
                    .withOpacity(ColorAssets.mediumOpacity),
                fontWeight: FontWeight.w500,
                fontSize: FontAssets.mediumFontSize14),
          ),
          SizedBox(height: PaddingAssets.smallIcon),
        ] else ...[
          const SizedBox.shrink()
        ],
      ],
    );
  }
}



class SubscribeList extends StatelessWidget {
  const SubscribeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: PaddingAssets.subscribeItemHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: MockData.subscribeItems.map((item) {
            return Padding(
              padding: EdgeInsets.zero,
              child: HoverBuilder(
                foregroundColor: ColorAssets.chipContainer,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(PaddingAssets.mediumPadding),
                  side: BorderSide(
                    color: Colors.transparent,
                    width: PaddingAssets.zeroPadding,
                  ),
                ),
                builder: (isHovered) {
                  return SubscribeItem(
                    subscribeModel: SubscribeModel(
                      title: item.title,
                      description: item.description,
                      costPerMonth: item.costPerMonth,
                      titleIcon: item.titleIcon,
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SubscribeItem extends StatelessWidget {
  final SubscribeModel subscribeModel;

  const SubscribeItem({
    required this.subscribeModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingAssets.lightPadding),
      child: Container(
        width: PaddingAssets.subscribeItemWidth,
        height: PaddingAssets.subscribeItemHeight,
        padding: EdgeInsets.all(PaddingAssets.mediumPadding),
        decoration: BoxDecoration(
          color: ColorAssets.whiteColor,
          borderRadius: BorderRadius.circular(PaddingAssets.mediumRadius),
          boxShadow: [
            BoxShadow(
              color:
              ColorAssets.blackColor.withOpacity(ColorAssets.slightOpacity),
              spreadRadius: ColorAssets.spreadRadius,
              blurRadius: ColorAssets.blurRadius,
              offset: Offset(ColorAssets.shadowX, ColorAssets.shadowY),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                subscribeModel.titleIcon,
                SizedBox(width: PaddingAssets.mediumSize),
                Text(
                  subscribeModel.title,
                  style: TextStyle(
                      fontFamily: FontAssets.sfProTextMedium,
                      color: ColorAssets.blackColor,
                      fontWeight: FontWeight.w500,
                      fontSize: FontAssets.bigFontSize16),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  subscribeModel.description,
                  style: TextStyle(
                    fontFamily: FontAssets.sfProTextMedium,
                    color: ColorAssets.blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: FontAssets.mediumFontSize14,
                  ),
                ),
              ],
            ),
            SizedBox(height: PaddingAssets.slightSize),
            Row(
              children: [
                Text(
                  subscribeModel.costPerMonth,
                  style: TextStyle(
                    fontFamily: FontAssets.sfProTextMedium,
                    color: ColorAssets.blackColor
                        .withOpacity(ColorAssets.mediumOpacity),
                    fontWeight: FontWeight.w500,
                    fontSize: FontAssets.mediumFontSize14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}






