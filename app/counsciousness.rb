class Counsciousness
  def read(message)
    case message.text
    when '/sup'
      "Sup, #{message.from.first_name}!"
    end
  end
end