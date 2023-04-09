# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  belongs_to :company
  has_many   :user_constructions, dependent: :destroy

  validates_presence_of :name

  enum role: [:admin, :user]
end
