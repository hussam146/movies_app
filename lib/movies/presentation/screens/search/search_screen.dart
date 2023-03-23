// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/app/constants.dart';
import 'package:cinema_app/app/extensions.dart';
import 'package:cinema_app/movies/presentation/components/components.dart';
import 'package:cinema_app/movies/presentation/controller/search_controller.dart';
import 'package:cinema_app/movies/presentation/resources/app_strings.dart';
import 'package:cinema_app/movies/presentation/resources/asset_manager.dart';
import 'package:cinema_app/movies/presentation/resources/color_manager.dart';
import 'package:cinema_app/movies/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  final SearchController _controller = Get.find();

  @override
  void dispose() {
    _controller.searchList.value = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1 - 30,
              ),
              child: Text(
                AppStrings.search,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (text) {
                  _controller.search(text);
                },
                onChanged: (text){
                  _controller.search(text);
                  text.isEmpty ? _controller.searchList.value = [] : DoNothingAction();
                },
                onSaved: (value){
                  searchController.text = value.orEmpty();
                },
                decoration: InputDecoration(
                    labelText: "Search",
                    suffixIcon: Icon(
                      Icons.search,
                      color: ColorManager.tabColor,
                    )),
              ),
            ),
            10.ph,
            _controller.load.value ==
                false ? const CircularProgressIndicator() :
              Expanded(
                child: SizedBox(
                  height: 120.0,
                  child: Obx(() =>
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _controller.searchList.length,
                      itemBuilder: (context, index) {
                        dynamic date;
                        late String formattedDate;
                        if(_controller.searchList[index].releaseDate != "" || _controller.searchList[index].releaseDate != null){
                          date = DateTime.parse(_controller.searchList[index].releaseDate);
                          formattedDate = DateFormat.y().format(date);
                        }
                        return Padding(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          child: SizedBox(
                            height: AppSize.s120,
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                  const EdgeInsets.only(left: AppMargin.m8),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(AppSize.s8)),
                                    child: CachedNetworkImage(
                                      imageUrl: _controller
                                          .searchList[index]
                                          .posterPath == null
                                          ? Constants.image
                                          : AssetManager.imageUrl(_controller
                                          .searchList[index].posterPath),
                                      width: AppSize.s120,
                                      height: AppSize.s120,
                                      fadeInCurve: Curves.fastOutSlowIn,
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) =>
                                          buildImagePlaceHolder(
                                              AppSize.s120, AppSize.s120),

                                    ),
                                  ),
                                ),
                                20.pw,
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            _controller.searchList[index]
                                                .title,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .bodySmall,
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
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: Text(
                                                _controller
                                                    .searchList[index]
                                                    .voteAverage
                                                    .roundToDouble()
                                                    .toString(),
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                    color:
                                                    ColorManager.primary),
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
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: _controller.searchList[index].releaseDate != "" ?Text(
                                                formattedDate,
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ) : Text(
                                                "No Date",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 10.ph,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
