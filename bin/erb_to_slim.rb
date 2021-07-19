#!/usr/env/ruby

### CONVERT ERB TO SLIM
### https://coderwall.com/p/bn1akg/erb2slim-convert-erb-to-slim

if !system("command -v html2haml") || !system("command -v haml2slim")
  puts "Error: Missing dependencies!\n"
  puts "To fix, please run the following dependency installation command:"
  echo "gem install html2haml haml2slim --no-document"
  exit
fi

puts "Would you like to replace the original files? (Y/n)"
replace = STDIN.gets.downcase.strip

matching_files = []

ARGV.each do |path|
  matching_files.concat(`find #{path} -name '*.erb'`.split("\n"))
end

if matching_files.empty?
  puts "No matching files found"
  exit
end

matching_files.each do |erb_file|
  slim_file = erb_file.sub('erb', 'slim')

  `html2haml --erb #{erb_file} | haml2slim > $(echo #{erb_file} | sed 's/erb/slim/')`

  content = File.read(slim_file)

  content.gsub!(/\/\ *$/, "") ### Remove trailing "/"

  bad_equals_tags.each do |x|
    content.gsub!(x, x.sub("=", " ="))
  end

  File.open(slim_file, "wb") do |f|
    f.write content
  end

  if replace == "y"
    `rm #{erb_file}`
  end
end

puts "Convert Success!"
