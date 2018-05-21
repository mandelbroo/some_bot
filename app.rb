require 'telegram/bot'
require 'dotenv'


Dir["app/*.rb"].each {|file| require_relative file }

Dotenv.load
TOKEN = ENV['TOKEN']

Telegram::Bot::Client.run(TOKEN) do |bot|
  puts "started..."
  cons = Counsciousness.new
  # puts bot.api.delete_webhook
  bot.listen do |message|
    case message.text
    when '/poll'
      question = 'London is a capital of which country?'
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [%w(USA France), %w(Britain Germany)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    else
      answer = cons.read(message)
      puts "abonent says #{message.text}"
      puts "bot says #{answer}" if answer
      bot.api.sendMessage(chat_id: message.chat.id, text: answer) if answer
    end
  end
end
