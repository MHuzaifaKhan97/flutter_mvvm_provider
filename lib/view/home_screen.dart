import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/data/response/status.dart';
import 'package:flutter_mvvm_provider/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_provider/utils/utils.dart';
import 'package:flutter_mvvm_provider/view_model/home_view_model.dart';
import 'package:flutter_mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeviewModel _homeviewModel = HomeviewModel();

  @override
  void initState() {
    super.initState();
    _homeviewModel.getMoviesList();
  }

  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              userVM.removeUser().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.login, (_) => false);
              });
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeviewModel>(
          create: (BuildContext context) => _homeviewModel,
          child: Consumer<HomeviewModel>(builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.COMPLETE:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: ((context, index) {
                      var movie = value.moviesList.data!.movies!;

                      return Card(
                          child: ListTile(
                        leading: Image.network(
                          movie[index].posterurl!,
                          errorBuilder: ((context, error, stackTrace) {
                            return Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          }),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(movie[index].title!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Release Year : ${movie[index].year!}'),
                            // Text('Story Line : ${movie[index].storyline}'),
                            // Text('Rating: ${movie[index].ratings!.first}'),
                            Text(
                                'Date of Release: ${movie[index].releaseDate}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Utils.averageRating(movie[index].ratings!)
                                .toString()),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ));
                    }));
            }
            return Container();
          })),
    );
  }
}
