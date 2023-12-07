
import 'package:bankscreen/ui/screens/main/theme/fonts.dart';
import 'package:bankscreen/ui/screens/main/theme/images.dart';
import 'package:bankscreen/ui/screens/main/theme/paddings.dart';
import 'package:flutter/material.dart';
import 'package:bankscreen/ui/screens/main/profile_tab.dart';
import 'package:bankscreen/ui/screens/main/theme/colors.dart';
import 'package:bankscreen/ui/screens/main/theme/string_master.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/hover.dart';


class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfilePage(),
    );
  }
}
class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage>
    with TickerProviderStateMixin {
  static const int listLength = 2;

  late TabController _tabController;
  String? selectedChoice;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: listLength, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorAssets.whiteColor,
        body: DefaultTabController(
          length: listLength,
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  CustomAppbar(
                    tabController: _tabController,
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  const ProfileTab(),
                  Container(
                    color: ColorAssets.containerColor,
                    alignment: Alignment.center,
                    child: Text(StringAssets.settings),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, required this.tabController}) : super(key: key);

  final tabController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorAssets.whiteColor,
      elevation: PaddingAssets.elevation,
      pinned: true,
      floating: false,
      expandedHeight: PaddingAssets.expandedHeight,
      actions: [
        IconButton(
          padding: EdgeInsets.only(top: PaddingAssets.titlePadding),
          icon: HoverBuilder(
            foregroundColor: ColorAssets.greenColor,
            paddingSize: EdgeInsets.all(PaddingAssets.lightPadding),
            builder: (isHovered) {
              return SvgPicture.asset(ImageAssets.exitIcon);
            },
          ),
          onPressed: () {},
        )
      ],
      leading: IconButton(
        padding: EdgeInsets.only(top: PaddingAssets.titlePadding),
        icon: HoverBuilder(
          foregroundColor: ColorAssets.greenColor,
          paddingSize: EdgeInsets.all(PaddingAssets.lightPadding),
          builder: (isHovered) {
            return SvgPicture.asset(ImageAssets.closeIcon);
          },
        ),
        onPressed: () {},
      ),
      bottom: TabBar(
        controller: tabController,
        indicatorColor: ColorAssets.greenColor,
        unselectedLabelColor: ColorAssets.grayColor,
        labelColor: Colors.black,
        tabs: <Widget>[
          Tab(
            child: Text(
              StringAssets.profile,
              style: TextStyle(
                fontSize: FontAssets.bigFontSize16,
                fontFamily: FontAssets.sfProTextMedium,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Tab(
            child: Text(StringAssets.settings,
                style: TextStyle(
                  fontSize: FontAssets.bigFontSize16,
                  fontFamily: FontAssets.sfProTextMedium,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: PaddingAssets.bottomPadding,
                ),
                Image.asset(
                  ImageAssets.userPhoto,
                  width: PaddingAssets.imageSize,
                  height: PaddingAssets.imageSize,
                ),
                SizedBox(
                  height: PaddingAssets.mediumPadding,
                ),
                Text(
                  StringAssets.name_user,
                  style: TextStyle(
                      fontFamily: FontAssets.sfProDisplayBold,
                      color: ColorAssets.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: FontAssets.largeFontSize24),
                ),
                SizedBox(
                  height: PaddingAssets.mediumPadding,
                ),
              ]),
        ),
      ),
    );
  }
}