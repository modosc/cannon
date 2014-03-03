require_relative '../../test_helper'

describe Cannon do
  include Cannon

  describe "when using exponential" do
    it "must work" do
      h = {}
      i = {}
      10000.times do
        j = exponential(1).round
        k = exponential(-1).round
        if h[j].nil?
          h[j] = 1
        else
          h[j] += 1
        end
        if i[k].nil?
          i[k] = 1
        else
          i[k] += 1
        end

      end
      puts "exponential: #{h.sort.to_h.inspect}"
      puts "exponential: #{i.sort.to_h.inspect}"
    end
  end
  # describe "when using linear" do
  #   it "must work" do
  #     h = {}
  #     i = {}
  #     j = {}
  #     (0..10).to_a.each do |k|
  #       h[k] = 0
  #       i[k] = 0
  #       j[k] = 0
  #     end
  #     10000.times do
  #       h[linear(10,0.5).ceil] += 1
  #       i[linear(10,-0.5).ceil] += 1
  #       j[linear(10, 0).ceil] += 1
  #     end
  #     puts "linear: #{h.inspect}"
  #     puts "linear: #{i.inspect}"
  #     puts "linear: #{j.inspect}"
  #   end
  # end
  # describe "when using permut" do
  #   it "must work" do
  #     lensmb = (0..10).to_a
  #     itrav = []
  #     (0..2).to_a.each do |i|
  #       itrav[i] = []
  #       (0..10).to_a.each do |j|
  #         itrav[i][j] = 0
  #       end
  #     end
  #     permut(lensmb, itrav, 10, 1).inspect
  #     puts "permut: #{lensmb.inspect}"
  #     permut(lensmb, itrav, 10, 1).inspect
  #     puts "permut: #{itrav[2].inspect}"
  #   end
  # end
  # describe "when using altern" do
  #   it "must work" do
  #     boul = (0..10).to_a
  #     prob = ([0] + 9.times.collect{ rand } << 1).sort
  #     h = {}
  #     (1..10).to_a.reverse.each do |i|
  #       prob[i] = (prob[i] - prob[i-1])
  #       h[i] = 0
  #     end

  #     10000.times do
  #       h[altern(boul, prob, 10)] +=1
  #     end
  #     puts "altern: #{prob} #{h.sort.to_h}"
  #   end
  # end
  # describe "when using poisson" do
  #   it "must work" do
  #     tab = nil
  #     h = {}
  #     (1..10).to_a.each do |i|
  #       tab = poissoninit(i,10,Math.sqrt(i), 10, 10, tab)
  #       r = {}
  #       (1..10).to_a.each do |j|
  #         r[j] = 0
  #       end
  #       1000.times do
  #         r[poisson(i,10, tab)] += 1
  #       end
  #       h[i] = r
  #     end
  #     puts "poissoninit: " + tab.inspect
  #     puts "poisson: " + h.inspect
  #   end
  # end

  # describe "when using inrect" do
  #   it "must work" do
  #     h = {}
  #     (1..10).each do |i|
  #       h[i] = 0
  #     end
  #     10000.times do
  #       h[inrect 1, 10] += 1
  #     end
  #     puts "inrect: " + h.sort.to_h.inspect
  #   end
  # end

  # describe "when using alter" do
  #   it "must work" do
  #     h = {1 => 0, 2 => 0}
  #     10000.times do
  #       h[alter 1, 2, 0.5] += 1
  #     end
  #     puts "alter: " + h.sort.to_h.inspect
  #   end
  # end

  # describe "when using xsigne" do
  #   it "must work" do
  #     h = {-1 => 0, 1 => 0}
  #     10000.times do
  #       h[xsigne] += 1
  #     end
  #     puts "xsigne: " + h.sort.to_h.inspect
  #   end
  # end

end
