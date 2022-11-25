class Album < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one_attached :cover_image
  has_one_attached :audio_data

  def self.tagged_with(name)
    Tag.find_by!(name: name).albums
  end
  def tag_list
   tags.map(&:name).join(', ')
  end
  def tag_list=(names)
    self.tags = names.split(',').map do |n|
    Tag.where(name: n.strip).first_or_create!
    end
  end

  validates :name, presence: true
  validates :audio_data, presence: true
  validates :cover_image,presence:true
end