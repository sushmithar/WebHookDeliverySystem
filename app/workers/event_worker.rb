require 'http.rb'
require 'uri'
require 'json'
require 'openssl'
 
class EventWorker
  include Sidekiq::Worker

  def initialize(event_id, event_url)
   @event = Event.find_by(id: event_id)
   @event_url = event_url
  end
 
  def perform()
    return if @event.nil?
 
    return if @event_url.nil?
 
    response = HTTP.timeout(30)
                   .headers(headers)
                   .post(
                    @event_url,
                     body: {
                       event: @event.title,
                       payload: @event.event_payload,
                     }.to_json
                   )
    event.update(response: {
                headers: response.headers.to_h,
                code: response.code.to_i,
                body: response.body.to_s,
    })
 
    raise FailedRequestError unless response.status.success?
    rescue HTTP::TimeoutError
        event.update(response: { error: 'TIMEOUT_ERROR' })
    
  end
 
  private

  def headers
    {
      'Content-Type' => 'application/json',
      'X-Webhook-Signature' => generate_signature
    }
  end

  def generate_signature
    secret = 'your_secret_key' # Replace with your secret key
    OpenSSL::HMAC.hexdigest('SHA256', secret, @event.event_payload.to_json)
  end
 

# error handling
  class FailedRequestError < StandardError;
  end
end