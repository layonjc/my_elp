class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :pics,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
