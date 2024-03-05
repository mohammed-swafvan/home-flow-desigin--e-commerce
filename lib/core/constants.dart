import 'package:flutter/material.dart';
import 'package:home_screen_flow/core/colors.dart';
import 'package:home_screen_flow/core/image_strings.dart';
import 'package:iconsax/iconsax.dart';

// -- AppTheme
ThemeData mainTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
  colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
  primarySwatch: MaterialColor(
    kPrimaryColor.value,
    <int, Color>{
      50: kPrimaryColor.withOpacity(0.1),
      100: kPrimaryColor.withOpacity(0.2),
      200: kPrimaryColor.withOpacity(0.3),
      300: kPrimaryColor.withOpacity(0.4),
      400: kPrimaryColor.withOpacity(0.5),
      500: kPrimaryColor.withOpacity(0.6),
      600: kPrimaryColor.withOpacity(0.7),
      700: kPrimaryColor.withOpacity(0.8),
      800: kPrimaryColor.withOpacity(0.9),
      900: kPrimaryColor.withOpacity(1),
    },
  ),
  scaffoldBackgroundColor: kScaffoldBgColor,
  useMaterial3: true,
);

// -- SizedBox
const kHeight04 = SizedBox(height: 4);
const kHeight05 = SizedBox(height: 5);
const kHeight06 = SizedBox(height: 06);
const kHeight08 = SizedBox(height: 08);
const kHeight10 = SizedBox(height: 10);
const kHeight12 = SizedBox(height: 12);
const kHeight20 = SizedBox(height: 20);
const kHeight25 = SizedBox(height: 25);
const kWidth04 = SizedBox(width: 04);
const kWidth06 = SizedBox(width: 06);
const kWidth08 = SizedBox(width: 08);
const kWidth10 = SizedBox(width: 10);
const kWidth20 = SizedBox(width: 20);

// -- Padding And Margins
const EdgeInsets kPaddingAll12 = EdgeInsets.all(12);
const EdgeInsets kPaddingAll16 = EdgeInsets.all(16);
const EdgeInsets kPaddingVert12 = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets kPaddingVert16 = EdgeInsets.symmetric(vertical: 16);
const EdgeInsets kPaddingHoriz12 = EdgeInsets.symmetric(horizontal: 12);
const EdgeInsets kPaddingHoriz16 = EdgeInsets.symmetric(horizontal: 16);

// -- BorderRadius
final BorderRadius kBorderRadius4 = BorderRadius.circular(4);
final BorderRadius kBorderRadius6 = BorderRadius.circular(6);
final BorderRadius kBorderRadius12 = BorderRadius.circular(12);
final BorderRadius kBorderRadius10 = BorderRadius.circular(10);
final BorderRadius kBorderRadius30 = BorderRadius.circular(30);

// -- Box Shadow
final List<BoxShadow> kCardShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    blurRadius: 6.0,
    offset: const Offset(0, 5),
  ),
  const BoxShadow(
    color: kCardColor,
    offset: Offset(-5, 0),
  ),
  const BoxShadow(
    color: kCardColor,
    offset: Offset(5, 0),
  ),
];

