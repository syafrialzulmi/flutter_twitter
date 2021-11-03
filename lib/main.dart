import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Twitter",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/CaptainJackSparrow.jpg'),
          ),
        ),
        title: SvgPicture.asset(
          'assets/icons/twitter.svg',
          color: Color(0xFF1DA1F2),
          height: 25,
          width: 25,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              'assets/icons/switchTimeline.svg',
              color: Color(0xFF1DA1F2),
              height: 25,
              width: 25,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color(0xff1D9BF0),
      ),
      body: ListView(
        children: <Widget>[
          _buildListOdTweets("assets/images/user1.jpg", "Tiffany Nisa",
              "@tiffanynisa", "10 m", "sastro", "100", "5", "30", "150"),
          _buildListOdTweets("assets/images/user2.jpg", "Syafrial Zulmi",
              "@syafrialzulmi", "1 h", "meong", "20", "51", "90", "50"),
          _buildListOdTweets("assets/images/user3.jpg", "Papah Muda",
              "@papahmuda", "yesterday", "Johny", "10", "3", "3", "250")
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.bell),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.envelope),
            ),
          ],
        ),
      ),
    );
  }

  _tweetAvatar(imageAccount) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: CircleAvatar(
        backgroundImage: AssetImage(imageAccount),
      ),
    );
  }

  _tweetIconButton(iconsTweet, teksNumber) {
    return Row(
      children: <Widget>[
        Icon(
          iconsTweet,
          color: Colors.black45,
          size: 18.0,
        ),
        Container(
          margin: EdgeInsets.all(6.0),
          child: Text(
            teksNumber,
            style: TextStyle(color: Colors.black45, fontSize: 14.0),
          ),
        )
      ],
    );
  }

  _tweetBody(nameUser, accountUser, tweetTime, tweetText, commentNumber,
      retweetNumber, heartNumber, shareNumber) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: Text(
                  nameUser,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                accountUser + " • " + tweetTime,
                style: TextStyle(color: Colors.grey),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.angleDown,
                  size: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            tweetText,
            overflow: TextOverflow.clip,
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _tweetIconButton(FontAwesomeIcons.comment, commentNumber),
                _tweetIconButton(FontAwesomeIcons.retweet, retweetNumber),
                _tweetIconButton(FontAwesomeIcons.heart, heartNumber),
                _tweetIconButton(FontAwesomeIcons.share, shareNumber),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListOdTweets(imageAccount, nameUser, accountUser, tweetTime, tweetText,
      commentNumber, retweetNumber, heartNumber, shareNumber) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _tweetAvatar(imageAccount),
        _tweetBody(nameUser, accountUser, tweetTime, tweetText, commentNumber,
            retweetNumber, heartNumber, shareNumber)
      ],
    );
  }
}
