class User < ApplicationRecord
    USER_URL = 'http://localhost:3000/events'
    has_many :events, inverse_of: :user
end
