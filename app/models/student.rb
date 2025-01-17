# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students


  def self.search(search)
    if search.blank?
      self.all
    else
      result = self.all.find_all do |student|
        student.name.downcase.include?(search.downcase)
      end.compact
    end
  end
end
