require 'rails_helper'

RSpec.describe PlaylistMusic, type: :model do
  it { should belong_to(:music)}

  it { should belong_to(:playlist)}
end
