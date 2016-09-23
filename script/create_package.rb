#!/usr/bin/env ruby -wU
# encoding: utf-8


# 0. Check args
if (ARGV.length < 1)
  puts "create_package.rb -- usage:"
  puts "  required argument:    <path for new package>"
  puts ""
  puts "example:"
  puts "  script/create_package.rb \"~/Documents/Max 7/Packages/my_new_package\""
  puts ""
  exit
end



# 1. Find our current directory
if $0.downcase != "create_package.rb".downcase
  script_dir = `pwd`.chomp + "/" + $0.gsub(/((\/|\\)create_package).*$/i, "")
else
  script_dir = "."
end

olddir = Dir.getwd
Dir.chdir "#{script_dir}/.."        # change to libdir so that requires work
source_dir = `pwd`.chomp
Dir.chdir olddir



target_dir = ARGV[0]

require 'fileutils'
FileUtils::mkdir_p "#{target_dir}"
olddir = Dir.getwd
Dir.chdir "#{target_dir}"        # change to libdir so that requires work
target_dir = `pwd`.chomp
package_name = File.basename(target_dir)
Dir.chdir olddir



puts ""
puts "    CREATING PACKAGE #{package_name}"
puts ""
puts "    SOURCE DIR: #{source_dir}"
puts "    TARGET DIR: #{target_dir}"
puts ""



# 3. Copy everything we want, nothing we don't
# (how do we handle Git submodules -- I guess don't copy them?  What about zip downloads?)

hello_world = "#{package_name}.hello-world"

FileUtils::mkdir_p "#{target_dir}/build"
FileUtils::mkdir_p "#{target_dir}/source/projects/#{hello_world}"
FileUtils::mkdir_p "#{target_dir}/help"

FileUtils::cp "#{source_dir}/package-info.json.in", "#{target_dir}/package-info.json.in"
FileUtils::cp "#{source_dir}/ReadMe.md", "#{target_dir}/ReadMe.md"
FileUtils::cp "#{source_dir}/License.md", "#{target_dir}/License.md"
FileUtils::cp "#{source_dir}/icon.png", "#{target_dir}/icon.png"
FileUtils::cp "#{source_dir}/CMakeLists.txt",  "#{target_dir}/CMakeLists.txt"

FileUtils::cp "#{source_dir}/.gitignore", "#{target_dir}/.gitignore"
FileUtils::cp "#{source_dir}/.travis.yml", "#{target_dir}/.travis.yml"
FileUtils::cp "#{source_dir}/appveyor.yml", "#{target_dir}/appveyor.yml"

FileUtils::cp "#{source_dir}/source/projects/min.hello-world/min.hello-world.cpp", "#{target_dir}/source/projects/#{hello_world}/#{hello_world}.cpp"
FileUtils::cp "#{source_dir}/source/projects/min.hello-world/CMakeLists.txt", "#{target_dir}/source/projects/#{hello_world}/CMakeLists.txt"
# TODO: copy unit test source!
FileUtils::cp "#{source_dir}/help/min.hello-world.maxhelp", "#{target_dir}/help/#{hello_world}.maxhelp"

FileUtils::cp "#{source_dir}/HowTo-NewObject.md", "#{target_dir}/HowTo-NewObject.md"


def substitute_strings_in_file(file_path, old_string, new_string)
  f = File.open("#{file_path}", "r+")
  str = f.read
  str.gsub!(/#{old_string}/, new_string)
  f.rewind
  f.write(str)
  f.truncate(f.pos)
  f.close
end


substitute_strings_in_file "#{target_dir}/help/#{hello_world}.maxhelp", "min.hello-world", "#{hello_world}"



Dir.chdir "#{target_dir}"
`git init`
`git submodule add https://github.com/Cycling74/min-api.git source/min-api`
`git commit -m"Min API added as git submodule"`
`git tag v0.0.1`
