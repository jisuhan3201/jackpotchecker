require ('open-uri')
require ('json')


class JackpotController < ApplicationController
  def index
  end

  def checker
    get_info = JSON.parse open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=').read
    
    lotto_num = []
    get_info.each do |k, v|
      if k.include? "drwtNo"
        lotto_num << v 
      end
    end
    
    lotto_num.sort!
    
    my_num = (1..45).to_a.sample(6).sort
    match_num = lotto_num & my_num
    bonus_num = get_info["bnusNo"]
    count_num = match_num.count
    
    if count_num == 6
      result = "1등"
    elsif count_num == 5 && my_num.include?(bonus_num)
      result = "2등"
    elsif count_num == 5
      result = "3등"
    elsif count_num == 4
      result = "4등"
    elsif count_num == 3
      result = "5등"
    else
      result = "꽝"
    end
    
    @lotto_num = lotto_num
    @bonus_num = bonus_num
    @my_num = my_num
    @match_num = match_num
    @result = result
    
  end
end
