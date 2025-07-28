import 'package:flutter/material.dart';

void main() {
  runApp(Fre,elanceApp());
}

class FreelanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Freelance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system, // Use system theme mode (light/dark) based on device settings
      home: LandingPage(),
      routes: {
        CategoryPage.routeName: (context) => CategoryPage(),
        PeopleListPage.routeName: (context) => PeopleListPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  final List<Category> jobCategories = [
    Category(
      name: 'Web Development',
      icon: Icons.code,
    ),
    Category(
      name: 'Mobile App Development',
      icon: Icons.phone_android,
    ),
    Category(
      name: 'Graphic Design',
      icon: Icons.brush,
    ),
    Category(
      name: 'Content Writing',
      icon: Icons.article,
    ),
    Category(
      name: 'Data Entry',
      icon: Icons.data_usage,
    ),
    Category(
      name: 'Video Editing',
      icon: Icons.video_library,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freelance Site'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // TODO: Handle search button tap
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // TODO: Handle notification button tap
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/user_picture.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // TODO: Handle Home tap
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                // TODO: Handle Favorites tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // TODO: Handle Settings tap
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // TODO: Handle Notifications tap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // TODO: Handle Logout tap
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (value) {
                // TODO: Handle search query
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: jobCategories.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PeopleListPage.routeName,
                        arguments: jobCategories[index],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            jobCategories[index].icon,
                            size: 48.0,
                            color: Colors.blue, // Change the color here
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            jobCategories[index].name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.blue, // Change the selected item color here
      ),
    );
  }
}

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Center(
        child: Text('People list for ${category.name} category'),
      ),
    );
  }
}

class PeopleListPage extends StatelessWidget {
  static const routeName = '/peoplelist';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text('People List'),
      ),
      body: Center(
        child: Text('People list for ${category.name} category'),
      ),
    );
  }
}