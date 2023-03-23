// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/app/extensions.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/presentation/components/components.dart';
import 'package:cinema_app/movies/presentation/controller/watch_list_controller.dart';
import 'package:cinema_app/movies/presentation/resources/app_strings.dart';
import 'package:cinema_app/movies/presentation/resources/asset_manager.dart';
import 'package:cinema_app/movies/presentation/resources/color_manager.dart';
import 'package:cinema_app/movies/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  final WatchListController _controller = Get.put(WatchListController());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Obx(() {
          return _controller.movies.isEmpty
              ? buildNoWatchList()
              : SizedBox(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _controller.movies.length,
                    itemBuilder: (context, index) => _buildBody(index),
                    separatorBuilder: (context, index) => 10.ph,
                  ),
                );
        }));
  }

  Widget buildNoWatchList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Image(
              image: const AssetImage(
                AssetManager.watchListImage,
              ),
              color: ColorManager.primary,
            ),
          ),
          Text(
            AppStrings.noMovies,
            style: Theme.of(context).textTheme.headlineLarge,
          )
        ],
      ),
    );
  }

  Widget _buildBody(index) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: GestureDetector(
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return _getPopDialog([_question(index)]);
              });
        },
        child: SizedBox(
          height: AppSize.s120,
          child: Row(
            children: [_buildMovieImage(index), 20.pw, _buildMovieInfo(index)],
          ),
        ),
      ),
    );
  }

  Widget _buildMovieImage(index) {
    return Container(
      margin: const EdgeInsets.only(left: AppMargin.m8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
        child: CachedNetworkImage(
          imageUrl: AssetManager.imageUrl(_controller.movies[index].posterPath),
          width: AppSize.s120,
          height: AppSize.s120,
          fadeInCurve: Curves.fastOutSlowIn,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              buildImagePlaceHolder(AppSize.s120, AppSize.s120),
        ),
      ),
    );
  }

  Widget _buildMovieInfo(index) {
    DateTime date = DateTime.parse(_controller.movies[index].releaseDate);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                _controller.movies[index].title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_border_rounded,
                  color: ColorManager.primary,
                  size: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    _controller.movies[index].voteAverage
                        .roundToDouble()
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorManager.primary),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: ColorManager.white,
                  size: 14.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      DateFormat.y().format(date),
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPopDialog(List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s2,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.maxFinite,
        height: AppSize.s130,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s14),
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(color: Colors.black26),
          ],
        ),
        child: _getDialogContent(children),
      ),
    );
  }

  Widget _getDialogContent(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget _question(index) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        children: [
          Text(
            AppStrings.question,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: ColorManager.grey),
          ),
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: ColorManager.grey,
                onPressed: () {
                  _controller.deleteItem(MoviesModel(
                      _controller.movies[index].id,
                      _controller.movies[index].backdropPath,
                      _controller.movies[index].posterPath,
                      _controller.movies[index].genreIds,
                      _controller.movies[index].title,
                      _controller.movies[index].overview,
                      _controller.movies[index].voteAverage,
                      _controller.movies[index].releaseDate));
                  Get.back();
                },
                child: Text(
                  AppStrings.yes,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              MaterialButton(
                color: ColorManager.grey,
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  AppStrings.no,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
