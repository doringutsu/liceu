# == Schema Information
#
# Table name: students
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  idnp         :string
#  birthday     :date
#  email        :string
#  phone        :string
#  p_first_name :string
#  p_last_name  :string
#  p_phone      :string
#  p_email      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  subject_id   :integer
#  group_id     :integer
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
