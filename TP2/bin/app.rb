#!/usr/bin/env ruby
# encoding: UTF-8

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__),
		'..',
		'lib'
		)
)

CURRENT = "#{Dir.pwd}/#{$LOAD_PATH.first.split("/")[0..-2].push("dict").join("/")}"

require "application"
require "dictionnary"

if ARGV.size == 0
	puts "Utilisation : ruby app.rb dictio1 [dictio2 ...]"
	exit
end

appli = Application.new ARGV
appli.run