// -- Constant Lists
final List<String> kBanners = [
  ImageStrings.banner_1,
  ImageStrings.banner_2,
  ImageStrings.banner_3,
  ImageStrings.banner_4,
  ImageStrings.banner_5,
];
const List<String> ksortByFilterItems = [
  "Price - High to Low",
  "Price - Low to High",
  "Popularity",
  "Discount",
  "Customer Rating",
];
final List<Map<String, dynamic>> kCategoryItems = [
  {
    "title": "Fashion",
    "img": ImageStrings.fashionIcon,
    "color": const Color.fromARGB(255, 2, 235, 212),
  },
  {
    "title": "Electronics",
    "img": ImageStrings.electronicIcon,
    "color": const Color.fromARGB(255, 255, 106, 0),
  },
  {
    "title": "Appliances",
    "img": ImageStrings.applianceIcon,
    "color": Colors.green,
  },
  {
    "title": "Beauty",
    "img": ImageStrings.beautyIcon,
    "color": const Color.fromARGB(255, 33, 205, 243),
  },
  {
    "title": "Furnitures",
    "img": ImageStrings.furnitureIcon,
    "color": kPrimaryColor,
  },
];
final List<Map<String, dynamic>> kBottomNavItems = [
  {
    "icon": Iconsax.home_15,
    "outlined_icon": Iconsax.home4,
    "text": "Home",
  },
  {
    "icon": Iconsax.category5,
    "outlined_icon": Iconsax.category,
    "text": "Categories",
  },
  {
    "icon": Iconsax.clock5,
    "outlined_icon": Iconsax.clock,
    "text": "Orders",
  },
  {
    "icon": Iconsax.profile_circle5,
    "outlined_icon": Iconsax.profile_circle,
    "text": "Profile",
  },
];
final List<String> kFilterOptions = [
  "Brand",
  "Size",
  "Categories",
  "Bundle",
  "Price Range",
  "Discount",
  "Rating",
  "Pattern",
  "Sleev Length",
  "Character",
  "Fit",
];
List<Map<String, dynamic>> kFilterBrand = [
  {
    "item_name": "HIGHLANDER",
    "is_selected": false,
  },
  {
    "item_name": "Allen Solly",
    "is_selected": false,
  },
  {
    "item_name": "U.S. POLO ASSN.",
    "is_selected": false,
  },
  {
    "item_name": "The Indian Garage Co.",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterSize = [
  {
    "item_name": "S",
    "is_selected": false,
  },
  {
    "item_name": "M",
    "is_selected": false,
  },
  {
    "item_name": "L",
    "is_selected": false,
  },
  {
    "item_name": "XL",
    "is_selected": false,
  },
  {
    "item_name": "XXL",
    "is_selected": false,
  },
  {
    "item_name": " 3 XL",
    "is_selected": false,
  },
  {
    "item_name": "4 XL",
    "is_selected": false,
  },
  {
    "item_name": "5 XL",
    "is_selected": false,
  },
  {
    "item_name": "6 XL",
    "is_selected": false,
  },
  {
    "item_name": "7 XL",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterCategory = [
  {
    "item_name": "Casual",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterBundle = [
  {
    "item_name": "3 - 6",
    "is_selected": false,
  },
  {
    "item_name": "7 - 10",
    "is_selected": false,
  },
  {
    "item_name": "Bundle of 1",
    "is_selected": false,
  },
  {
    "item_name": "Bundle of",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterPriceRange = [
  {
    "item_name": "\$49 and Below",
    "is_selected": false,
  },
  {
    "item_name": "\$50 - \$100",
    "is_selected": false,
  },
  {
    "item_name": "\$100 - \$150",
    "is_selected": false,
  },
  {
    "item_name": "\$200 - \$300",
    "is_selected": false,
  },
  {
    "item_name": "\$500 and Above",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterDiscount = [
  {
    "item_name": "30% or more",
    "is_selected": false,
  },
  {
    "item_name": "40% or more",
    "is_selected": false,
  },
  {
    "item_name": "50% or more",
    "is_selected": false,
  },
  {
    "item_name": "60% or more",
    "is_selected": false,
  },
  {
    "item_name": "70% or more",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterRating = [
  {
    "item_name": "4 & above",
    "is_selected": false,
  },
  {
    "item_name": "3 & above",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterPattern = [
  {
    "item_name": "Animal Print",
    "is_selected": false,
  },
  {
    "item_name": "Checkered",
    "is_selected": false,
  },
  {
    "item_name": "Color Block",
    "is_selected": false,
  },
  {
    "item_name": "Dyed/Ombre",
    "is_selected": false,
  },
  {
    "item_name": "Embellished",
    "is_selected": false,
  },
  {
    "item_name": "Ethnic Motifs",
    "is_selected": false,
  },
  {
    "item_name": "Floral Print",
    "is_selected": false,
  },
  {
    "item_name": "Geometric Print",
    "is_selected": false,
  },
  {
    "item_name": "Graphics Print",
    "is_selected": false,
  },
  {
    "item_name": "Military Camouflage",
    "is_selected": false,
  },
  {
    "item_name": "Polka Print",
    "is_selected": false,
  },
  {
    "item_name": "Printed",
    "is_selected": false,
  },
  {
    "item_name": "Self Design",
    "is_selected": false,
  },
  {
    "item_name": "Solid",
    "is_selected": false,
  },
  {
    "item_name": "Striped",
    "is_selected": false,
  },
  {
    "item_name": "Washed",
    "is_selected": false,
  },
  {
    "item_name": "Woven Design",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterSleeveLength = [
  {
    "item_name": "Full Sleeve",
    "is_selected": false,
  },
  {
    "item_name": "Half Sleeve",
    "is_selected": false,
  },
  {
    "item_name": "Roll-up Sleeve",
    "is_selected": false,
  },
  {
    "item_name": "Shorizt Sleeve",
    "is_selected": false,
  },
  {
    "item_name": "Sleeveless",
    "is_selected": false,
  },
];
List<Map<String, dynamic>> kFilterFit = [
  {
    "item_name": "Boxy",
    "is_selected": false,
  },
  {
    "item_name": "Oversized",
    "is_selected": false,
  },
  {
    "item_name": "Regular",
    "is_selected": false,
  },
  {
    "item_name": "Relazed Fit",
    "is_selected": false,
  },
  {
    "item_name": "Slim",
    "is_selected": false,
  },
  {
    "item_name": "Super SLim",
    "is_selected": false,
  },
  {
    "item_name": "Tailored",
    "is_selected": false,
  },
];
List<IconData> kDeliverOptionsIcons = [
  Iconsax.truck_tick,
  Iconsax.money_4,
  Iconsax.refresh_circle,
];
List<String> kDeliveyOptionsTitles = [
  "Get it by Wed, Feb 06",
  "COD Available",
  "30 Days Exchange/ Return Available",
];
List<String> kReviewSortBy = [
  "Most Helpful",
  "Most Useful",
  "Highest Rating",
  "Lowest Rating",
  "Recent",
];
List<String> kReviewFilter = [
  "All Star",
  "5 Star",
  "4 Star",
  "3 Star",
  "2 Star",
  "1 Star",
];
