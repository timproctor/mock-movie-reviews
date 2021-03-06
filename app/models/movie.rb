class Movie < ApplicationRecord
  validates :title, :released_on, :duration, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, allow_blank: true, format: {
    with:    /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  RATINGS = %w(G PG PG-13 R NC-17)

  validates :rating, inclusion: { in: RATINGS }

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :fans, through: :likes, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  before_validation :generate_slug

  scope :released, -> { where("released_on <= ?", Time.now).order(released_on: :desc) }
  scope :hits, -> { where('total_gross >= 300000000').order(total_gross: :desc) }
  scope :flops, -> { released.where('total_gross < 300000000').order(total_gross: :desc) }
  scope :upcoming, -> { where("released_on > ?", Time.now).order(released_on: :asc) }
  scope :rated, ->(rating){ released.where(rating: rating) }
  scope :recent, ->(limit=5){ released.limit(limit) }

  def self.recently_added
    order('created_at desc').limit(3)
  end

  def flop?
    total_gross.blank? || total_gross < 50000000
  end

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews
    reviews.order('created_at desc').limit(2)
  end

  def generate_slug
    self.slug ||= title.parameterize if title
  end

  def to_param
    slug
  end

end
