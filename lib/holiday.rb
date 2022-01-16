require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply 

  return holiday_hash 

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply 

  return holiday_hash 

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  holiday_hash[:"#{season}"][:"#{holiday_name}"] = supply_array
  # remember to return the updated hash
  return holiday_hash 
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  return holiday_hash[:winter].values.flatten 
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  #Season
  season_array = holiday_hash.keys.flatten
  season_array = season_array.each {|season| season.to_s.split("_")}
  capital_season_strings = season_array.collect { |season| season.to_s.capitalize! } 
  
  season_counter = 0
  holiday_hash.each do |season, holidays| 
       
    puts "#{capital_season_strings[season_counter]}:"
    season_counter += 1
     

    #Holiday
    holiday_counter = 0
    until holiday_counter == holidays.length

      holiday_array = holiday_hash[season].keys
      split_holiday_array = holiday_array.collect{|holiday| holiday.to_s.split("_")} 
    
      capital_holiday_array = split_holiday_array.collect do |holiday| 
        holiday.collect{ |word| word.capitalize! }
      end
    
      joined_holiday_array = capital_holiday_array.collect do |holiday_array|
        holiday_array.join(" ")
      end  


      #Supplies

      holidays.each do |holiday, supplies|
        supply_string = holiday_hash[season][holiday].join(", ")
        puts "  #{joined_holiday_array[holiday_counter]}: #{supply_string}"
        holiday_counter += 1
      end 
    
    end 
    


  end  

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []

  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supply_list|
      if supply_list.include?("BBQ")
        bbq_holidays << holiday 
      end  
    end
  end

  return bbq_holidays

end 







