class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions    
  belongs_to_active_hash :prefecture
  has_many :items
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"




  validates :name, presence: true, uniqueness: true
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :first_name_kana, presence: true, uniqueness: true
  validates :last_name_kana, presence: true, uniqueness: true
  validates :birthday, presence: true, uniqueness: true
  validates :delivery_first_name, presence: true, uniqueness: true
  validates :delivery_last_name, presence: true, uniqueness: true
  validates :delivery_first_name_kana, presence: true, uniqueness: true
  validates :delivery_last_name_kana, presence: true, uniqueness: true
  validates :zip_code, presence: true, uniqueness: true
  validates :prefecture_id, presence: true, uniqueness: true
  validates :municipality, presence: true, uniqueness: true
  validates :street_number, presence: true
  validates :telephone_number, presence: true, uniqueness: true

  


end

