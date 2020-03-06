class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  has_many :tasks, dependent: :destroy
  before_destroy do
   throw(:abort) if User.where(admin: true).count == 1 && self.admin?
   #adminがtrueのユーザーが1名かつ、自身のadminがtrue？の場合、アクションはfalseになる
  end
  # before_update do
  #  throw(:abort) # throw(:abort) if User.where(admin: true).count <= 1 && self.admin?
  # end


end

# before_destroy do
#  throw(:abort) unless self.admin?
# throw(:abort) if User.where(admin: true).count <= 1 && self.admin?
# end
