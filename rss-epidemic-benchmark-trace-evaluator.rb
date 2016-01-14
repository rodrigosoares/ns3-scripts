# This script evaluates trace files generated by the NS-3 simulator, result of
# the function EnableAsciiAll of a YansWifiPhyHelper object. It reads the trace
# file and looks for lines of interest starting with "r" (receive) and
# containing the keyword "Payload", which indicates an Epidemic transmission.
# This script was implemented using Ruby in version 2.2.1.

class Packet < Struct.new(:id, :src_ip, :dst_ip, :delivered_at)
  def initialize(id, src, dst, delivered_at = '')
    id = id
    src_ip = src_ip
    dst_ip = dst_ip
    delivered_at = delivered_at
    super
  end
end

class TraceEvaluator
  TRACE_INFO_REGEX = /r\s(?<timestamp>\d+.?\d*).*DA=00:00:00:00:00:(?<dst>\w\w),\sSA=00:00:00:00:00:(?<src>\w\w).*1068\s(?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s>\s(?<dst_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*Packet\sID:\s(?<packet_id>\d{8})\sHop\scount:\s(?<hop_count>\d{1,2})/
  LAST_OCTET_REGEX = /.*\.(?<last_octet>\d{1,3})/

  def initialize(path)
    @path = path
    @nodes = []
    @packets = []
  end

  def main
    if @path.nil?
      puts 'ERROR: No trace file was specified.'
    else
      check_file @path
      show_infos
    end
  end

  private

  def check_file(path)
    if File.exist? path
      process_file path
    else
      puts 'ERROR: File not found.'
    end
  end

  def process_file(path)
    File.open(path) do |trace_file|
      trace_file.each do |line|
        extract_info_from line if valid_for_evaluation?(line)
      end
    end
  end

  def valid_for_evaluation?(string_line)
    string_line[0] == 'r' && string_line.include?('Payload')
  end

  def extract_info_from(trace_line)
    trace_info = trace_line.match TRACE_INFO_REGEX
    packet = Packet.new trace_info[:packet_id], trace_info[:src_ip], trace_info[:dst_ip]
    update_packet_list_with packet, trace_info[:dst], trace_info[:timestamp]
  end

  def update_packet_list_with(packet, dst_mac, timestamp)
    current_dst_node_id = dst_mac.to_i 16
    packet_dst_node_id = packet.dst_ip.match(LAST_OCTET_REGEX)[:last_octet].to_i
    packet.delivered_at = timestamp if current_dst_node_id == packet_dst_node_id
    add_to_the_list packet
  end

  def add_to_the_list(new_packet)
    index = @packets.index { |packet| packet.id == new_packet.id }
    if index.nil?
      @packets << new_packet
    else
      update_packet_delivering_time index, new_packet.delivered_at
    end
  end

  def update_packet_delivering_time(index, delivered_at)
    if @packets[index].delivered_at.empty? && !delivered_at.empty?
      @packets[index].delivered_at = delivered_at
    end
  end

  def show_infos
    @packets.each { |p| puts p.to_s }
    puts "Number of packets: #{@packets.size}"
  end
end

TraceEvaluator.new(ARGV.first).main
