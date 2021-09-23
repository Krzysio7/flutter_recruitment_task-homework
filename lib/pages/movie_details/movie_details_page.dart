import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/models/movie_details.dart';
import 'package:flutter_recruitment_task/pages/movie_details/move_detail.dart';
import 'package:flutter_recruitment_task/services/api_service.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  final String title;

  const MovieDetailsPage({required this.movieId, required this.title});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: ApiService.getMovieDetails(widget.movieId),
          builder:
              (BuildContext context, AsyncSnapshot<MovieDetails> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(snapshot.error.toString()),
              );
            } else {
              return DetailsList(details: snapshot.data);
            }
          },
        ),
      );
}

class DetailsList extends StatelessWidget {
  final MovieDetails? details;

  DetailsList({Key? key, this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MovieDetail> _details = _buildDetailsList();

    return ListView.separated(
      separatorBuilder: (context, index) => Container(
        height: 1.0,
        color: Colors.grey.shade300,
      ),
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _details[index].title,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(height: 8.0),
            Text(
              _details[index].content,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
      itemCount: _details.length,
    );
  }

  List<MovieDetail> _buildDetailsList() {
    final _details = [
      MovieDetail(
          title: 'Budget', content: '\$${details?.budget.toString() ?? ''}'),
      MovieDetail(
          title: 'Revenue', content: '\$${details?.revenue.toString() ?? ''}'),
      MovieDetail(
          title: 'Should I watch it today?',
          content: _shouldIWatchIt() ? 'Yes' : 'No'),
    ];
    return _details;
  }

  bool _shouldIWatchIt() {
    if (details == null) {
      return false;
    } else {
      return DateTime.now().weekday == DateTime.sunday &&
              details!.revenue - details!.budget > 1000000
          ? true
          : false;
    }
  }
}
