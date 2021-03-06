class Bet < ActiveRecord::Base

	acts_as_votable

	belongs_to :user
	
	has_attached_file :image, :styles => { :medium => "300x400>" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	validates :name, :betamount, :potentialwins, presence: true
  	validates :betamount, :potentialwins, numericality: true


end
