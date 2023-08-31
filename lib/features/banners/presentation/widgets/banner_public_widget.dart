import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../controllers/banners_public_controller.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({super.key});

  final _controller = Get.put(BannersPublicController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.isLoading.value
          ? const LoadingWidget(title: 'Carregando Banners...')
          : _controller.isError || _controller.banners.isEmpty
              ? Container()
              : CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 5,
                    viewportFraction: 0.5,
                  ),
                  items: _controller.banners
                      .map((item) => Center(
                            child: Image.memory(
                              item.image,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ))
                      .toList(),
                ),
    );
  }
}
