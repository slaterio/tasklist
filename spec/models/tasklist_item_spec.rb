require 'spec_helper'

describe TasklistItem do
  it { should belong_to(:tasklist) }
end
