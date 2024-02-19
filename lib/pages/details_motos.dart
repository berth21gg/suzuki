import 'package:flutter/material.dart';
import 'package:suzuki/models/motos.dart';
import 'package:suzuki/widgets/custom_button.dart';
import 'package:suzuki/widgets/transition.dart';

class DetailMotosPage extends StatefulWidget {
  const DetailMotosPage({Key? key, required this.motos}) : super(key: key);

  final Motos motos;

  @override
  State<DetailMotosPage> createState() => _DetailsMotosPageState();
}

class _DetailsMotosPageState extends State<DetailMotosPage> {
  int valueIndexColor = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -size.height * 0.15,
            right: -size.height * 0.20,
            child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                tween: Tween(begin: 0, end: 1),
                builder: (context, value, __) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: value * (size.height * 0.5),
                    width: value * (size.height * 0.5),
                    decoration: BoxDecoration(
                      color: widget.motos.listImage[valueIndexColor].color,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            right: 0,
            left: 0,
            child: FittedBox(
              child: Text(
                widget.motos.category,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[100],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            right: size.height * 0.07,
            left: size.height * 0.07,
            child: Hero(
              tag: widget.motos.name,
              child: Image(
                image: AssetImage(
                  widget.motos.listImage[valueIndexColor].image,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.motos.category,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.motos.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ShakeTransition(
                      left: false,
                      child: Text(
                        widget.motos.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: widget.motos.punctuation > index
                                ? widget.motos.listImage[valueIndexColor].color
                                : Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.84,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'COLOR',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: List.generate(
                          widget.motos.listImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              valueIndexColor = index;
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: widget.motos.listImage[index].color,
                                shape: BoxShape.circle,
                                border: index == valueIndexColor
                                    ? Border.all(color: Colors.white, width: 2)
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ShakeTransition(
                  left: false,
                  child: CustomButton(
                    onTap: () {},
                    width: 100,
                    color: widget.motos.listImage[valueIndexColor].color,
                    child: const Text(
                      'BUY',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
