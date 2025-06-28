import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Bus Queue';
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          background: Colors.yellow.shade100, // สีพื้นหลังเหลืองอ่อน
          onBackground: Colors.black87, // สีตัวอักษรหลักให้อ่านง่าย
        ),
        scaffoldBackgroundColor: Colors.yellow.shade100, // กำหนดพื้นหลังหลัก
        useMaterial3: true,
      ),
      home: const BusQueuePage(title: appTitle),
    );
  }
}

class BusQueuePage extends StatelessWidget {
  const BusQueuePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        backgroundColor: Colors.yellow.shade100,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ImageSection(image: 'imagess/tour.jpg'),
            const TitleSection(
              name: 'Chantaburi Bus Terminal (CBT)',
              location: 'Mueng Chantaburi District, Chantaburi Province',
            ),
            const SizedBox(height: 8),
            const ButtonSection(),
            const SizedBox(height: 8),
            const TextSection(
              description:
                  'Chanthaburi Bus Terminal is located at 24/5 Srisadet Road, Tambon Wat Mai, Amphoe Mueang Chanthaburi, Chanthaburi Province. '
                  'This station provides air-conditioned buses to the North, Northeast, Central, and South (some provinces). '
                  'You can find more information and book tickets online at BusAndVan. '
                  'Chanthaburi Bus Terminal is a large building that is easy to recognize. '
                  'The building has a large white station name sign. BusOnlineTicket Thailand. '
                  'In addition, there are other bus stops related to Chanthaburi Bus Terminal, such as the stop on Srinakarin Road (PT Gas Station), Nong Kla Pier, and other stops in various districts.',
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey[700],
                        ),
                  ),
                ],
              ),
            ),
            const FavoriteWidget(),
          ],
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
            ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
            ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
            ButtonWithText(
                color: color, icon: Icons.access_alarm, label: 'QUEUE'),
            ButtonWithText(
                color: color, icon: Icons.account_box, label: 'ACCOUNT'),
          ],
        ),
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
          softWrap: true,
        ),
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      child: Image.asset(image,
          width: double.infinity, height: 240, fit: BoxFit.cover),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 4;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: (_isFavorited
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border)),
          color: const Color.fromARGB(255, 53, 227, 5),
          onPressed: _toggleFavorite,
        ),
        Text(
          '$_favoriteCount',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
