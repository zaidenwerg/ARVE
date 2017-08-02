# -*- mode: ruby -*-
# # vi: set ft=ruby :
# Author: Uri Zaidenwerg


# Require YAML module
require 'yaml'
require 'set'

# Read YAML file with box details
groups = YAML.load_file('test.yml')
nodeset = Set.new []

groups.each do |group,objects|
  puts group
  puts "-------"
  objects.each do |object, nodes|
    puts "group " + object
    if object == "hosts"
      nodes.each do |node,vars|
        unless nodeset.include?(node)
          nodeset.add(node)
          puts "hostname: " + node
          puts "box: " + vars["box"].to_s
          puts "ram: " + vars["ram"].to_s
          puts "cpu: " + vars["cpu"].to_s
          puts "ip: " + vars["ip"].to_s
          puts "\n"
        end
      end
    elsif object == "vars"
      nodes.each do |node,vars|
      puts node + ": " + vars
      puts "\n"
      end
    end
  end
  puts "\n"
end
nodeset.each do |nick|
puts nick
end
