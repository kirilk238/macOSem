class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl; // Using asset image path
  final double price;
  final String category;
  final List<String> moreImages; // For product detail page
  final List<String> availableSizes; // Example: for rings

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    this.moreImages = const [],
    this.availableSizes = const [],
  });
}

// Mock Product Data
// Note: Ensure you have corresponding images in your assets folder.
// For example: 'assets/products/rings/ring1.png', 'assets/products/chains/chain1.png', etc.
// If not, use the existing category images as placeholders for now.
// IMPORTANT: Make sure the image paths like 'assets/rings_category.png'
// correctly point to images in your 'assets' folder and that these assets
// are declared in your pubspec.yaml file.

final List<Product> mockProducts = [
  // Rings
  Product(
    id: 'ring001',
    name: 'Solitaire Moissanite Ring',
    category: 'Rings',
    price: 320.00,
    imageUrl:
        'assets/rings_category.png', // Replace with specific product image if you have one
    description:
        'A stunning 1.5 carat round-cut moissanite solitaire engagement ring set in 14k white gold. Timeless elegance and exceptional sparkle.',
    moreImages: [
      'assets/rings_category.png',
      'assets/rings_category.png',
    ], // Placeholder, use different images if available
    availableSizes: ['5', '6', '7', '8', '9'],
  ),
  Product(
    id: 'ring002',
    name: 'Halo Moissanite Ring',
    category: 'Rings',
    price: 450.00,
    imageUrl: 'assets/rings_category.png', // Replace
    description:
        'Elegant halo design featuring a 1.0 carat center moissanite surrounded by smaller accent stones. Crafted in platinum.',
    availableSizes: ['6', '7', '8'],
  ),
  Product(
    id: 'ring003',
    name: 'Vintage Style Moissanite Band',
    category: 'Rings',
    price: 280.00,
    imageUrl: 'assets/rings_category.png', // Replace
    description:
        'Beautiful vintage-inspired moissanite band with intricate details. Perfect as a wedding band or a stackable ring.',
  ),
  Product(
    id: 'ring004',
    name: 'Three-Stone Moissanite Ring',
    category: 'Rings',
    price: 520.00,
    imageUrl: 'assets/rings_category.png', // Replace
    description:
        'Symbolic three-stone ring representing past, present, and future. Features three brilliant moissanites.',
  ),

  // Chains
  Product(
    id: 'chain001',
    name: 'Classic Moissanite Pendant Necklace',
    category: 'Chains',
    price: 199.00,
    imageUrl: 'assets/chains_category.png', // Replace
    description:
        'A delicate 18-inch chain featuring a sparkling 0.5 carat moissanite pendant. Perfect for everyday wear.',
    moreImages: ['assets/chains_category.png'],
  ),
  Product(
    id: 'chain002',
    name: 'Moissanite Tennis Necklace',
    category: 'Chains',
    price: 1200.00,
    imageUrl: 'assets/chains_category.png', // Replace
    description:
        'Luxurious tennis necklace adorned with a continuous line of brilliant moissanites. A true statement piece.',
  ),
  Product(
    id: 'chain003',
    name: 'Simple Gold Chain with Moissanite Accent',
    category: 'Chains',
    price: 150.00,
    imageUrl: 'assets/chains_category.png', // Replace
    description:
        'Minimalist gold chain with a single, subtle moissanite accent. Versatile and chic.',
  ),
  Product(
    id: 'chain004',
    name: 'Layered Moissanite Necklace Set',
    category: 'Chains',
    price: 350.00,
    imageUrl: 'assets/chains_category.png', // Replace
    description:
        'Trendy set of two layered necklaces, one with a moissanite bar and another with a small charm.',
  ),

  // Bracelets
  Product(
    id: 'bracelet001',
    name: 'Moissanite Tennis Bracelet',
    category: 'Bracelets',
    price: 850.00,
    imageUrl: 'assets/bracelets_category.png', // Replace
    description:
        'Elegant tennis bracelet featuring a row of dazzling moissanites. Secure clasp and comfortable fit.',
    moreImages: ['assets/bracelets_category.png'],
  ),
  Product(
    id: 'bracelet002',
    name: 'Delicate Moissanite Charm Bracelet',
    category: 'Bracelets',
    price: 220.00,
    imageUrl: 'assets/bracelets_category.png', // Replace
    description:
        'Charming bracelet with small moissanite-studded charms. Adjustable length.',
  ),
  Product(
    id: 'bracelet003',
    name: 'Moissanite Bolo Bracelet',
    category: 'Bracelets',
    price: 310.00,
    imageUrl: 'assets/bracelets_category.png', // Replace
    description:
        'Modern bolo bracelet with a central moissanite feature. Easily adjustable for a perfect fit.',
  ),
  Product(
    id: 'bracelet004',
    name: 'Solid Gold Bangle with Moissanite',
    category: 'Bracelets',
    price: 600.00,
    imageUrl: 'assets/bracelets_category.png', // Replace
    description:
        'A classic solid gold bangle enhanced with a flush-set moissanite stone for a touch of sparkle.',
  ),

  // Earrings
  Product(
    id: 'earring001',
    name: 'Moissanite Stud Earrings (1 ctw)',
    category: 'Earrings',
    price: 250.00,
    imageUrl: 'assets/earrings_category.png', // Replace
    description:
        'Classic round moissanite stud earrings, 0.5 carat each, totaling 1 carat. Essential for any jewelry collection.',
    moreImages: ['assets/earrings_category.png'],
  ),
  Product(
    id: 'earring002',
    name: 'Moissanite Hoop Earrings',
    category: 'Earrings',
    price: 380.00,
    imageUrl: 'assets/earrings_category.png', // Replace
    description:
        'Sparkling hoop earrings lined with small, brilliant moissanites. Available in various sizes.',
  ),
  Product(
    id: 'earring003',
    name: 'Moissanite Drop Earrings',
    category: 'Earrings',
    price: 320.00,
    imageUrl: 'assets/earrings_category.png', // Replace
    description:
        'Elegant drop earrings featuring pear-shaped moissanites. Perfect for special occasions.',
  ),
  Product(
    id: 'earring004',
    name: 'Moissanite Ear Climbers',
    category: 'Earrings',
    price: 290.00,
    imageUrl: 'assets/earrings_category.png', // Replace
    description:
        'Trendy ear climbers adorned with a gradient of moissanite stones for a modern look.',
  ),
];
