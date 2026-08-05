import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4A148C), // Purple
              Color(0xFF004D40), // Teal
              Color(0xFF0A0A0A), // Black
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Idea Analytics",
                          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          "Impact vs. Feasibility Analysis",
                          style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Innovation Matrix Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      // Header + Filter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Innovation Matrix",
                            style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.check, size: 14, color: Colors.white),
                                    SizedBox(width: 6),
                                    Text("All Domains", style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text("(Filter)", style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Scatter Chart
                      SizedBox(
                        height: 300,
                        child: ScatterChart(
                          ScatterChartData(
                            scatterSpots: [
                              // High Impact - Green
                              ScatterSpot(1, 0.4, color: Colors.greenAccent),
                              ScatterSpot(2, 0.6, color: Colors.greenAccent),
                              ScatterSpot(3, 0.8, color: Colors.greenAccent),
                              // Moonshots - Purple
                              ScatterSpot(5, 0.9, color: Colors.purpleAccent),
                              ScatterSpot(7, 0.75, color: Colors.purpleAccent),
                              // Quick Wins - Red
                              ScatterSpot(5, 0.3, color: Colors.redAccent),
                              ScatterSpot(6, 0.5, color: Colors.redAccent),
                              // Research - Yellow
                              ScatterSpot(3, 0.2, color: Colors.amber),
                              ScatterSpot(4, 0.55, color: Colors.grey),
                            ],
                            minX: 0, maxX: 7,
                            minY: 0, maxY: 1,
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(show: false),
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 30,
                                  getTitlesWidget: (value, meta) {
                                    return Text(value.toStringAsFixed(1), style: TextStyle(color: Colors.grey[400], fontSize: 10));
                                  },
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return Text(value.toInt().toString(), style: TextStyle(color: Colors.grey[400], fontSize: 10));
                                  },
                                ),
                              ),
                              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Quadrant Labels overlay
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("High Impact", style: TextStyle(color: Colors.white.withOpacity(0.7))),
                          Text("Moonshots", style: TextStyle(color: Colors.white.withOpacity(0.7))),
                        ],
                      ),
                      const SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Research", style: TextStyle(color: Colors.white.withOpacity(0.7))),
                          Text("Quick Wins", style: TextStyle(color: Colors.white.withOpacity(0.7))),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Legend
                      _buildLegendItem(Colors.greenAccent, "High Impact", 12),
                      _buildLegendItem(Colors.purpleAccent, "Moonshots", 6),
                      _buildLegendItem(Colors.redAccent, "Quick Wins", 8),
                      _buildLegendItem(Colors.amber, "Research", 4),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Bottom Actions
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildActionButton("Date Range", Icons.calendar_today),
                          ),
                          const SizedBox(width: 10),
                          _buildIconButton(Icons.share),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildActionButton("Generate Report", Icons.description_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Last 30 Days", style: TextStyle(color: Colors.white)),
                                  Icon(Icons.keyboard_arrow_down, color: Colors.grey[400]),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          _buildIconButton(Icons.qr_code_scanner),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD1C4E9),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.visibility_outlined, color: Colors.black),
                                  SizedBox(width: 8),
                                  Text("View Idea Details", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 10),
              Text(label, style: const TextStyle(color: Colors.white)),
            ],
          ),
          Text(count.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.white),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Icon(icon, color: Colors.white),
    );
  }
}
