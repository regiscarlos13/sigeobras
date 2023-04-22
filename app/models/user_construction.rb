# frozen_string_literal: true

class UserConstruction < ApplicationRecord
  belongs_to :construction
  belongs_to :user

  # Ex:- scope :active, -> {where(:active => true)}
end
