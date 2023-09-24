import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_part/core/widgets/container_widget.dart';
import 'package:ploff_part/core/widgets/text_widget.dart';
import 'package:ploff_part/home/widget/bannaer_widget_list.dart';
import 'package:ploff_part/home/widget/bottom_listview_widget.dart';
import 'package:ploff_part/home/widget/textformfield_widget.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              toolbarHeight: 120,
              elevation: 0,
              title: TextFormFieldWidget(),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: BottomListViewWidget(),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: media.height * 16 / 812,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      height: media.height * 185 / 812,
                      child: const BannerWidgetList(),
                    ),
                  ),
                  SizedBox(
                    height: media.height * 16 / 812,
                  ),
                  SizedBox(
                    height: media.height * 480 / 812,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.getCategoryResponse?.categories?.length,
                      itemBuilder: (context, index) {
                        var sort = state.getCategoryResponse?.categories?[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Container(
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
                                  TextItems.items(text: sort?.title?.uz ?? 'no things', size: 22),
                                  TextItems.items(text: sort?.products?[index].title?.ru ?? 'no things', size: 15),
                                  TextItems.items(text: sort?.products?[index].description?.ru ?? 'no things', size: 10),
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
            ),
          );
        },
      ),
    );
  }
}
