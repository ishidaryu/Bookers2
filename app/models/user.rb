class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }

  validates :introduction, length: { maximum: 50 }
  has_one_attached :profile_image
  has_many :books, dependent: :destroy
  has_many :usrs, dependent: :destroy


def get_profile_image(width, height)
    unless self.profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'sample-author1.jpg', content_type: 'image/jpeg')
    end
    self.profile_image.variant(resize_to_limit: [width, height]).processed
end

end
