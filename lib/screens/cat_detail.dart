import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:meow_finder/models/cat_breed.dart';

class CatDetail extends StatelessWidget {
  const CatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Arguments are received
    final CatBreed catBreed =
        ModalRoute.of(context)?.settings.arguments as CatBreed;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            collapsedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                catBreed.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'cat-${catBreed.id}',
                    child: FadeInImage(
                      placeholder:
                          const AssetImage('assets/images/meowding.gif'),
                      image: NetworkImage(
                        'https://cdn2.thecatapi.com/images/${catBreed.referenceImageId}.jpg',
                      ),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/images/img_cat_not_available.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                        stops: [0.7, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    catBreed.description ?? 'No description',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Basic Information',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8.0),
                          _buildInfoRow(
                              'Weight', '${catBreed.weight?.metric} kg'),
                          _buildInfoRow('Origin', catBreed.origin ?? 'Unknown'),
                          _buildInfoRow(
                              'Life expectancy', '${catBreed.lifeSpan} years'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Temperament',
                                style: Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 8.0),
                            Wrap(
                              spacing: 8.0,
                              children:
                                  (catBreed.temperament?.split(', ') ?? [])
                                      .map((trait) => Chip(label: Text(trait)))
                                      .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text('Characteristics'),
                    children: [
                      _buildCharacteristicBar(
                          'Adaptability', catBreed.adaptability ?? 0),
                      _buildCharacteristicBar(
                          'Level of Affection', catBreed.affectionLevel ?? 0),
                      _buildCharacteristicBar(
                          'Child Friendly', catBreed.childFriendly ?? 0),
                      _buildCharacteristicBar(
                          'Dog Friendly', catBreed.dogFriendly ?? 0),
                      _buildCharacteristicBar(
                          'Energy Level', catBreed.energyLevel ?? 0),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More information',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildLinkButton(
                                'Wikipedia', catBreed.wikipediaUrl, context),
                            _buildLinkButton('CFA', catBreed.cfaUrl, context),
                            _buildLinkButton(
                                'Vetstreet', catBreed.vetstreetUrl, context),
                            _buildLinkButton(
                                'VCA', catBreed.vcahospitalsUrl, context),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildCharacteristicBar(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(label)),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              value: value / 5,
              backgroundColor: Colors.grey[300],
              valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.purple.withOpacity(0.5)),
            ),
          ),
          SizedBox(width: 40, child: Text(' $value/5')),
        ],
      ),
    );
  }

  Widget _buildLinkButton(String label, String? url, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Tooltip(
        message: label,
        preferBelow: false,
        verticalOffset: 48,
        child: ElevatedButton(
          onPressed: url != null ? () => _launchURL(url, context) : null,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: _getColorForLabel(label),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(_getIconForLabel(label)),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'wikipedia':
        return Colors.red[700]!.withOpacity(0.5);
      case 'cfa':
        return Colors.blue[700]!.withOpacity(0.5);
      case 'vetstreet':
        return Colors.green[700]!.withOpacity(0.5);
      case 'vca':
        return Colors.orange[700]!.withOpacity(0.5);
      default:
        return Colors.purple[700]!.withOpacity(0.5);
    }
  }

  IconData _getIconForLabel(String label) {
    switch (label.toLowerCase()) {
      case 'wikipedia':
        return Icons.menu_book;
      case 'cfa':
        return Icons.pets;
      case 'vetstreet':
        return Icons.local_hospital;
      case 'vca':
        return Icons.healing;
      default:
        return Icons.link;
    }
  }

  Future<void> _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo abrir el enlace: $url')),
      );
    }
  }
}
