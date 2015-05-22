class Art < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :artpic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                             :default_url => "Add_art_pic.png",
                             :storage => :s3,
                             :s3_credentials => Proc.new{ |a| a.instance.s3_credentials }

  validates_attachment :artpic, #:presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..1000.kilobytes }

  def s3_credentials
    {:bucket => "fat-gallery", :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  end
end
