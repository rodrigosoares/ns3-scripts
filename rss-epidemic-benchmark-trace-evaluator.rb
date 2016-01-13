TRACE_INFO_REGEX = /r\s(?<timestamp>\d+.?\d*).*DA=00:00:00:00:00:(?<dst>\d\d),\sSA=00:00:00:00:00:(?<src>\d\d).*1068\s(?<src_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s>\s(?<dst_ip>\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*Packet\sID:\s(?<packet_id>\d{8})\sHop\scount:\s(?<hop_count>\d{1,2})/

@path = ARGV.first

def evaluate(trace_line)
  trace_info = trace_line.match TRACE_INFO_REGEX
  puts "timestamp: #{trace_info[:timestamp]}, packet: #{trace_info[:packet_id]}, src: #{trace_info[:src]}, dst: #{trace_info[:dst]}, hops: #{trace_info[:hop_count]}, src ip: #{trace_info[:src_ip]}, dst ip: #{trace_info[:dst_ip]}"
end

def valid_for_evaluation?(string_line)
  string_line[0] == 'r' && string_line.include?('Payload')
end

def process_file(path)
  File.open(path) do |trace_file|
    trace_file.each do |line|
      evaluate line if valid_for_evaluation?(line)
    end
  end
end

def check_file(path)
  if File.exist? path
    process_file path
  else
    puts 'ERROR: File not found.'
  end
end

def main
  if @path.nil?
    puts 'ERROR: No trace file was specified.'
  else
    check_file @path
  end
end

main
