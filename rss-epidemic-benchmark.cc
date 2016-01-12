/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2013 Mohammed J.F. Alenazi
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: Mohammed J.F. Alenazi  <malenazi@ittc.ku.edu>
 *
 * James P.G. Sterbenz <jpgs@ittc.ku.edu>, director
 * ResiliNets Research Group  http://wiki.ittc.ku.edu/resilinets
 * Information and Telecommunication Technology Center (ITTC)
 * and Department of Electrical Engineering and Computer Science
 * The University of Kansas Lawrence, KS USA.
 *
 * Work supported by King Saud University and
 * the ITTC at The University of Kansas.
 */

#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/applications-module.h"
#include "ns3/mobility-module.h"
#include "ns3/wifi-module.h"
#include "ns3/internet-module.h"
#include <iostream>
#include <sstream>
#include "ns3/epidemic-helper.h"

using namespace ns3;

/**
 \file
 \ingroup epidemic
This example creates the scenarios presented the paper titled 'Epidemic Routing
for Partially-Connected Ad Hoc Networks.'

We have 50 nodes in an area of 1500 m x 300 m.
45 nodes are selected to send a message of size 1KB to the other 44 nodes.
The total messages are 45 * 44 = 1980 messages. The buffer size is 2000 which
is infinite in these scenarios. The ranges for the transmission are from
10 m to 250 m while the default is set to 50 m. The expected results are shown
in the paper Mohammed Alenazi, Yufei Cheng, Dongsheng Zhang, and James Sterbenz,
"Epidemic Routing Protocol Implementation in ns-3", WNS32015.
*/


