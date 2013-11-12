require File.join(File.dirname(__FILE__), '..', 'lib', 'seasons_of_love')

describe SeasonsOfLove do
  
  context "parse range into months hash" do
    context "same month" do
      let(:start_date) { Date.parse("September 5, 2012") }
      let(:end_date) { Date.parse("September 18, 2012") }
      let(:parsed_range) { SeasonsOfLove.split_dates_into_ranges(start_date, end_date) }

      it 'should return one hash' do
        parsed_range.should == [{:start_date => start_date, :end_date => end_date, :month => "September"}]
      end
    end

    context "different months" do
      let(:start_date) { Date.parse("September 5, 2012") }
      let(:end_date) { Date.parse("November 18, 2012") }
      let(:parsed_range) { SeasonsOfLove.split_dates_into_ranges(start_date, end_date) }

      it 'should return multiple hashes' do
        parsed_range.should ==  [
                                  {:start_date => start_date, :end_date => Date.parse("September 30, 2012"), :month => "September"},
                                  {:start_date => Date.parse("October 1, 2012"), :end_date => Date.parse("October 31, 2012"), :month => "October"},
                                  {:start_date => Date.parse("November 1, 2012"), :end_date => Date.parse("November 18, 2012"), :month => "November"}
                                ]
      end
    end
  end

end