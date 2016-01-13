@path = ARGV.first

def process_file(path)
  puts path
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
