require 'time'
require 'shellwords'

def bash(command)
  escaped_command = Shellwords.escape(command)
  system "bash -c #{escaped_command}"
end

timestamp = File.mtime(ARGV.first)
content = File.readlines(ARGV.first)
title = content.first.gsub('#', '').strip
content = content[1..-1].join
front_matter = "---\nlayout: post\ntitle: #{title}\ndate: #{timestamp}\n---\n\n"
new_file_name = "#{timestamp.to_date}-#{title.downcase.gsub(/[\s.]/, '-').gsub(/[^\w-]/, '')}"
new_file_path = "#{ARGV.last}/_posts/#{new_file_name}.md"
File.open(new_file_path, 'wb') do |f|
  f.puts front_matter
  f.puts content
end
File.open('blog_post_title', 'wb') do |f|
  f.puts title
end

puts 'Starting up blog in local. Please wait while server starts'
