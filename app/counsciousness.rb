COMMANDS = [
  '/sup - say hi to the bot',
  '/help - obviously'
]

class Counsciousness
  def read(message)
    case message.text
    when '/sup'
      "Sup #{message.from.first_name}!"
    when '/help'
      COMMANDS.join("\n")
    end
  end
end
