import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: YosemiteSlider(),
  ));
}

class YosemiteSlider extends StatefulWidget {
  const YosemiteSlider({super.key});

  @override
  State<YosemiteSlider> createState() => _YosemiteSliderState();
}

class _YosemiteSliderState extends State<YosemiteSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> items = [
    {
      'image': 'https://raw.githubusercontent.com/Rodolfo-Casillas-1054/tiendamarcos_imagenes_app_flutter/refs/heads/main/chidita.png',
      'title': 'Aqui enmarcamos tus recuerdos',
      'description':
          'Aqui podemos hacer eso y mas, mucho mas',
    },
    {
      'image': 'https://raw.githubusercontent.com/Rodolfo-Casillas-1054/tiendamarcos_imagenes_app_flutter/refs/heads/main/inicio.png',
      'title': 'Aqui enmarcamos tus recuerdos',
      'description':
          'Aqui podemos hacer eso y mas, mucho mas',
    },
    {
      'image': 'https://raw.githubusercontent.com/Rodolfo-Casillas-1054/tiendamarcos_imagenes_app_flutter/refs/heads/main/marcos1.jpg',
      'title': 'Aqui enmarcamos tus recuerdos',
      'description':
          'Aqui podemos hacer eso y mas, mucho mas',
    },
    {
      'image': 'https://raw.githubusercontent.com/Rodolfo-Casillas-1054/tiendamarcos_imagenes_app_flutter/refs/heads/main/marcos3.jpg',
      'title': 'Aqui enmarcamos tus recuerdos',
      'description':
          'Aqui podemos hacer eso y mas, mucho mas',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Página deslizable con la interacción
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final bool active = index == _currentPage;

              return Stack(
                fit: StackFit.expand,
                children: [
                  // Mostrar la imagen desde la web
                  Image.network(item['image']!, fit: BoxFit.cover),
                  // Filtro de gradiente para el texto
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                    bottom: active ? 80 : 40,
                    left: 20,
                    right: 20,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 700),
                      opacity: active ? 1.0 : 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(Icons.star, color: Colors.amber, size: 16);
                            }),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['description']!,
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Leer Mas', style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Indicador de página personalizado
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(items.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: index == _currentPage ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == _currentPage ? Colors.white : Colors.white38,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
