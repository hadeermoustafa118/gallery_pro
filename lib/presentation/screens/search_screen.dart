import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallery_pro/presentation/component/search_text_field.dart';
import 'package:gallery_pro/presentation/cubit/search_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants.dart';
import '../../core/service_locator.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchCubit>(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SearchTextField(
                    controller: cubit.searchController,
                    onTap: (_) {
                      if (cubit.searchController.text == '') {
                        cubit.change();
                      } else {
                        cubit.getSearchResult();
                      }
                    },
                  ),
                  state.isEmptyController
                      ? const Center(
                          child: Text(
                            'No Data Found',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      : Center(
                          child: state.requestState != RequestState.loaded
                              ? const CupertinoActivityIndicator(
                                  color: Colors.orange,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height - 100,
                                    child: AlignedGridView.count(
                                      controller: cubit.scrollController,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 15,
                                      itemCount:
                                          //state.isLoadMore? state.photos!.photos.length+1:
                                          state.result!.photos.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // if(index >= state.photos!.photos.length){
                                        //   return const CupertinoActivityIndicator(color: Colors.orange,);
                                        // }
                                        //    else{
                                        return Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(8.0)),
                                                child: CachedNetworkImage(
                                                  width: 200.0,
                                                  height: 170.0,
                                                  fit: BoxFit.fill,
                                                  imageUrl: state
                                                      .result!
                                                      .photos[index]
                                                      .srcImage
                                                      .originalUrl,
                                                  placeholder: (context, url) =>
                                                      Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey[400]!,
                                                    highlightColor:
                                                        Colors.grey[200]!,
                                                    child: Container(
                                                      height: 170.0,
                                                      width: 120.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                state.result!.photos[index]
                                                    .photographer,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                        ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}
