import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_part/core/widgets/container_widget.dart';

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
    var media = MediaQuery
        .of(context)
        .size;
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetCategoryEvent())..add(BannerEvent()),
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: media.height * 16 / 812,),
                  SizedBox(
                    height: media.height * 40 / 812,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoriesResponse?.categories?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 13, right: 16,),
                          child: Container(
                            width: media.width * 100 / 375,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                  state.categoriesResponse?.categories?[index].name.toString()?? ''),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: media.height * 16 / 812,),
                  Container(
                    color: Colors.white,
                    child: SizedBox(
                      height: media.height*250/812,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.bannerResponse?.banners?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: media.width*343/376,
                              height: media.height*160/812,
                              child: Image.network(state.bannerResponse?.banners?[index].image??'',fit: BoxFit.cover,),
                            ),
                          );
                        },
                      ),
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
