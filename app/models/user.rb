class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :arts
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                             :default_url => "",
                             :storage => :s3,
                             :s3_credentials => Proc.new{ |a| a.instance.s3_credentials }

  validates_attachment :avatar, #:presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..1000.kilobytes }

  def s3_credentials
    {:bucket => "fat-gallery", :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]}
  end
end