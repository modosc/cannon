require_relative '../../test_helper'

describe Cannon do

  it "must be defined" do
    Cannon::VERSION.wont_be_nil
  end

end
