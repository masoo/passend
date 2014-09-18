module ReceptionsHelper
  def already_read(message, destinations)
    destinations.any? {|destination|
      if destination.message.id == message.id
        destination.is_checked
      else
        false
      end
    }
  end
end
