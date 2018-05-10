#!/usr/bin/env ruby
# encoding: UTF-8

$LOAD_PATH.unshift(
	File.join(
		File.dirname(__FILE__)
		)
)

require "binary_loader"
require "csv_serializer"
require "creature"

bin = BinaryLoader.new '../bin/pack'
csv = CSVSerializer.new '../bin/myCsv'
creatures = bin.lire_fichier
puts creatures
csv.ecrire_fichier creatures
