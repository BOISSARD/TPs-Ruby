#!/usr/bin/env ruby
# encoding: UTF-8

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__),
		'..',
		'lib'
		)
)

require "application"

if ARGV.size != 1
	puts "Utilisation : ruby app.rb [votre adresse ip]."
	exit
end

app = Application.new ARGV[0]
app.run
