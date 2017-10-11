#!/usr/bin/env ruby -wU
# encoding: utf-8


@this_dir = Dir.pwd
`rm -rf "#{@this_dir}/../min-devkit-deploy"`
`mkdir "#{@this_dir}/../min-devkit-deploy"`
Dir.chdir("#{@this_dir}/../min-devkit-deploy")
@temp_dir = Dir.pwd
Dir.chdir @this_dir



@git_rev = `git log --oneline -1`[0..6]
@git_tag = `git describe --abbrev=0 --tags`
puts "REV: #{@git_rev}   TAG: #{@git_tag}"
puts



@url_mac = "https://s3-us-west-2.amazonaws.com/cycling74-ci/min-devkit/min-devkit-mac-#{@git_rev}-release.zip"
@url_win32 = "https://s3-us-west-2.amazonaws.com/cycling74-ci/min-devkit/min-devkit-win-x86-#{@git_rev}-Release.zip"
@url_win64 = "https://s3-us-west-2.amazonaws.com/cycling74-ci/min-devkit/min-devkit-win-x64-#{@git_rev}-Release.zip"




`cd #{@temp_dir} && git clone git@github.com:Cycling74/min-devkit.git --recurse-submodules --separate-git-dir=gitdir Min-DevKit && git checkout #{@git_rev} && git submodule update --recursive`
#  --depth 1 only works if we want the tip, not the specified commit like we want here
# using --shallow-submodules above seems to cause some problems

puts

puts @url_mac
`curl #{@url_mac} -o #{@temp_dir}/mac.zip`
`unzip #{@temp_dir}/mac.zip -d #{@temp_dir}/mac`
puts


# brew update
# brew install p7zip
# 7z a heed.7z sputnik
# 7z x heed.7z
#
# also, curl seems to corrupt the zips from Appveyor (but Travis is okay)
# brew install wget


`mkdir #{@temp_dir}/win32`
`cd #{@temp_dir}/win32 && wget #{@url_win32} && 7z x *.zip`

`mkdir #{@temp_dir}/win64`
`cd #{@temp_dir}/win64 && wget #{@url_win64} && 7z x *.zip`


`cp -r #{@temp_dir}/mac/min-devkit/externals/* #{@temp_dir}/Min-DevKit/externals/`
`cp -r #{@temp_dir}/win32/min-devkit/externals/* #{@temp_dir}/Min-DevKit/externals/`
`cp -r #{@temp_dir}/win64/min-devkit/externals/* #{@temp_dir}/Min-DevKit/externals/`


# copy CMake
# assumes that you have copied the folder "CMake" into the script folder for the Windows version
# assumes that you have copied CMake.app into the script folder for the Mac version


`cp -r /script/CMake.app #{@temp_dir}/Min-DevKit/script/`
`cp -r /script/CMake #{@temp_dir}/Min-DevKit/script/`
`mkdir #{@temp_dir}/Min-DevKit/build/`


