// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:flutter_recruitment_task/pages/movie_details/movie_details_page.dart'
    as _i4;
import 'package:flutter_recruitment_task/pages/movie_list/movie_list_page.dart'
    as _i3;
import 'package:flutter_recruitment_task/pages/two_buttons/two_buttons_page.dart'
    as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MovieListPageRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.MovieListPage());
    },
    MovieDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsPageRouteArgs>();
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.MovieDetailsPage(movieId: args.movieId));
    },
    TwoButtonsPageRoute.name: (routeData) {
      return _i1.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.TwoButtonsPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MovieListPageRoute.name, path: '/'),
        _i1.RouteConfig(MovieDetailsPageRoute.name,
            path: '/movie-details-page'),
        _i1.RouteConfig(TwoButtonsPageRoute.name, path: '/two-buttons-page')
      ];
}

class MovieListPageRoute extends _i1.PageRouteInfo<void> {
  const MovieListPageRoute() : super(name, path: '/');

  static const String name = 'MovieListPageRoute';
}

class MovieDetailsPageRoute
    extends _i1.PageRouteInfo<MovieDetailsPageRouteArgs> {
  MovieDetailsPageRoute({required int movieId})
      : super(name,
            path: '/movie-details-page',
            args: MovieDetailsPageRouteArgs(movieId: movieId));

  static const String name = 'MovieDetailsPageRoute';
}

class MovieDetailsPageRouteArgs {
  const MovieDetailsPageRouteArgs({required this.movieId});

  final int movieId;
}

class TwoButtonsPageRoute extends _i1.PageRouteInfo<void> {
  const TwoButtonsPageRoute() : super(name, path: '/two-buttons-page');

  static const String name = 'TwoButtonsPageRoute';
}
