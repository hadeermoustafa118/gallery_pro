import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_pro/presentation/cubit/home_cubit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_pro/presentation/screens/photo_details.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/constants.dart';
import '../../core/service_locator.dart';

class PhotosScreen extends StatelessWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<HomeCubit>()..getAllPhotos(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          //  HomeCubit.get(context).scrollChecker();
        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            body: Center(
              child: state.requestState != RequestState.loaded
                  ? const CupertinoActivityIndicator(
                      color: Colors.orange,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AlignedGridView.count(
                        controller: cubit.scrollController,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 15,
                        itemCount:
                            //state.isLoadMore? state.photos!.photos.length+1:
                            state.photos!.photos.length,
                        itemBuilder: (BuildContext context, int index) {
                          // if(index >= state.photos!.photos.length){
                          //   return const CupertinoActivityIndicator(color: Colors.orange,);
                          // }
                          //    else{
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            height: 230,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhotoDetails(
                                                  id: state
                                                      .photos!.photos[index].id,
                                                )));
                                    // cubit.getPhotoById(id: state
                                    //     .photos!.photos[index].id);
                                  },
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: CachedNetworkImage(
                                      width: 200.0,
                                      height: 170.0,
                                      fit: BoxFit.fill,
                                      imageUrl: state.photos!.photos[index]
                                          .srcImage.originalUrl,
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                        baseColor: Colors.grey[400]!,
                                        highlightColor: Colors.grey[200]!,
                                        child: Container(
                                          height: 170.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  state.photos!.photos[index].photographer,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                          //  }
                        },
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
