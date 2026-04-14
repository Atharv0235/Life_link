import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Brand Colors matching the template
  final Color primaryRed = const Color(0xFFE52129); // Amcare primary red
  final Color darkGradient = const Color(0xFF1B1B1B);

  int _activeModuleIndex = 0;

  final List<Map<String, dynamic>> _modules = [
    {
      'title': 'Eye Module: AI Vision',
      'desc': 'Processes CCTV video streams in real-time to detect accident events using YOLOv8 object detection, extracting license plates via OCR instantly.',
      'f1': 'Sub-3s Detection', 'f2': 'Automated OCR',
      'f3': 'Severity Classification', 'f4': 'Incident Matrix',
      'img': 'assets/medical_dashboard.png',
    },
    {
      'title': 'Brain Module: Smart Routing',
      'desc': 'Queries MediChain for patient medical profiles and calculates optimal hospital routing considering blood availability and trauma capability.',
      'f1': 'Blockchain Profiles', 'f2': 'Blood Matcher',
      'f3': 'ETA Optimization', 'f4': 'Capacity Tracking',
      'img': 'assets/medical_dashboard.png',
    },
    {
      'title': 'Path Module: Green Corridor',
      'desc': 'Tracks ambulance GPS and automatically preempts IoT traffic signals to ensure a zero-delay green corridor.',
      'f1': 'IoT Signal Control', 'f2': 'Live GPS Tracking',
      'f3': 'Corridor Automation', 'f4': 'Traffic Preemption',
      'img': 'assets/medical_dashboard.png',
    },
    {
      'title': 'Smart Contracts',
      'desc': 'Verifies accidents and automatically locks emergency funds from insurance policies to guarantee immediate hospital admission without financial delays.',
      'f1': 'Instant Verification', 'f2': 'Fund Locking',
      'f3': 'Immutable Audit', 'f4': 'Automated Release',
      'img': 'assets/medical_dashboard.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopBar(),
            _buildNavBar(),
            _buildHeroSection(),
            _buildInfoBoxes(),
            _buildAboutSection(),
            _buildServicesSection(),
            _buildStatsSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      color: primaryRed,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.phone, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text('Call: +91 9876543210', style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
              const SizedBox(width: 24),
              Icon(Icons.mail, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text('Mail: priority@lifelink.ai', style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
            ],
          ),
          Row(
            children: [
              Text('ENGLISH', style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
              const SizedBox(width: 20),
              Text('SHARE:', style: GoogleFonts.inter(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
              const SizedBox(width: 10),
              Icon(Icons.facebook, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Icon(Icons.share, color: Colors.white, size: 18),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNavBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Icon(Icons.health_and_safety, color: primaryRed, size: 36),
              const SizedBox(width: 8),
              Text(
                'LifeLink',
                style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold, color: darkGradient),
              ),
            ],
          ),
          // Nav Links
          Row(
            children: [
              _navLink('Home', active: true),
              _navLink('Modules', hasDropdown: true),
              _navLink('Hospitals'),
              _navLink('Paramedics'),
              _navLink('Contact'),
              const SizedBox(width: 20),
              Icon(Icons.search, color: Colors.black54),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryRed,
                  side: BorderSide(color: primaryRed, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: Text('Console Login', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _navLink(String title, {bool active = false, bool hasDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: active ? primaryRed : Colors.black87,
              fontWeight: active ? FontWeight.bold : FontWeight.w500,
              fontSize: 15,
            ),
          ),
          if (hasDropdown) ...[
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 16, color: active ? primaryRed : Colors.black87),
          ]
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 550,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/hero_ambulance.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.6), // Dark overlay
        padding: const EdgeInsets.only(left: 60, right: 60, top: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(width: 30, height: 2, color: primaryRed),
                const SizedBox(width: 10),
                Text('ZERO-DELAY COORDINATION', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Zero Delay,\nSeamless Care.',
              style: GoogleFonts.inter(color: Colors.white, fontSize: 64, fontWeight: FontWeight.w900, height: 1.1),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 500,
              child: Text(
                'AI-powered accident detection, blockchain medical retrieval, and intelligent hospital routing to protect the Golden Hour.',
                style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontSize: 18, height: 1.5),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryRed,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text('Discover Our Modules', style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBoxes() {
    return Transform.translate(
      offset: const Offset(0, -40),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          children: [
            Expanded(child: _infoBox('Eye Module', '+ Detection Active', const Color(0xFFF39626), Icons.camera_alt)),
            Expanded(child: _infoBox('Brain Module', '+ Medical Profile retrieved', const Color(0xFF32C62C), Icons.psychology)),
            Expanded(child: _infoBox('Path Module', '+ Green Corridor Ready', const Color(0xFF0D55D5), Icons.route)),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String title, String subtitle, Color color, IconData icon) {
    return Container(
      height: 90,
      color: color,
      margin: const EdgeInsets.only(right: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              Text(subtitle, style: GoogleFonts.inter(color: Colors.white.withOpacity(0.9), fontSize: 13)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Image
          Expanded(
            flex: 5,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=2070', // Hospital/Medical image
                    height: 500,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: -40,
                  bottom: 80,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: Offset(0, 10))
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.verified, color: primaryRed, size: 40),
                          const SizedBox(height: 8),
                          Text('1M+', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w900, color: darkGradient)),
                          Text('Lives Saved', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 100),
          // Right Content
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WHO WE ARE', style: GoogleFonts.inter(color: primaryRed, fontWeight: FontWeight.bold, letterSpacing: 2)),
                const SizedBox(height: 16),
                Text(
                  'Excellence in Emergency Medical Automation',
                  style: GoogleFonts.inter(fontSize: 42, fontWeight: FontWeight.w800, color: darkGradient, height: 1.2),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 24,
                  runSpacing: 16,
                  children: [
                    _tabButton('OUR MISSION', active: true),
                    _tabButton('OUR VISION'),
                    _tabButton('OUR TECH'),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'LifeLink prides ourselves on delivering automation where it matters most. Our CDSS (Clinical Decision Support System) removes human lag from emergency response, guaranteeing optimal care within the Critical Golden Hour.',
                  style: GoogleFonts.inter(color: Colors.black54, fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _checkItem('100% Automated Workflow'),
                          const SizedBox(height: 16),
                          _checkItem('Blockchain Secure Profiles'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _checkItem('YOLOv8 AI Detection'),
                          const SizedBox(height: 16),
                          _checkItem('IoT Traffic Control'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tabButton(String title, {bool active = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: active ? primaryRed : Colors.white,
        border: active ? null : Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _checkItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, color: primaryRed, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(text, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: darkGradient, fontSize: 15)),
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    final activeModule = _modules[_activeModuleIndex];
    return Container(
      color: const Color(0xFFF9F9F9),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        children: [
          Text('OUR SYSTEM', style: GoogleFonts.inter(color: primaryRed, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 16),
          Text(
            'Expert Automated Modules',
            style: GoogleFonts.inter(fontSize: 42, fontWeight: FontWeight.w800, color: darkGradient),
          ),
          const SizedBox(height: 60),
          // Services Tabs Header
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))
              ]
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: List.generate(_modules.length, (index) {
                return _serviceTab(_modules[index]['title'].toString().split(':')[0], index);
              }),
            ),
          ),
          const SizedBox(height: 40),
          // Active Service Content
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(activeModule['title'], style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold, color: darkGradient)),
                      const SizedBox(height: 20),
                      Text(
                        activeModule['desc'],
                        style: GoogleFonts.inter(color: Colors.black54, fontSize: 16, height: 1.6),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                _checkItem(activeModule['f1']),
                                const SizedBox(height: 16),
                                _checkItem(activeModule['f3']),
                              ]
                            )
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                _checkItem(activeModule['f2']),
                                const SizedBox(height: 16),
                                _checkItem(activeModule['f4']),
                              ]
                            )
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryRed,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        ),
                        child: Text('View Docs', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      activeModule['img'], // Display corresponding module image
                      height: 350,
                      fit: BoxFit.cover,
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

  Widget _serviceTab(String title, int index) {
    bool active = _activeModuleIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _activeModuleIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        decoration: BoxDecoration(
          color: active ? primaryRed : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            color: active ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      color: primaryRed,
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statItem('500K+', 'Incidents Detected'),
          _statItem('50+', 'Cities Mapped'),
          _statItem('3s', 'To Dispatch Time'),
          _statItem('100%', 'Blockchain Auditable'),
        ],
      ),
    );
  }

  Widget _statItem(String number, String label) {
    return Column(
      children: [
        Text(number, style: GoogleFonts.inter(color: Colors.white, fontSize: 56, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(label, style: GoogleFonts.inter(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      color: darkGradient,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.health_and_safety, color: primaryRed, size: 36),
                        const SizedBox(width: 8),
                        Text('LifeLink', style: GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'The fastest & most intelligent AI response coordination system preventing loss of life during the Golden Hour.',
                      style: GoogleFonts.inter(color: Colors.white70, fontSize: 16, height: 1.6),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _footerColumn('Explore', ['Home', 'Eye Module', 'Brain Module', 'Path Module', 'Dashboard']),
              const SizedBox(width: 60),
              _footerColumn('Contact', ['Emergency: 911 / 108', 'Email: tech@lifelink.ai', 'Location: Innovation City']),
            ],
          ),
          const SizedBox(height: 60),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          Center(
            child: Text('© 2026 LifeLink Technologies. All rights reserved.', style: GoogleFonts.inter(color: Colors.white54)),
          )
        ],
      ),
    );
  }

  Widget _footerColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.inter(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(link, style: GoogleFonts.inter(color: Colors.white70, fontSize: 15)),
        )),
      ],
    );
  }
}
