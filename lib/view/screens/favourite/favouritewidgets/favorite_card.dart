import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/view/widget/text_widget.dart';
import 'package:sizer/sizer.dart';

class FavouriteCard extends StatelessWidget {
  final String img;
  final bool ifNetworkImage;
  final String title;
  final String underText;
  final Color textcolor;
  final int flex;
  // ignore: prefer_typing_uninitialized_variables
  final firstIcon;
  // ignore: prefer_typing_uninitialized_variables
  final secondIcon;

  const FavouriteCard(
      {Key? key,
      required this.img,
      required this.ifNetworkImage,
      required this.title,
      required this.underText,
      required this.textcolor,
      required this.firstIcon,
      required this.secondIcon,
      required this.flex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: ifNetworkImage
                          ? DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.contain,
                            )
                          : DecorationImage(
                              image: AssetImage(img),
                              fit: BoxFit.contain,
                            )),
                ),
              ),
              Container(
                height: 125,
                width: 2,
                color: const Color.fromARGB(255, 226, 226, 226),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, right: 25),
                        child: TextWidget(
                            text: title,
                            color: textcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            maxline: 1)),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 25, top: 10),
                        child: TextWidget(
                          text: underText,
                          color: textcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          textAlign: TextAlign.start,
                          maxline: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
              Container(
                height: 125,
                width: 2,
                color: const Color.fromARGB(255, 226, 226, 226),
              ),
              Expanded(
                flex: flex,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    firstIcon,
                    secondIcon,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
