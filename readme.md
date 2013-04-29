seasoning
=========

This gem provides a single method, split_dates_into_ranges, which takes in a start date
and an end date, and spits out a hash containing all of the months between them in a 
specific format.

    Seasoning.split_dates_into_ranges(Date.parse("January 7, 2013"), Date.parse("March 14, 2013"))

    # =>  {
            { :month => "January", :start_date => 2013-01-07, :end_date => 2013-01-31 }, 
            { :month => "February", :start_date => 2013-02-01, :end_date => 2013-02-28 }, 
            { :month => "March", :start_date => 2013-03-01, :end_date => 2013-03-14 }
          }

Except in the above, 2013-01-31 would really be the Ruby Date object representing the date January
31st, 2013.

This gem can come in handy if you need to split a report up into data received in each month.

##Installation

### Rails

Just require it in your gem file

    gem 'seasoning'

Then, call to the module method like above, assuming date_1 and date_2 are Ruby Date objects:

    Seasoning.split_date_into_ranges(date_1, date_2)