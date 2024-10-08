import 'package:flutter/material.dart';
import 'package:untitled/Components/filterchips/all_filter_chip.dart';
import 'package:untitled/Components/filterchips/completed.dart';
import 'package:untitled/Components/filterchips/learning.dart';
import 'package:untitled/Components/filterchips/popular.dart';
import 'package:untitled/screens/Other%20Screens/calendar.dart';
import 'package:untitled/screens/Other%20Screens/course_screen.dart';
import 'package:untitled/screens/Other%20Screens/notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto',
      ),
      home: HomeScreen(),
      routes: {
        '/courseDetails': (context) => CourseScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isScrolled = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 0 && !isScrolled) {
      setState(() {
        isScrolled = true;
      });
    } else if (_scrollController.offset <= 0 && isScrolled) {
      setState(() {
        isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: RefreshIndicator(
        color: Colors.teal,
        onRefresh: () async{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Refreshed'),
            ),
          );
         await Future.delayed(
           const Duration(seconds: 2)
         );
        },
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: _buildHeader(),
                ),
                SliverToBoxAdapter(
                  child: _buildSearchBar(),
                ),
                SliverToBoxAdapter(
                  child: _buildFilterChips(),
                ),
                SliverToBoxAdapter(
                  child: _buildSectionHeader('Recent Courses', 'See All'),
                ),
                SliverToBoxAdapter(
                  child: _buildRecentCourses(),
                ),
                SliverToBoxAdapter(
                  child: _buildSectionHeader('Continue Learning', 'See All'),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return _buildCourseCard(index);
                    },
                    childCount: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const CircleAvatar(
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 15),
              const Text(
                'Welcome Back!',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const Spacer(),
              IconButton(
                icon:
                    const Icon(Icons.calendar_today_sharp, color: Colors.white),
                onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CalendarScreen()));
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NotificationsEmailsScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: isScrolled ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            hintText: 'Search course or mentors',
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.search),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    bool isSelected = false;
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              fit: FlexFit.tight,
              flex:2,
              child: AllFilterChip()
          ),
          Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: PopularFilterChip()
          ),
          Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: LearningFilterchip()
          ),
          Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child: Completedfilterchip()
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Text(
              action,
              style: const TextStyle(fontSize: 14, color: Colors.teal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentCourses() {

    List<String> assetImages = [
      "assets/ui.jpg",
      "assets/code.jpg",
      "assets/law.jpg",
      "assets/writer.jpg",
      "assets/bio.jpg"
    ];
    List<String> courseNames = [
      "Design",
      "Computer Science",
      "Law",
      "Literature",
      "Biology"
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/courseDetails', arguments: index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: 'courseThumbnail$index',
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CourseScreen()),
                          );
                        },
                        child: Container(
                          height: 100,
                          decoration:  BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage(assetImages[index+1]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              courseNames[index+1],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Instructor ${index+1}',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            const Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16),
                                Text('4.9 (865)',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(int index) {

    List<String> assetImages = [
      "assets/ui.jpg",
      "assets/code.jpg",
      "assets/law.jpg",
      "assets/writer.jpg",
      "assets/bio.jpg"
    ];

    List<String> courseNames = [
      "Design",
      "Computer Science",
      "Law",
      "Literature",
      "Biology"
    ];


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/courseDetails', arguments: index);
          },
          child: ListTile(
            leading:  CircleAvatar(
              backgroundImage: AssetImage(assetImages[index]),
            ),
            title: Text(courseNames[index]),
            subtitle: Text('Instructor ${index+1}'),
            trailing: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.play_arrow, color: Colors.teal),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
