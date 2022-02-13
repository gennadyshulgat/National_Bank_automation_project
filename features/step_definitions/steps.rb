Then(/^Получили полный перечень валют$/) do

  @response = RestClient::Request.execute(
    { method: :get,
      url: "https://www.nbrb.by/api/exrates/currencies",
      timeout: 60 }
  )

end

Then(/^Проверили что ответ на запрос полного перечня валют имеет статус 200$/) do
  if @response.code != 200
    raise "ошибка, не правильный код ответа"
  end
end

When(/^Открыли страницу курсов валют на сайте НБРБ$/) do
  $driver.navigate.to "https://www.nbrb.by/statistics/rates/ratesdaily.asp"
end

When(/^получили значение текущего курса доллара$/) do
  current_course_element = $driver.find_element(:xpath,"//*[@id='ratesData']/table/tbody/tr[6]/td[3]/div")
  @current_course = current_course_element.text.gsub(',','.').to_f
end

When(/^Проверили что текущий курс доллара больше (\d+) рублей$/) do |max_course|
  if @current_course > max_course
    puts "FINE"
  else
    raise "ERROR текущий курс меньше #{max_course}"
  end
end