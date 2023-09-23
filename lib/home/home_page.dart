import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_part/core/widgets/container_widget.dart';
import 'package:ploff_part/core/widgets/text_widget.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(CategoryEvent())
        ..add(BannerEvent())
        ..add(GetCategoryEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white.withOpacity(0.9),
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 100,
              elevation: 0,
              title: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white38,
                  filled: true,
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: 'Search which is you like food',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: media.height * 16 / 812,
                ),
                SizedBox(
                  height: media.height * 40 / 812,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.getCategoryResponse?.categories?.length,
                    itemBuilder: (context, index) {
                      var sort = state.getCategoryResponse?.categories?[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 13,
                          right: 16,
                        ),
                        child: Container(
                          width: media.width * 100 / 375,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(sort?.title?.ru ?? 'no things'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: media.height * 16 / 812,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    height: media.height * 250 / 812,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.bannerResponse?.banners?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: media.width * 343 / 376,
                            height: media.height * 160 / 812,
                            child: CachedNetworkImage(
                              imageUrl:
                                  state.bannerResponse?.banners?[index].image ??
                                      '',
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: media.height * 16 / 812,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.getCategoryResponse?.categories?.length,
                    itemBuilder: (context, index) {
                      var sort = state.getCategoryResponse?.categories?[index];
                      var product =
                          state.categoriesResponse?.categories?[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Container(
                          height: media.height * 480 / 812,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 15, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               TextItems.items(text: sort?.title?.ru ?? 'no things', size: 22),
                               TextItems.items(text: sort?.products?[index].title?.ru ?? '', size: 15),
                               TextItems.items(text: sort?.products?[index].description?.ru ?? '', size: 10),
                                SizedBox(
                                  height: media.height * 12 / 812,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: sort?.products?[index].image??'',
                                      placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextItems.items(text: sort?.products?[index].outPrice.toString() ?? '', size: 15),
                                    const SizedBox(width: 8,),
                                    TextItems.items(text:sort?.products?[index].currency??'' , size: 15),
                                  ],
                                ),
                                const Divider(),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
