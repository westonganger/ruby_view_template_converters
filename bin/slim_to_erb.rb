#!/usr/env/ruby

require 'htmlbeautifier'

### CONVERT SLIM TO ERB

if !system("command -v html2haml") || !system("command -v haml2slim")
  puts "Error: Missing dependencies!\n"
  puts "To fix, please run the following dependency installation command:"
  puts "gem install htmlbeautifier --no-document"
  exit
end

puts "Would you like to replace the original files? (Y/n)"
replace = STDIN.gets.downcase.strip

matching_files = []

ARGV.each do |path|
  matching_files.concat(`find #{path} -name '*.slim'`.split("\n"))
end

if matching_files.empty?
  puts "No matching files found"
  exit
end

matching_files.each do |slim_file|
  erb_file = slim_file.sub('slim', 'erb')

  content = `slimrb --erb #{slim_file}`

  content = HtmlBeautifier.beautify(content)

  bad_str = "::Temple::Utils.escape_html"

  lines = content.lines.map do |line|
    if line.strip.empty?
      next nil
    end

    if line.include?(bad_str)
      line = line.gsub("<% #{bad_str}((", "<% ").gsub("<%= #{bad_str}((", "<%= ").gsub(")) %>", " %>")
    end

    next line
  end

  content = lines.compact.join("\n")

  content.gsub!("end; ", "end %>\n<% ")

  content.gsub!("\n\n", "\n")

  content.gsub!(/%>\n\ *<\//, "%></")

  File.open(erb_file, "wb") do |f|
    f.write content
  end

  if replace == "y"
    `rm #{slim_file}`
  end
end

puts "Convert Success!"
