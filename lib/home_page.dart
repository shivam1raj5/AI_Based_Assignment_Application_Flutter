import 'package:ai_driven_essay_application_flutter/essay_home_page.dart';
import 'package:ai_driven_essay_application_flutter/widgets/video_data.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'widgets/appbar.dart';
import 'widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          onProfilePressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        drawer: const MyDrawer(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: const Color(0xFF171717),
              child: ListView.builder(
                itemCount: VideoData.videoList.length,
                itemBuilder: (context, index) => VideoCard(
                  title: VideoData.videoList[index]["title"]!,
                  image: VideoData.videoList[index]["image"]!,
                  text: VideoData.videoList[index]["text"]!,
                  containerHeight: constraints.maxHeight * 0.25,
                  fontSize: constraints.maxWidth * 0.04,
                ),
              ),
            );
          },
        ),
        floatingActionButton: LayoutBuilder(
          builder: (context, constraints) {
            return FloatingActionBubble(
              items: _buildBubbleItems(constraints),
              animation: _animation!,
              onPress: () => _animationController!.isCompleted
                  ? _animationController!.reverse()
                  : _animationController!.forward(),
              backGroundColor: const Color.fromARGB(255, 42, 42, 42),
              iconColor: const Color.fromARGB(255, 0, 255, 174),
              iconData: Icons.add,
            );
          },
        ),
      ),
    );
  }

  List<Bubble> _buildBubbleItems(BoxConstraints constraints) {
    return [
      _buildBubbleEssay("Essay", Icons.home, constraints),
      _buildBubbleApplication("Application", Icons.home, constraints),
      _buildBubbleAssignment("Assignment", Icons.home, constraints),
    ];
  }

  Bubble _buildBubbleEssay(
      String title, IconData icon, BoxConstraints constraints) {
    return Bubble(
      title: title,
      iconColor: const Color.fromRGBO(11, 240, 255, 1),
      bubbleColor: const Color.fromARGB(255, 42, 42, 42),
      icon: icon,
      titleStyle: TextStyle(
        fontSize: constraints.maxWidth * 0.04,
        color: const Color.fromARGB(255, 0, 255, 174),
      ),
      onPress: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EssayMyHomePage(),
        ));
      },
    );
  }

  Bubble _buildBubbleApplication(
      String title, IconData icon, BoxConstraints constraints) {
    return Bubble(
      title: title,
      iconColor: const Color.fromRGBO(11, 240, 255, 1),
      bubbleColor: const Color.fromARGB(255, 42, 42, 42),
      icon: icon,
      titleStyle: TextStyle(
        fontSize: constraints.maxWidth * 0.04,
        color: const Color.fromARGB(255, 0, 255, 174),
      ),
      onPress: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EssayMyHomePage(),
        ));
      },
    );
  }

  Bubble _buildBubbleAssignment(
      String title, IconData icon, BoxConstraints constraints) {
    return Bubble(
      title: title,
      iconColor: const Color.fromRGBO(11, 240, 255, 1),
      bubbleColor: const Color.fromARGB(255, 42, 42, 42),
      icon: icon,
      titleStyle: TextStyle(
        fontSize: constraints.maxWidth * 0.04,
        color: const Color.fromARGB(255, 0, 255, 174),
      ),
      onPress: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EssayMyHomePage(),
        ));
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String image;
  final String text;
  final double containerHeight;
  final double fontSize;

  const VideoCard({
    Key? key,
    required this.title,
    required this.image,
    required this.text,
    required this.containerHeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Video not available.')),
      ),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: const Color.fromRGBO(11, 240, 255, 1), width: 2.0),
        ),
        child: Card(
          elevation: 2.0,
          margin: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Image.asset(
                image,
                height: containerHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontSize: fontSize * 0.7,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
