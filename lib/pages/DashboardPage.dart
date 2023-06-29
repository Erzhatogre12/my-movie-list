import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie_list/app_constanst.dart';
import 'package:my_movie_list/providers/movie_get_discover_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    context.read<MovieGetDiscoverProvide>().getDicover(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding:
              const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MyMovieList',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  const Icon(
                    Icons.menu,
                    size: 38,
                  )
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: GoogleFonts.poppins(),
                    ),
                    const Icon(
                      Icons.search,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),

              Consumer<MovieGetDiscoverProvide>(
                builder: (_, provider, __) {
                  if (provider.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (provider.movies.isNotEmpty) {
                    return SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider.builder(
                        itemCount: provider.movies.length,
                        itemBuilder: (_, index, __) {
                          final movie = provider.movies[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              '${AppConstants.imageUrlw500}${movie.backdropPath}',
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                child: Icon(
                                  Icons.broken_image_rounded,
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 150,
                          viewportFraction: 0.8,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),

                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: provider.movies.length,
                      // itemBuilder: (context, index) {
                      //   final movie = provider.movies[index];
                      //   return Image.network(
                      //       '${AppConstants.imageUrlw500}${movie.backdropPath}');

                      //     return Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Container(
                      //           height: 120,
                      //           width: 90,
                      //           decoration: BoxDecoration(
                      //             color: Colors.grey,
                      //             borderRadius: BorderRadius.circular(15),
                      //           ),
                      //         ),
                      //         Text(
                      //           movie.title,
                      //           softWrap: true,
                      //           overflow: TextOverflow.clip,
                      //           textAlign: TextAlign.center,
                      //         ),
                      //       ],
                      //     );
                      //   },
                      //   separatorBuilder: (BuildContext context, int index) {
                      //     return const SizedBox(
                      //       width: 10,
                      //     );
                      //   },
                      // ),
                    );
                  }

                  return Center(
                    child: Text('Not Found Discover Movies'),
                  );
                },
              ),
              // Flexible(
              //   child: SizedBox(
              //     height: 120,
              //     width: MediaQuery.of(context).size.width,
              //     child: ListView.separated(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           height: 120,
              //           width: 90,
              //           decoration: BoxDecoration(
              //             color: Colors.grey,
              //             borderRadius: BorderRadius.circular(15),
              //           ),
              //         );
              //       },
              //       itemCount: 5,
              //       separatorBuilder: (BuildContext context, int index) {
              //         return const SizedBox(
              //           width: 10,
              //         );
              //       },
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Rated Movies',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'see more...',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular TV Show',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'see more...',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Movies',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'see more...',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Flexible(
                child: SizedBox(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        width: 211,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    },
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
