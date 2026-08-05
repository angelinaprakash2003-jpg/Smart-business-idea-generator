import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              Color(0xFF4A148C), // Purple
              Color(0xFF00BFA5), // Green
              Color(0xFF0A0A0A), // Black
            ],
            stops: [0.0, 0.3, 0.6],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "IdeaGenle",
                          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Smart Business Generator",
                          style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: () {}),
                        Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.purpleAccent, width: 2),
                                color: Colors.grey[800],
                              ),
                              child: const Center(child: Text("AP", style: TextStyle(color: Colors.white))),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                                child: const Text("AP", style: TextStyle(fontSize: 8, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Stack(
                          children: [
                            IconButton(icon: const Icon(Icons.notifications_outlined, color: Colors.white), onPressed: () {}),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                child: const Text("5", style: TextStyle(fontSize: 10, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Hero Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What will you build\ntoday?",
                              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Harness agentic AI to fuse multimodal inputs into innovative ventures.",
                              style: TextStyle(fontSize: 13, color: Colors.grey[400], height: 1.5),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "2026 Trends Integrated • Predicted Shifts",
                              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.settings, size: 40, color: Colors.grey[700]),
                          Transform.translate(
                            offset: const Offset(0, -10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blueAccent, width: 2),
                              ),
                              child: const Icon(Icons.lightbulb, color: Colors.amber, size: 20),
                            ),
                          ),
                          Icon(Icons.cloud, size: 30, color: Colors.grey[700]),
                          Transform.translate(
                            offset: const Offset(10, -10),
                            child: Icon(Icons.cloud, size: 25, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Generation Modes
                Text(
                  "Generation Modes",
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16),

                // Grid of 4 cards
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: [
                    _buildModeCard(
                      iconBg: const Color(0xFFD1C4E9),
                      icon: Icons.text_fields,
                      iconColor: Colors.black,
                      title: "Text\nBrainstorm",
                      subtitle: "Refine startup concepts with rich contextual prompts",
                      buttons: [
                        _buildButton("Open", Icons.arrow_forward, true),
                      ],
                    ),
                    _buildModeCard(
                      iconBg: Colors.pinkAccent,
                      icon: Icons.camera_alt,
                      iconColor: Colors.white,
                      title: "Image to Idea",
                      subtitle: "Turn sketches or products into detailed business models",
                      buttons: [
                        _buildButton("Open", null, false),
                        _buildButton("History", null, false),
                      ],
                    ),
                    _buildModeCard(
                      iconBg: Colors.blueAccent,
                      icon: Icons.mic,
                      iconColor: Colors.white,
                      title: "Voice to Idea",
                      subtitle: "",
                      buttons: [],
                    ),
                    _buildModeCard(
                      iconBg: Colors.amber,
                      icon: Icons.trending_up,
                      iconColor: Colors.black,
                      title: "Trend\nIdeas",
                      subtitle: "",
                      buttons: [],
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          const BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outline), label: "My Ideas"),
          const BottomNavigationBarItem(icon: Icon(Icons.handshake), label: "Collaborate"),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.person_outline),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Color(0xFFD1C4E9), shape: BoxShape.circle),
                    child: const Text("AP", style: TextStyle(fontSize: 6, color: Colors.black)),
                  ),
                ),
              ],
            ),
            label: "Profile",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  Widget _buildModeCard({
    required Color iconBg,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required List<Widget> buttons,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(height: 12),
          Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          Expanded(child: Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[400]))),
          if (buttons.isNotEmpty)...[
            const SizedBox(height: 8),
            Row(children: buttons),
          ],
        ],
      ),
    );
  }

  Widget _buildButton(String text, IconData? icon, bool isPrimary) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 6),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isPrimary? Colors.white.withOpacity(0.1) : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon!= null)...[Icon(icon, size: 14, color: const Color(0xFFD1C4E9)), const SizedBox(width: 4)],
            Text(text, style: TextStyle(color: isPrimary? const Color(0xFFD1C4E9) : Colors.white, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
