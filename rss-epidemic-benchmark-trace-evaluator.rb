@path = ARGV.first

def evaluate(string_line)
  puts string_line
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
