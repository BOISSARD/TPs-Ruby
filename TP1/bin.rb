require_relative 'creature'
require_relative 'gobelin'
require_relative 'compagnie'
require_relative 'troll'
require_relative 'fabrique'

comp = Compagnie.new

puts comp.compagnie

grok = Troll.new("Grok",24)
gruk = Troll.new("Gruk",27)
zak = Gobelin.new("Zak",12)
zog = Gobelin.new("Zog",13)

comp.ajout gruk
comp.ajout grok
comp.ajout zak
comp.ajout zog

puts "\nAvant l'exploration :\n---------------------"
puts comp.compagnie

comp.exploration

puts "\nLecture du fichier :\n--------------------"
comp2 = Fabrique.lireFichier("source.txt")
puts comp2.compagnie
