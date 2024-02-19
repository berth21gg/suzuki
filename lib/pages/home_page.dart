import 'package:flutter/material.dart';
import 'package:suzuki/models/data.dart';
import 'package:suzuki/pages/details_motos.dart';
import 'package:suzuki/widgets/custom_app_bar.dart';
import 'package:suzuki/widgets/custom_bottom_bar.dart';

class HomePageMotos extends StatefulWidget {
  const HomePageMotos({Key? key}) : super(key: key);

  @override
  State<HomePageMotos> createState() => _HomePageMotosState();
}

class _HomePageMotosState extends State<HomePageMotos> {
  final _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      (_currentPage >= 0 && _currentPage < 0.7)
          ? indexPage = 0
          : (_currentPage > 0.7 && _currentPage < 1.7)
              ? indexPage = 1
              : (_currentPage > 1.7 && _currentPage < 2.7)
                  ? indexPage = 2
                  : null;
    });
  }

  Color getColor() {
    late final Color color;
    (_currentPage >= 0 && _currentPage < 0.7)
        ? color = listMotos[0].listImage[0].color
        : (_currentPage > 0.7 && _currentPage < 1.7)
            ? color = listMotos[1].listImage[0].color
            : (_currentPage > 1.7 && _currentPage < 2.7)
                ? color = listMotos[2].listImage[0].color
                : null;
    return color;
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: List.generate(
                  listCategory.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      listCategory[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: index == indexPage ? getColor() : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listMotos.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                final motos = listMotos[index];
                final listTile = motos.cc.split(' ');
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, _) {
                          return DetailMotosPage(motos: motos);
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: index == indexPage ? 30 : 60),
                    child: Transform.translate(
                      offset: Offset(index == indexPage ? 0 : 20, 0),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return AnimatedContainer(
                          duration: const Duration(microseconds: 250),
                          margin: EdgeInsets.only(
                            top: index == indexPage ? 30 : 50,
                            bottom: 30,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36),
                            color: Colors.white,
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 40.0,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      motos.category,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      motos.name,
                                      style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      motos.price,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    FittedBox(
                                      child: Text(
                                        '${listTile[0]} ${listTile[1]}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -constraints.maxHeight * 0.2,
                                left: 0,
                                right: 0,
                                bottom: -constraints.maxHeight * 0.4,
                                child: Hero(
                                  tag: motos.name,
                                  child: Image(
                                    image: AssetImage(
                                      motos.listImage[0].image,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Material(
                                  color: motos.listImage[0].color,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(36),
                                    bottomRight: Radius.circular(36),
                                  ),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: InkWell(
                                    onTap: () {},
                                    child: const SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(color: getColor()),
          )
        ],
      ),
    );
  }
}
