class Art < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :artpic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :artpic, #:presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..1000.kilobytes }
end
