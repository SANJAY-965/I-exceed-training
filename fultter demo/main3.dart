import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _isHovering = List.generate(9, (_) => false);
  final List<bool> _isFeatureHovering = List.generate(3, (_) => false);
  final List<bool> _isInfoHovering = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: "i-exc",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'times',
              color: Colors.orange,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "eed",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'times',
                  color: Colors.black,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 100,
        elevation: 10,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton<String>(
              icon: const Icon(CupertinoIcons.profile_circled, size: 30),
              onSelected: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$value selected')),
                );
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'Login',
                  child: Text('Login'),
                ),
                const PopupMenuItem<String>(
                  value: 'Sign Up',
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(seconds: 1),
                builder: (context, value, child) => Opacity(
                  opacity: value,
                  child: Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: child,
                  ),
                ),
                child: const Text(
                  "Truth, Trust, Transparency",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Our Services",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    final titles = [
                      "Account Opening",
                      "Check Balance",
                      "Loan",
                      "Credit Card",
                      "Investments",
                      "Insurance",
                      "Mutual Funds",
                      "EMI",
                      "Savings",
                    ];
                    final icons = [
                      Icons.account_box,
                      Icons.balance_sharp,
                      Icons.attach_money,
                      Icons.credit_card,
                      Icons.trending_up,
                      Icons.health_and_safety,
                      Icons.account_balance,
                      Icons.payments,
                      Icons.savings,
                    ];
                    return MouseRegion(
                      onEnter: (_) => setState(() => _isHovering[index] = true),
                      onExit: (_) => setState(() => _isHovering[index] = false),
                      child: AnimatedScale(
                        scale: _isHovering[index] ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 300),
                        child: _buildServiceCard(titles[index], icons[index]),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
              screenWidth > 800
                  ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.network(
                      "https://yt3.googleusercontent.com/wsTUj4YqRgaAp1zclwB8a32SlyPQNRNPSXE7vsJz2idh59j3vI72Wjx9XtY656uK4XdJRqp-BA=s900-c-k-c0x00ffffff-no-rj",
                      height: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: 60),
                      child: Text(
                        "Welcome to I-EXCEED BANK, your trusted partner for modern financial services. We provide secure, transparent, and efficient banking solutions tailored to your needs. We focus on customer experience, data-driven insights, and digital transformation to serve you better.",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'serif',
                          wordSpacing: 15,
                          letterSpacing: 1.8,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              )
                  : Column(
                children: [
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2048px-React-icon.svg.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Welcome to I-EXCEED BANK, your trusted partner for modern financial services. We provide secure, transparent, and efficient banking solutions tailored to your needs. We focus on customer experience, data-driven insights, and digital transformation to serve you better.",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'serif',
                        wordSpacing: 10,
                        letterSpacing: 1.2,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              const Text(
                "Why Choose Us ?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: List.generate(3, (i) {
                    final featureData = [
                      {
                        "icon": Icons.security,
                        "title": "Secure",
                        "desc": "Top-tier security for all transactions.",
                      },
                      {
                        "icon": Icons.flash_on,
                        "title": "Fast",
                        "desc": "Instant banking solutions anytime.",
                      },
                      {
                        "icon": Icons.support_agent,
                        "title": "Support",
                        "desc": "24/7 customer support & guidance.",
                      },
                    ];
                    return MouseRegion(
                      onEnter: (_) => setState(() => _isFeatureHovering[i] = true),
                      onExit: (_) => setState(() => _isFeatureHovering[i] = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: Matrix4.identity()..scale(_isFeatureHovering[i] ? 1.05 : 1.0),
                        child: _buildFeature(
                          icon: featureData[i]["icon"] as IconData,
                          title: featureData[i]["title"] as String,
                          description: featureData[i]["desc"] as String,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 100),
              const Text(
                "More About Us",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: List.generate(4, (i) {
                    final infoData = [
                      {
                        "icon": Icons.info_outline,
                        "title": "About Us",
                        "desc": "Learn more about our mission.",
                      },
                      {
                        "icon": Icons.help_outline,
                        "title": "Help",
                        "desc": "Get assistance anytime.",
                      },
                      {
                        "icon": Icons.contact_mail,
                        "title": "Contact Us",
                        "desc": "Reach out to our team.",
                      },
                      {
                        "icon": Icons.feedback_outlined,
                        "title": "Feedback",
                        "desc": "Share your experience.",
                      },
                    ];
                    return MouseRegion(
                      onEnter: (_) => setState(() => _isInfoHovering[i] = true),
                      onExit: (_) => setState(() => _isInfoHovering[i] = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        transform: Matrix4.identity()..scale(_isInfoHovering[i] ? 1.05 : 1.0),
                        child: _buildInfoCard(
                          infoData[i]["icon"] as IconData,
                          infoData[i]["title"] as String,
                          infoData[i]["desc"] as String,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildServiceCard(String title, IconData icon) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  static Widget _buildFeature({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      constraints: const BoxConstraints(minWidth: 120, maxWidth: 180),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 36, color: Colors.blueAccent),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  static Widget _buildInfoCard(
      IconData icon, String title, String description) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.blueAccent),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}



