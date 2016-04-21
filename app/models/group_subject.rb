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

class GroupSubject < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :subject
  belongs_to :group
end
