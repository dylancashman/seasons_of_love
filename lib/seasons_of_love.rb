require "seasons_of_love/version"
require 'active_support/core_ext'

module SeasonsOfLove
  #date trick taken from http://stackoverflow.com/questions/925905/is-it-possible-to-create-a-list-of-months-between-two-dates-in-rails
  # -Dylan
  def self.split_dates_into_ranges(start_date, end_date, opts={})
    months = []
    
    if start_date.blank? || end_date.blank?
      if opts[:allow_nil]
        []
      else
        raise "Range of #{start_date} - #{end_date} is missing one endpoint."
      end
    else
    
      (start_date.year..end_date.year).each do |y|
        mo_start = (start_date.year == y) ? start_date.month : 1
        mo_end = (end_date.year == y) ? end_date.month : 12
        
        (mo_start..mo_end).each do |m|
          if (start_date.year == y && start_date.month == m)
            #first month in range
            start_of_month = start_date
          else
            start_of_month = Date.strptime("#{sprintf '%02d', m}/01/#{y}", "%m/%d/%Y")
          end
          
          if (end_date.year == y && end_date.month == m)
            #last month in range
            end_of_month = end_date
          else
            end_of_month = start_of_month.end_of_month
          end
          
          month_entry = {}
          month_entry[:start_date] = start_of_month
          month_entry[:end_date] = end_of_month
          month_entry[:month] = Date::MONTHNAMES[m]
          months << month_entry
        end
      end
      months
    end
  end
end
