class Event < ApplicationRecord
    THIRD_PARTY_SERVICE_URL = "https://event_management.com"
    belongs_to :user, inverse_of: :events
    
    validates :title, presence: true
    validates :event_payload, presence: true

    after_save :call_event_worker


    def call_event_worker
        EventWorker.new(id, THIRD_PARTY_SERVICE_URL).perform
    end
    
end
