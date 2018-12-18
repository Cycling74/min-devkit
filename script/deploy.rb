#!/usr/bin/env ruby -wU
# encoding: utf-8


@this_dir = Dir.pwd
`rm -rf "#{@this_dir}/../min-devkit-deploy"`
`mkdir "#{@this_dir}/../min-devkit-deploy"`
Dir.chdir("#{@this_dir}/../min-devkit-deploy")
@temp_dir = Dir.pwd
@deploy_dir = "#{@temp_dir}/Min-DevKit"
Dir.chdir @this_dir



@git_rev = `git log --oneline -1`[0..6]
@git_tag = `git describe --abbrev=0 --tags`
puts "REV: #{@git_rev}   TAG: #{@git_tag}"
puts



@url_mac = "https://s3-us-west-1.amazonaws.com/cycling74-ci-public/min-devkit/min-devkit-mac-#{@git_rev}-release.zip"
@url_win64 = "https://s3-us-west-1.amazonaws.com/cycling74-ci-public/min-devkit/min-devkit-win-x64-#{@git_rev}-Release.zip"




puts `cd "#{@temp_dir}" && git clone git@github.com:Cycling74/min-devkit.git --recurse-submodules --separate-git-dir=gitdir Min-DevKit && cd Min-DevKit && git checkout #{@git_rev} && git submodule update --recursive`
#  --depth 1 only works if we want the tip, not the specified commit like we want here
# using --shallow-submodules above seems to cause some problems

puts

#puts @url_mac
#`curl #{@url_mac} -o #{@temp_dir}/mac.zip`
#`unzip #{@temp_dir}/mac.zip -d #{@temp_dir}/mac`
#puts


# brew update
# brew install p7zip
# 7z a heed.7z sputnik
# 7z x heed.7z
#
# also, curl seems to corrupt the zips from Appveyor (but Travis is okay)
# brew install wget

`mkdir "#{@temp_dir}"/mac`
`cd "#{@temp_dir}"/mac && wget #{@url_mac} && 7z x *.zip`

`mkdir "#{@temp_dir}"/win64`
`cd "#{@temp_dir}"/win64 && wget #{@url_win64} && 7z x *.zip`


`cp "#{@temp_dir}"/mac/min-devkit/package-info.json "#{@deploy_dir}"/`
`mkdir "#{@deploy_dir}"/externals`
`cp -r "#{@temp_dir}"/mac/min-devkit/externals/* "#{@deploy_dir}"/externals/`
`cp -r "#{@temp_dir}"/win64/min-devkit/externals/* "#{@deploy_dir}"/externals/`

`mkdir "#{@deploy_dir}"/tests`
`cp -r "#{@temp_dir}"/mac/min-devkit/tests/* "#{@deploy_dir}"/tests/`
`cp -r "#{@temp_dir}"/win64/min-devkit/tests/* "#{@deploy_dir}"/tests/`


# copy scripts (including cmake)

`mkdir "#{@deploy_dir}"/build/`


`rm "#{@deploy_dir}"/ReadMe.md`
`mv "#{@deploy_dir}"/ReadMe-Public.md "#{@deploy_dir}"/ReadMe.md`


# Cleanup

`rm "#{@deploy_dir}"/.git`
#`rm #{@deploy_dir}/.gitignore` -- LEAVE THIS IN, REQUIRED BY MIN.PROJECT
`rm "#{@deploy_dir}"/.gitmodules`
`rm "#{@deploy_dir}"/.travis.yml`
`rm "#{@deploy_dir}"/appveyor.yml`
`rm "#{@deploy_dir}"/package-info.json.in`
`rm "#{@deploy_dir}"/script/deploy.rb`

`rm "#{@deploy_dir}"/source/min-api/.git`
`rm "#{@deploy_dir}"/source/min-api/.gitignore`
`rm "#{@deploy_dir}"/source/min-api/.gitmodules`

`rm "#{@deploy_dir}"/source/min-lib/.git`
`rm "#{@deploy_dir}"/source/min-lib/.gitignore`
`rm "#{@deploy_dir}"/source/min-lib/.gitmodules`

`rm "#{@deploy_dir}"/source/min-api/max-api/.git`
`rm "#{@deploy_dir}"/source/min-api/max-api/.gitignore`

`rm -f "#{@deploy_dir}"/source/min-api/test/mock/.git`
`rm -f "#{@deploy_dir}"/source/min-api/test/mock/.gitignore`

`rm "#{@deploy_dir}"/source/min-api/include/readerwriterqueue/.git`
`rm "#{@deploy_dir}"/source/min-api/include/readerwriterqueue/.gitignore`


# Do ship unit tests for the Package Manager release -- min.project requires them!
# 
# Dir.foreach("#{@deploy_dir}/source/min-lib/test/") do |item|
#   next if item == '.' or item == '..' or item == 'min-lib-unittest.cmake'
#   `rm -rf #{@deploy_dir}/source/min-lib/test/#{item}`
# end
# 
# Dir.foreach("#{@deploy_dir}/source/min-api/test/") do |item|
#   next if item == '.' or item == '..' or item == 'min-api-unittest.cmake' or item == 'min-object-unittest.cmake' or item == 'catch' or item == 'mock'
#   `rm -rf #{@deploy_dir}/source/min-api/test/#{item}`
# end
# 

