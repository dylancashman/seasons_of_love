seasons_of_love
=========

This gem provides a single method, split_dates_into_ranges, which takes in a start date
and an end date, and spits out a hash containing all of the months between them in a 
specific format.

    SeasonsOfLove.split_dates_into_ranges(Date.parse("January 7, 2013"), Date.parse("March 14, 2013"))

    # =>  {
            { :month => "January", :start_date => 2013-01-07, :end_date => 2013-01-31 }, 
            { :month => "February", :start_date => 2013-02-01, :end_date => 2013-02-28 }, 
            { :month => "March", :start_date => 2013-03-01, :end_date => 2013-03-14 }
          }

Except in the above, 2013-01-31 would really be the Ruby Date object representing the date January
31st, 2013.

This gem can come in handy if you need to split a report up into data received in each month.

## Configuration Options

### Format

You can pass in the `:format => 'weeks'` option and the range will be split into weeks.

    SeasonsOfLove.split_dates_into_ranges(Date.parse("November 3, 2013"), Date.parse("November 13, 2013"), :format => 'weeks')

    # =>  {
            {:start_date => 2013-11-03, :end_date => 2013-11-09},
            {:start_date => 2013-11-10, :end_date => 2013-11-13}
          }

This assumes that Sunday is the beginning of the week.

### Beginning of Week.

Used in conjunction with `:format => 'weeks'`, this option allows you to configure which day you 
consider to be the beginning of the week.

    SeasonsOfLove.split_dates_into_ranges(Date.parse("November 3, 2013"), Date.parse("November 13, 2013"), :format => 'weeks', :beginning_of_week => :monday)

    # =>  {
            {:start_date => 2013-11-03, :end_date => 2013-11-03},
            {:start_date => 2013-11-04, :end_date => 2013-11-010},
            {:start_date => 2013-11-11, :end_date => 2013-11-13}
          }

### Allow nil

Fails silently if one of the dates entered is nil.  

    SeasonsOfLove.split_dates_into_ranges(Date.parse("November 3, 2013"), nil)

    # =>  NoMethodError: undefined method `month' for nil:NilClass

Add the option, and

    SeasonsOfLove.split_dates_into_ranges(Date.parse("November 3, 2013"), nil, :allow_nil => true)

    # => []

In the future, we should add a specific error instead of a NoMethodError, so that that 
error can be caught in a controller and the user can be notified.

##Installation

### Rails

Just require it in your gem file

    gem 'seasons_of_love'

Then, call to the module method like above, assuming date_1 and date_2 are Ruby Date objects:

    SeasonsOfLove.split_date_into_ranges(date_1, date_2)

##About the name

I was originally thinking that I would call the gem `seasoning` because it splits up a period of 
time into significant portions.  That wasn't even a great name to begin with, but it turns out it's
taken.  So... Seasons of Love?(http://en.wikipedia.org/wiki/Seasons_of_Love)

I don't know, Jonathan Larsen went to my high school.
