import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/app/extensions.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/presentation/components/components.dart';
import 'package:cinema_app/movies/presentation/controller/home_controller.dart';
import 'package:cinema_app/movies/presentation/resources/app_strings.dart';
import 'package:cinema_app/movies/presentation/resources/color_manager.dart';
import 'package:cinema_app/movies/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../resources/values_manager.dart';
import 'package:cinema_app/movies/presentation/resources/asset_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = Get.find();
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabs);
    super.initState();
  }

  _handleTabs() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.whichOne,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.white),
              ),
              10.ph,
              GetBuilder(
                builder: (HomeController controller) => carousel(_controller),
              ),
              20.ph,
              buildTabBar(context),
              10.ph,
              GetBuilder(builder: (HomeController controller) {
                return Center(
                  child: [
                    buildGrid(controller.nowPlaying.length, controller.nowPlaying),
                    buildGrid(controller.upComing.length, controller.upComing),
                    buildGrid(controller.topRated.length, controller.topRated),
                    buildGrid(controller.popular.length, controller.popular),
                  ][_tabController.index],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget carousel(HomeController controller) {
    return CarouselSlider(
      options: buildCarousalOptions(),
      items: controller.nowPlaying
          .map((items) => buildCarousalBody(items))
          .toList(),
    );
  }

  Widget buildCarousalBody(MoviesModel items) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              height: AppSize.s300,
              imageUrl: AssetManager.imageUrl(items.backdropPath),
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppPadding.p8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.redAccent,
                        size: AppSize.s16,
                      ),
                      4.pw,
                      Text(
                        AppStrings.nowPlaying.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p8),
                  child: Text(
                    items.title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CarouselOptions buildCarousalOptions() {
    return CarouselOptions(
        height: AppSize.s300,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {});
  }

  Widget buildTabBar(context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: ColorManager.white,
      indicatorColor: ColorManager.tabColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: AppSize.s3,
      labelStyle: Theme.of(context).textTheme.bodySmall,
      tabs: const [
        Tab(
          text: AppStrings.nowPlaying,
        ),
        Tab(
          text: AppStrings.upComing,
        ),
        Tab(
          text: AppStrings.topRated,
        ),
        Tab(
          text: AppStrings.popular,
        ),
      ],
    );
  }

  Widget buildGrid(int length, List image) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: (190 / 250),
            crossAxisSpacing: 3,
            mainAxisSpacing: 10),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: length,
        itemBuilder: (context, index) => buildGridBody(image, index));
  }

  Widget buildGridBody(List image, int index) {
    return Container(
      margin: const EdgeInsets.only(left: AppMargin.m8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.getDetails(),
                arguments: image[index], preventDuplicates: true);
          },
          child: CachedNetworkImage(
            imageUrl: AssetManager.imageUrl(image[index].backdropPath),
            width: AppSize.s100,
            height: AppSize.s200,
            fadeInCurve: Curves.fastOutSlowIn,
            fit: BoxFit.fill,
            placeholder: (context, url) =>
                buildImagePlaceHolder(AppSize.s100, AppSize.s200),
          ),
        ),
      ),
    );
  }
}
