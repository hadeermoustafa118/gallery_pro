import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_pro/core/constants.dart';
import 'package:gallery_pro/presentation/cubit/home_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/service_locator.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..getPhotoById(id: id),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: SafeArea(
            child: Center(
              child: state.requestPhotoState != RequestState.loaded
                  ? const Center(
                      child: CupertinoActivityIndicator(
                      color: Colors.orange,
                    ))
                  : Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: MediaQuery.sizeOf(context).width - 50,
                            height: 500.0,
                            fit: BoxFit.fill,
                            imageUrl: state.photo!.srcImage.originalUrl,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[400]!,
                              highlightColor: Colors.grey[200]!,
                              child: Container(
                                height: 500.0,
                                width: MediaQuery.sizeOf(context).width - 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Taken By',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          state.photo!.photographer,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
            ),
          ));
        },
      ),
    );
  }
}
