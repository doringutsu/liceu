# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  year       :integer          not null
#  letter     :string(1)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :integer
#  profile    :string
#

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
