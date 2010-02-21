require "oll_core"

class Oll
  attr_reader :oll, :method, :method_s
  def initialize(method)
    @oll = Oll_core::Oll.new
    @method = method
    @methods = {
      "P" => Oll_core::P_s.new,
      "AP" => Oll_core::AP_s.new,
      "PA" => Oll_core::PA_s.new,
      "PA1" => Oll_core::PA1_s.new,
      "PA2" => Oll_core::PA2_s.new,
      "PAK" => Oll_core::PAK_s.new,
      "CW" => Oll_core::CW_s.new,
      "AL" => Oll_core::AL_s.new
    }
    raise "no such method" unless @methods.key?(@method)
    @method_s = @methods[@method] # method structure
  end
  def add(fv, y)
    raise ArgumentError if y != 1 && y != -1
    tmp = Oll_core::FeatureVector.new
    fv.each{|item|
      id, value = item
      tmp.push Oll_core::IntFloatPair.new(id, value)
    }
    @oll.send("trainExample#{method}", @method_s, tmp, y)
  end
  def classify(fv)
    tmp = Oll_core::FeatureVector.new
    fv.each{|item|
      id, value = item
      tmp.push Oll_core::IntFloatPair.new(id, value)
    }
    return @oll.classify(tmp)
  end
  def save(filename)
    @oll.save(filename)
  end
  def load(filename)
    @oll.load(filename)
  end
  def setC(c)
    @oll.setC(c)
  end
end
