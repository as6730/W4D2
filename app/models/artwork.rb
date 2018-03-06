# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id, message: "can not have two titles of the same name" }
  validates :image_url, presence: true, uniqueness: true

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id,
    primary_key: :id

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    primary_key: :id

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
