require 'rails_helper'

describe Group do
  it { should have_many(:messages) }
end
