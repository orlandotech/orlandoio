class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { 
    large: "450x450#",
    medium: "300x300#", 
    thumb: "100x100#",
    mini: "32x32#" 
  }, 
    default_url:"/images/:style/missing.png"
end
