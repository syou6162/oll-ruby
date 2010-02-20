#!/usr/bin/env ruby
require 'pp'

$:.unshift File.join(File.dirname(__FILE__), ".")
require 'oll'

oll = Oll::Oll.new
pa = Oll::PA_s.new
# oll.save("hogehoge.model")
pp oll.methods.sort

File.open("sample.txt", "r"){|file|
  file.each{|line|
    line.chomp!
    array = line.split(" ")
    y = array.shift
    y = y.to_i
    fv = Oll::FeatureVector.new
    array.each{|item|
      id, value = item.split(":")
       fv.push Oll::IntFloatPair.new(id.to_i, value.to_f)
    }
    oll.trainExamplePA(pa, fv, y)
  }
}

test1 = Oll::FeatureVector.new
test1.push Oll::IntFloatPair.new(0, 3)
test1.push Oll::IntFloatPair.new(3, 3)
test1.push Oll::IntFloatPair.new(4, 3)

puts oll.classify(test1)

test2 = Oll::FeatureVector.new
test2.push Oll::IntFloatPair.new(47, 3)
test2.push Oll::IntFloatPair.new(66, 3)
test2.push Oll::IntFloatPair.new(500, 3)

puts oll.classify(test2)
