require 'spec_helper'

describe Tasklist do
    it { should have_many(:tasklist_items) }

end
