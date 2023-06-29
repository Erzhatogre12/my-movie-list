import 'package:flutter/material.dart';
import 'package:my_movie_list/Movies/pages/movie_detail_page.dart';
import 'package:my_movie_list/Movies/provider/movie_get_upcoming_provider.dart';
import 'package:my_movie_list/Movies/widget/image_widget.dart';
import 'package:provider/provider.dart';

class MovieUpcomingComponent extends StatefulWidget {
  const MovieUpcomingComponent({super.key});

  @override
  State<MovieUpcomingComponent> createState() => _MovieUpcomingComponentState();
}

class _MovieUpcomingComponentState extends State<MovieUpcomingComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieGetUpcomingProvider>().getUpcoming(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Consumer<MovieGetUpcomingProvider>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12.0)),
              );
            }

            if (provider.movies.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return ImageNetworkWidget(
                    imageSrc: provider.movies[index].posterPath,
                    height: 200,
                    width: 120,
                    radius: 12.0,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) {
                          return MovieDetailPage(id: provider.movies[index].id);
                        },
                      ));
                    },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 8.0,
                ),
                itemCount: provider.movies.length,
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Text('Not found Popular movies'),
              ),
            );
          },
        ),
      ),
    );
  }
}
