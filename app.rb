require 'telegram/bot'

Dir["app/*.rb"].each {|file| require_relative file }

token = '130186451:AAG7kAvnRhIJDoKGPU5BiHadTsAr3L9gyxs'

Telegram::Bot::Client.run(token) do |bot|
  puts "started..."
  cons = Counsciousness.new
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
