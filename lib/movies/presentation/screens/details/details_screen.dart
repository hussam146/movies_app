// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/app/constants.dart';
import 'package:cinema_app/app/extensions.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/presentation/components/components.dart';
import 'package:cinema_app/movies/presentation/controller/details_controller.dart';
import 'package:cinema_app/movies/presentation/controller/watch_list_controller.dart';
import 'package:cinema_app/movies/presentation/resources/app_strings.dart';
import 'package:cinema_app/movies/presentation/resources/asset_manager.dart';
import 'package:cinema_app/movies/presentation/resources/color_manager.dart';
import 'package:cinema_app/movies/presentation/resources/routes_manager.dart';
import 'package:cinema_app/movies/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final DetailsController controller = Get.find();
  final WatchListController watchListController = Get.find();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: ColorManager.grey1,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: size.height * 0.35,
                child: Stack(
                  children: [
                    _buildBackGroundImage(size),
                    _buildForeGroundImage(size),
                    _buildImageText(size),
                  ],
                ),
              ),
              15.ph,
              15.ph,
              _buildTabBar(context),
              Center(
                child: [
                  _buildFirstTab(),
                  _buildSecondTab(),
                  _buildThirdTab(),
                ][_tabController.index],
              ),
            ],
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorManager.grey1,
      title: Text(AppStrings.details,
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.offNamed(Routes.getBase());
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
            onPressed: () {
              watchListController.addToWatchList(MoviesModel(
                  controller.data.id,
                  controller.data.backdropPath,
                  controller.data.posterPath,
                  controller.data.genreIds,
                  controller.data.title,
                  controller.data.overview,
                  controller.data.voteAverage,
                  controller.data.releaseDate));
            },
            icon: const Icon(Icons.label_important_outline_sharp))
      ],
    );
  }

  Widget _buildTabBar(context) {
    return TabBar(
      controller: _tabController,
      labelColor: ColorManager.white,
      indicatorColor: ColorManager.tabColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.only(bottom: AppPadding.p3),
      indicatorWeight: AppSize.s3,
      labelStyle: Theme
          .of(context)
          .textTheme
          .bodySmall,
      tabs: const [
        Tab(
          text: AppStrings.about,
        ),
        Tab(
          text: AppStrings.review,
        ),
        Tab(
          text: AppStrings.cast,
        ),
      ],
    );
  }

  Widget _buildBackGroundImage(Size size) {
    return Container(
      height: size.height * 0.35 - 65,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: AssetManager.imageUrl(controller.data.backdropPath),
        width: double.maxFinite,
        height: size.height * 0.35 - 65,
        fadeInCurve: Curves.fastOutSlowIn,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
            buildImagePlaceHolder(double.maxFinite, size.height * 0.35 - 65),
      ),
    );
  }

  Widget _buildForeGroundImage(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: AppSize.s120,
        width: AppSize.s95,
        margin: const EdgeInsets.only(
            left: AppMargin.m30,
            right: AppMargin.m210,
            top: AppMargin.m100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: CachedNetworkImage(
          imageUrl:
          AssetManager.imageUrl(controller.data.posterPath),
          fadeOutCurve: Curves.fastOutSlowIn,
          width: double.maxFinite,
          height: size.height * 0.35 - 65,
          fadeInCurve: Curves.fastOutSlowIn,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              buildImagePlaceHolder(
                  double.maxFinite, size.height * 0.35 - 65),
        ),
      ),
    );
  }

  Widget _buildImageText(Size size) {
    return Positioned(
      bottom: 5,
      left: 160,
      right: 0,
      child: RichText(
        text: TextSpan(
          text: controller.data.title,
          style: Theme
              .of(context)
              .textTheme
              .titleSmall,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildFirstTab() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Text(
        controller.data.overview,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
      ),
    );
  }

  Widget _buildSecondTab() {
    return Obx(() {
      if(controller.review.isNotEmpty){
        return ListView.separated(
          itemCount: controller.review.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final review = controller.review[index];
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: CircleAvatar(
                        radius: 35.0,
                        backgroundImage: NetworkImage(Constants.image)),
                  ),
                  10.pw,
                  Expanded(
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.authorDetails!.userName.toUpperCase(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: AppPadding.p8),
                              child: RichText(
                                text: TextSpan(
                                    text: review.content,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleMedium),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => 10.ph,
        );
      }else {
        return Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p120
          ),
          child: Text(AppStrings.noMovies, style: Theme
              .of(context)
              .textTheme
              .headlineLarge,),
        );
      }
    });
  }

  Widget _buildThirdTab() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemCount: controller.cast.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: AppSize.s8),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      AssetManager.imageUrl(controller.cast[index].image)),
                  radius: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(
                  controller.cast[index].name,
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                ),
              ),
            ],
          );
        });
  }
}
