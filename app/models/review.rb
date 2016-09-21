class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  
  validates :body, presence: true
  
  def self.persisted
    where.not(id: nil)
  end
end