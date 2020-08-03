import 'package:flutter/material.dart';
import 'package:pagination/bloc/photo_bloc.dart';
import 'package:pagination/models/photos.dart';
import 'package:pagination/ui/widgets/photo_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var currentPage;
  var nextPage;
  final _controller = ScrollController();

  @override
  void initState() {
    currentPage = 1;
    bloc.fetchPhotos(1);
    _controller.addListener((){
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        if (nextPage != currentPage) {
          print("calling $nextPage");
          bloc.fetchPhotos(nextPage);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: bloc.photos,
        builder: (context, AsyncSnapshot<Photos> snapshot) {
          if (snapshot.hasData) {
            currentPage = snapshot.data.page;
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Center( child: Text(snapshot.error.toString()));
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<Photos> snapshot) {
    return GridView.builder(
        controller: _controller,
        itemCount: snapshot.data.photo.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          if (index < snapshot.data.photo.length) {
            return PhotoCard(snapshot.data.photo[index]);
          } else if (3 == currentPage){
            return Center(child: Text("No More Photos Available"));
          } else {
            nextPage = currentPage +1;
            return Center(child: const CircularProgressIndicator());
          }
        });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
