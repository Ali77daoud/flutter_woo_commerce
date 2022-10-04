import 'package:flutter/material.dart';
import 'package:flutter_woocommerce/utils/app_theme.dart';
import '../../../widget/buy_widget.dart';
import 'components/products_info.dart';
import 'components/image_slider.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> mylist = [
      const ImageSlider(
        img: 'assets/images/shirt2.jpg',
      ),
      const ProductsInfo(
        title: 'قميص',
        discription:
            'dfkjndfkjndkfjndfkjndkfjdnkfnkjnkjnkjnkjnkjnkjnkjnkjnkjnkjnkjnkjnkjnkjnkj',
      ),
    ];
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: whiteColor,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return mylist[index];
                  },
                  itemCount: mylist.length,
                ),
              ),
              BuyWidget(
                firstText: 'السعر',
                buttonText: 'أضف للسلّة',
                price: '25000 ل.س',
                ontab: () {
                  print(MediaQuery.of(context).size.width);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
