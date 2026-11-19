import 'package:material_ui/material_ui.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavCard(title: "Title",des: "Description",isFav: true,),
            FavCard(title: "Title",des: "Description",isFav: false,),
            FavCard(title: "Title",des: "Description",isFav: true,),
          ],
        ),
      ),
    ));

class FavCard extends StatefulWidget {
  final String title;
  final String des;
  final bool isFav;
  const FavCard({super.key,required this.title,required this.des,required this.isFav});

  @override
  State<FavCard> createState() => FavCardState();
}

class FavCardState extends State<FavCard> {
  late bool isfaved;
  void initState(){
    super.initState();
    isfaved = widget.isFav;
  }

  toggle(){
    setState(() {
      isfaved = !isfaved;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: Colors.grey,
          width: 1,
        ))
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title),
                Text(widget.des),
              ],
            ),
          ),

          IconButton(onPressed:toggle, icon: !isfaved ? Icon(Icons.favorite_outline):Icon(Icons.favorite,color: Colors.red[500],)),
        ],
      ),
    );
  }
}