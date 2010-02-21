#!/usr/bin/env ruby
require 'pp'
require "test/unit"
$LOAD_PATH.unshift("./lib", "./ext")
require 'oll'

class TC_Oll < Test::Unit::TestCase
  def setup
    @oll = Oll.new("CW")
    @oll.add([[0, 1.0], [201, 2.2], [744, -0.3], [15, 3.0]], 1)
    @oll.add([[47, 2.0], [66, 0.1], [733, 1.0], [500, 1.0]], -1)
    @oll.add([[3, 1.0], [201, 2.2], [300, -0.3], [15, 0.35]], 1)
    @oll.add([[4, 2.0], [103, 2.2], [405, -0.3], [11, 1.5]], 1)
  end
  def test_initialize
    assert_nothing_raised { Oll.new("P") }
    assert_nothing_raised { Oll.new("AP") }
    assert_nothing_raised { Oll.new("PA") }
    assert_nothing_raised { Oll.new("PA1") }
    assert_nothing_raised { Oll.new("PA2") }
    assert_nothing_raised { Oll.new("PAK") }
    assert_nothing_raised { Oll.new("CW") }
    assert_nothing_raised { Oll.new("AL") }

    assert_raise(RuntimeError) { Oll.new("no sucu method") }
  end
  def test_add
    assert_raise(ArgumentError) { @oll.add([[1.5, 1.0]], 1) }
    assert_raise(ArgumentError) { @oll.add([[-1.5, 1.0]], 1) }
    assert_raise(ArgumentError) { @oll.add([[10, 1.0]], 3) }
    assert_raise(ArgumentError) { @oll.add([[10, 1.0]], 0) }
    assert_raise(ArgumentError) { @oll.add([[10, 1.0]], -3) }
  end
  def test_classify
    assert(@oll.classify([[0, 3], [3, 3], [4, 3]]) > 0)
    assert(@oll.classify([[47, 3], [66, 3], [500, 3]]) < 0)
    assert(@oll.classify([[1000, 3]]) == 0)
  end
  def test_save_and_load
    filename = "tmp.model"
    assert_nothing_raised { @oll.save(filename) }
    assert(File.exist?(filename))
    assert_nothing_raised { @oll.load(filename) }
    File::delete(filename)
  end
end
