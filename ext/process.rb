#!/usr/bin/ruby

def processfile(file)
  File.readlines(file + '.tex').each do |l|
    process(l)
  end
end

def process(line)
  case line
  when /(.*)\\input\{([^{}]+)\}(.*)/
    first = $1
    last = $3
    print first
    processfile($2)
    print last
  else
    puts line
  end
end

ARGF.each do |line|
  process(line)
end

