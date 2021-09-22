import 'package:auto_route/annotations.dart';
import 'package:flutter_recruitment_task/pages/movie_details/movie_details_page.dart';
import 'package:flutter_recruitment_task/pages/movie_list/movie_list_page.dart';
import 'package:flutter_recruitment_task/pages/two_buttons/two_buttons_page.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: MovieListPage, initial: true),
    AutoRoute(page: MovieDetailsPage),
    AutoRoute(page: TwoButtonsPage),
  ],
)
class $AppRouter {}
