require 'rails_helper'

describe Blog do
  it { should validate_presence_of :title }
end