int main (int argc, char *argv[]) {
  // General parameters
  uint32_t nWifis = 15;
  uint32_t nSrcSnk = 10;
  NodeContainer nodeContainer;
  NetDeviceContainer devices;
  double txpDistance = 100.0;
  double nodeSpeed = 20.0;
  bool appLogging = true;

  // Application parameters
  double TotalTime = 3600.0;
  double dataStart = 10.0;
  double dataEnd = 14.0;
  uint32_t packetSize = 1024;

  // Epidemic routing parameters
  uint32_t hopCount = 10;
  uint32_t queueLength = 2000;
  Time queueEntryExpireTime = Seconds (3000);
  Time beaconInterval = Seconds (5);

  // Set seed for random mobility.
  RngSeedManager::SetSeed(1);
  RngSeedManager::SetRun(1);

  CommandLine cmd;
  cmd.Usage ("Benchmark example shows epidemic routing scenario presented "
             "in the original paper.  There are 50 nodes in an area of 1500 m x 300 m."
             " 45 nodes are selected to send a message of size 1KB to the other "
             "44 nodes. The total messages are 45 * 44 = 1980 messages.  The buffer "
             "size is 2000 which is infinite in these scenarios.  The ranges for "
             "the transmission are from 10 m to 250 m while the default is set to "
             "50 m.\n");
  cmd.AddValue ("nWifis", "Number of \"extra\" Wifi nodes/devices", nWifis);
  cmd.AddValue ("nSrcSnk", "Number of source and sink nodes/devices", nSrcSnk);
  cmd.AddValue ("appLogging", "Tell echo applications to log if true", appLogging);
  cmd.AddValue ("nodeSpeed", "Node speed in RandomWayPoint model", nodeSpeed);
  cmd.AddValue ("packetSize", "The packet size", packetSize);
  cmd.AddValue ("txpDistance", "Specify node's transmit range", txpDistance);
  cmd.AddValue ("hopCount", "Specify number of hopCount", hopCount);
  cmd.AddValue ("queueLength", "Specify queue Length", queueLength);
  cmd.AddValue ("queueEntryExpireTime", "Specify queue Entry Expire Time",
                queueEntryExpireTime);
  cmd.AddValue ("beaconInterval", "Specify beaconInterval", beaconInterval);
  cmd.AddValue ("TotalTime", "Total simulated time", TotalTime);
  cmd.Parse (argc, argv);

  std::cout << "Number of wifi nodes: " << nWifis << std::endl;
  std::cout << "Number of source and sink nodes: " << nSrcSnk << std::endl;
  std::cout << "Node speed: " << nodeSpeed << " m/s" << std::endl;
  std::cout << "Packet size: " << packetSize << " b" << std::endl;
  std::cout << "Transmission distance: " << txpDistance << " m" << std::endl;
  std::cout << "Hop count: " << hopCount << std::endl;
  std::cout << "Queue length: " << queueLength << " packets" << std::endl;
  std::cout << "Queue entry expire time: " << queueEntryExpireTime.GetSeconds () << " s" << std::endl;
  std::cout << "Beacon interval: " << beaconInterval.GetSeconds () << " s" << std::endl;
  std::cout << "Total simulated time: " << TotalTime << " s" << std::endl;

  // Enabling OnOffApplication and PacketSink logging
  if (appLogging) {
    LogComponentEnable ("OnOffApplication", LOG_LEVEL_INFO);
    LogComponentEnable ("PacketSink", LOG_LEVEL_INFO);
    LogComponentEnableAll (LOG_PREFIX_TIME);
    LogComponentEnableAll (LOG_PREFIX_NODE);
    LogComponentEnableAll (LOG_PREFIX_FUNC);
  }

  nodeContainer.Create (nWifis);

  // Mobility model Setup
  // The parameters for mobility model matches the epidemic routing paper.
  MobilityHelper mobility;
  ObjectFactory pos;
  mobility.SetPositionAllocator ("ns3::RandomRectanglePositionAllocator",
                                 "X", StringValue ("ns3::UniformRandomVariable[Min=0.0|Max=300.0]"),
                                 "Y", StringValue ("ns3::UniformRandomVariable[Min=0.0|Max=1500.0]"));

  mobility.SetMobilityModel ("ns3::SteadyStateRandomWaypointMobilityModel",
                             "MinSpeed", DoubleValue (0.01),
                             "MaxSpeed", DoubleValue (nodeSpeed),
                             "MinX", DoubleValue (0.0),
                             "MaxX", DoubleValue (300.0),
                             "MinPause", DoubleValue (10),
                             "MaxPause", DoubleValue (20),
                             "MinY", DoubleValue (0.0),
                             "MaxY", DoubleValue (1500.0)
                             );
  mobility.Install (nodeContainer);

  // Physical and Link Layers Setup
  NqosWifiMacHelper wifiMac = NqosWifiMacHelper::Default ();
  wifiMac.SetType ("ns3::AdhocWifiMac");
  YansWifiPhyHelper wifiPhy = YansWifiPhyHelper::Default ();
  YansWifiChannelHelper wifiChannel = YansWifiChannelHelper::Default ();
  wifiChannel.AddPropagationLoss ("ns3::RangePropagationLossModel",
                                  "MaxRange", DoubleValue (txpDistance));
  wifiPhy.SetChannel (wifiChannel.Create ());
  WifiHelper wifi = WifiHelper::Default ();
  wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
                                "DataMode", StringValue ("OfdmRate6Mbps"),
                                "RtsCtsThreshold", UintegerValue (0));
  devices = wifi.Install (wifiPhy, wifiMac, nodeContainer);

  // Epidemic Routing Setup
  EpidemicHelper epidemic;
  epidemic.Set ("HopCount", UintegerValue (hopCount));
  epidemic.Set ("QueueLength", UintegerValue (queueLength));
  epidemic.Set ("QueueEntryExpireTime", TimeValue (queueEntryExpireTime));
  epidemic.Set ("BeaconInterval", TimeValue (beaconInterval));

  // Internet Stack Setup
  Ipv4ListRoutingHelper list;
  InternetStackHelper internet;
  internet.SetRoutingHelper (epidemic);
  internet.Install (nodeContainer);
  Ipv4AddressHelper ipv4;
  ipv4.SetBase ("10.1.1.0", "255.255.255.0");
  Ipv4InterfaceContainer interfaces = ipv4.Assign (devices);

  // Application Setup
  // Sink or server setup
  for (uint32_t i = 0; i < nSrcSnk; ++i) {
    PacketSinkHelper sink ("ns3::UdpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), 80));
    ApplicationContainer apps_sink = sink.Install (nodeContainer.Get (i));
    apps_sink.Start (Seconds (0.0));
    apps_sink.Stop (Seconds (TotalTime));
  }

  // Client setup
  for (uint32_t source = 0; source < nSrcSnk; ++source) {
    for (uint32_t sink = 0; sink < nSrcSnk; ++sink) {
      if (sink != source) {
        OnOffHelper onoff1 ("ns3::UdpSocketFactory", Address (InetSocketAddress (interfaces.GetAddress (sink), 80)));
        onoff1.SetConstantRate (DataRate ("1024B/s"));
        onoff1.SetAttribute ("PacketSize", UintegerValue (packetSize));
        ApplicationContainer apps1 = onoff1.Install (nodeContainer.Get (source));
        apps1.Start (Seconds (dataStart));
        apps1.Stop (Seconds (dataEnd));
      }
    }
  }

  // Trace file setup
  uint32_t run = RngSeedManager::GetRun();
  std::string fileName;
  std::stringstream sstm;
  sstm << "rss-benchmark-range-" << txpDistance << "-hops-" << hopCount << "-buffer-" << queueLength << "-run-" << run << ".trace";
  fileName = sstm.str();
  AsciiTraceHelper ascii;
  wifiPhy.EnableAsciiAll(ascii.CreateFileStream(fileName));

  Simulator::Stop (Seconds (TotalTime));
  Simulator::Run ();
  Simulator::Destroy ();
  return 0;
}
