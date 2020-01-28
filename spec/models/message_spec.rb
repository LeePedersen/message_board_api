require 'rails_helper'

describe Message do
  it { should belong_to(:group) }
end
