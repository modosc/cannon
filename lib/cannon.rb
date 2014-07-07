require 'cannon/version'
require 'securerandom'
module Cannon
  def random(n=0)
    SecureRandom.random_number(n)
  end

  # 3.1 The Discrete Uniform Distribution
  # Algorithm 1
  def inrect(l1, l2)
    raise ArgumentError, 'Argument is not a Fixnum' unless l1.is_a?(Fixnum) && l2.is_a?(Fixnum)
    n = l2 - l1 + 1
    u = random
    (n * u).to_i + l1
  end

  # 3.3.1 A Choice Between Two Alternatives
  # Algorithm 2
  def alter(x1, x2, px1)
    raise ArgumentError, '0 <= px1 <= 1' unless px1 >=0 && px1 <= 1
    random < px1 ? x1 : x2
  end

  # Algorithm 3
  def xsigne
    random < 0.5 ? 1 : -1
  end

  # 3.3.3 The Poisson Distribution
  # Algorithm 4
  # TODO - input validation on algo4 and algo5
  def poissoninit(i, n, d, itot, nmax, tab)
    unless tab
      tab = Array.new itot + 1, 0
      tab.each_index do |k|
        tab[k] = Array.new nmax + 1, 0
      end
    end
    xfac = 1
    (1..n-1).to_a.each do |j|
      xk = j-1
      (xfac *= xk) if xk > 1
      val = ((d**xk)/xfac)*Math.exp(-d)
      # below was corrected for either a typo or my lack of pascal knowledge -
      # in the paper it's @tab[i, j-1+val]
      #
      # also we don't add the zero check here since we've already got an array
      # of arrays at @tab[0]. the paper's math assumes 1-indexed arrays and i
      # didn't want to go through and change that since i'm not really clear on
      # this algorithm as-is...
      tab[i][j] = tab[i][(j-1)]+val
    end
    tab[i][n] = 1.0
    tab
  end

  # Algorithm 5
  def poisson(i, n, tab )
    u = random
    (1..n).to_a.each do |j|
     return j if u <= tab[i][j]
    end
  end

  # 3.3.4 A Choice Between SeveralAlternatives
  # Algorithm 6
  def altern(boul, prob, n)
    som = 0
    u = rand
    (1..n).to_a.each do |i|
      som += prob[i]
      # puts "som is #{som}"
      # puts "u is #{u}"
      # another typo, the paper says u >= som which will always return either
      # boul[1] or boul[10]
      if som >= u
        return boul[i]
      end
    end
    return boul[n]
  end

  # 3.3.5 Exhaustive Trials, Permutations
  # Algorithm 7
  def permut(lensmb, itrav, n, iopt)
    (1..n).to_a.each do |i|
      itrav[1][i] = i
    end
    ic = n
    begin
      # typo, original was inrect(1, ix)
      ix = inrect(1,ic)
      ir = itrav[1][ix]
      itrav[2][ic] = lensmb[ir]
      itrav[1][ix] = itrav[1][ic]
      ic -= 1
    end while ic > 0
    if iopt == 1
      (1..n).to_a.each do |i|
        lensmb[i] = itrav[2][i]
      end
    end
    lensmb
  end

  # 4.3.1 The Linear Distribution
  # TODO - this is only for slope of -0.5, figure out how to general purpose
  # this for slope n
  def linear(g, slope)
    case slope <=> 0
    when 1
      g - (g * (random**(0.5))) # slope 1/2)
    when -1
      g * (random**(0.5)) # slope -1/2
    when 0
      g * random
    end
  end

  def exponential(density)
    case density <=> 0
    when 1
      -Math.log(random) / density
    when -1
      -density/Math.log(random)
    when 0
      #???
    end
  end

  # 4.3.3 Gamma Distributions
  def gamma(nu)
    sum = 1.0
    nu.times do
      sum *= random
    end
    -Math.log(sum)
  end

  # 4.3.4 First Law of Laplace
  def plapla(xmu, tau)
    u = random * 2.0
    if u > 1.0
      u = 2.0 - u
      -tau * Math.log(u) + xmu
    else
      tau * Math.log(u) + xmu
    end
  end

  # 4.3.5 Cauchy distribution
  def cauchy(tau, iopt=nil)
    u = random
    (u /= 2.0) if iopt
    u *= Math::PI
    tau * Math.tan(u)
  end

  # 4.3.6 Hyperbolic Cosine Distribution
  def hyperbolic_cos
    Math.log(Math.tan(Math::PI * random / 2))
  end

  # 4.3.7 Logistic Distribution
  # mean is -beta/alpha, mode is alpha/4
  def logistic(alpha, beta)
    ( -beta - Math.log(1/random - 1) ) / alpha
  end

end
