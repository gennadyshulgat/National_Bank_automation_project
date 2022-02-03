require 'rest-client'

Then(/^Получили полный перечень валют$/) do

  @response = RestClient::Request.execute(
    { method: :get,
      url: "https://www.nbrb.by/api/exrates/currencies",
      timeout: 60 }
  )

end

Then(/^Проверили что ответ на запрос полного перечня валют имеет статус 200$/) do
  if @response.code != 201
    raise "ошибка, не правильный код ответа"
  end
end