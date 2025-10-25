import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feautres/home/data/models/best_seller_response/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final Product book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routes.details, extra: book);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: book.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // الصورة كده اتكيشت فمش هحتاج اعمل ريكويست جديدة عكس network.image
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? '',
                    width: double.infinity,
                    // بحط شكل ريلود لحد لما الصورة تظهر
                    // placeholder: (context, url) =>
                    //     Center(child: CircularProgressIndicator()),
                    fit: BoxFit.cover,
                    errorWidget: (context, error, stackTrace) {
                      return Image.asset(
                        AppImages.welcomePNG,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ),
            ),
            Gap(10),
            SizedBox(
              height: 45,
              child: Text(
                book.name ?? '',
                style: TextStyles.stylesize16(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${book.priceAfterDiscount}',
                  style: TextStyles.stylesize16(),
                ),
                MainButton(
                  width: 80,
                  height: 30,
                  bgColor: AppColors.darkColor,
                  text: 'Buy',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
