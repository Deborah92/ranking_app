class User < ActiveRecord::Base
  has_many  :dogs, :dependent => :nullify

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
