require 'singleton'

class MailBox
  include Singleton

  def initialize
    @messages = []
    @listeners = {}
  end

  def listen(message, &block)
    @listeners[message] ||= []
    @listeners[message] << block
  end

  def send_message(message, data)
    @listeners[message]&.each { |listener| listener.call(data) }
  end
end
