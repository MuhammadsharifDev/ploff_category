import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_part/home/bloc/home_bloc.dart';

class BannerWidgetList extends StatelessWidget {
  const BannerWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
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
        );
      },
    );
  }
}
