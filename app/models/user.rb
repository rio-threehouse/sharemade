class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, length: { maximum: 20 }
  
  has_many :results, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :good_results, through: :goods, source: :result

  def good(result)
    self.goods.find_or_create_by(result_id: result.id)
  end

  def ungood(result)
    good = self.goods.find_by(result_id: result)
    good.destroy if good
  end

  def good?(result)
    self.good_results.include?(result)
  end

  has_many :comments, dependent: :destroy

  # アップデートをcurrent_passwordなし行うためのメソッド
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
