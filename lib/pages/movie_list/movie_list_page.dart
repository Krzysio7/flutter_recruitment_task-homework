import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/models/movie.dart';
import 'package:flutter_recruitment_task/pages/movie_list/movie_card.dart';
import 'package:flutter_recruitment_task/pages/movie_list/search_box.dart';
import 'package:flutter_recruitment_task/routing/router.gr.dart';
import 'package:flutter_recruitment_task/services/api_service.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPage createState() => _MovieListPage();
}

class _MovieListPage extends State<MovieListPage> {
  Future<List<Movie>?> _movieList = Future.value([]);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.movie_creation_outlined),
              onPressed: () {
                //TODO implement navigation
              },
            ),
          ],
          title: Text('Movie Browser'),
        ),
        body: Column(
          children: <Widget>[
            SearchBox(onSubmitted: _onSearchBoxSubmitted),
            Expanded(child: _buildContent()),
          ],
        ),
      );

  Widget _buildContent() => FutureBuilder<List<Movie>?>(
      future: _movieList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Text(snapshot.error.toString()),
          );
        } else {
          snapshot.data?.sortByVoteAverageDesc();
          return _buildMoviesList(snapshot.data ?? []);
        }
      });

  Widget _buildMoviesList(List<Movie> movies) => ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1.0,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];

          return MovieCard(
            title: movie.title ?? '',
            rating: '${(movie.voteAverage * 10).toInt()}%',
            onTap: () => context.router.push(
              MovieDetailsPageRoute(
                movieId: movie.id,
                title: movie.title ?? 'Undefined',
              ),
            ),
          );
        },
        itemCount: movies.length,
      );

  void _onSearchBoxSubmitted(String text) {
    setState(() {
      if (text.isNotEmpty) {
        _movieList = ApiService.searchMovies(text);
      } else {
        _movieList = Future.value([]);
      }
    });
  }
}
