# == Schema Information
#
# Table name: group_subjects
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  subjects_teacher_id  :integer
#  subjects_teachers_id :integer
#  year                 :integer
#

require 'test_helper'

class GroupSubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
