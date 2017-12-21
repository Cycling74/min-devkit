#!/usr/bin/env ruby -wU
# encoding: utf-8


@this_dir = Dir.pwd
`rm -rf "#{@this_dir}/../min-devkit-doc"`
`git clone https://github.com/Cycling74/min-devkit.git "#{@this_dir}/../min-devkit-doc" --branch gh-pages`
Dir.chdir("#{@this_dir}/../min-devkit-doc")
@temp_dir = Dir.pwd
Dir.chdir @this_dir


`rm #{@temp_dir}/_guides/*`
`cp #{@this_dir}/source/min-api/doc/Guide*.md #{@temp_dir}/_guides`

Dir.foreach("#{@temp_dir}/_guides") do |doc|
  next if doc == '.' or doc == '..'
  title = doc[/GuideTo(.*)\.md/,1]

  str = "---\n";
  str += "title: " + title + "\n";
  str += "permalink: /guide/" + title.downcase + "\n";
  str += "layout: guide\n";
  str += "---\n";
    
  f = File.open("#{@temp_dir}/_guides/#{doc}", "r+")
  str += f.read
  f.rewind
  f.write(str)
  f.truncate(f.pos)
  f.close
end

`mv #{@temp_dir}/_guides/GuideToWritingObjects.md #{@temp_dir}/_guides/1.GuideToWritingObjects.md`



`rm #{@temp_dir}/_api/*`
`cp #{@this_dir}/source/min-api/doc/API*.md #{@temp_dir}/_api`

Dir.foreach("#{@temp_dir}/_api") do |doc|
  next if doc == '.' or doc == '..'
  title = doc[/API-(.*)\.md/,1]

  str = "---\n";
  str += "title: " + title + "\n";
  str += "permalink: /api/" + title.downcase + "\n";
  str += "layout: api\n";
  str += "---\n";
    
  f = File.open("#{@temp_dir}/_api/#{doc}", "r+")
  str += f.read
  f.rewind
  f.write(str)
  f.truncate(f.pos)
  f.close
end


Dir.chdir @temp_dir
`git add .`
`git commit -m"doc update performed by doc.rb script."`
`git push origin HEAD`
