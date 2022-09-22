require_relative "../lib/api_exercise.rb"

RSpec.describe TimeError do
    describe "error" do
        it "returns the difference in seconds between the remote time and time on the computer" do
            fake_requester = double :fake_requester
            allow(fake_requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return'{"abbreviation":"BST","client_ip":"213.230.194.2","datetime":"2022-09-22T13:46:33.498637+01:00","day_of_week":4,"day_of_year":265,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1663850793,"utc_datetime":"2022-09-22T12:46:33.498637+00:00","utc_offset":"+01:00","week_number":38}'
            fake_requester.get(URI("https://worldtimeapi.org/api/ip"))
            time = Time.new(2022, 9, 22, 13, 46, 33)
            time_error = TimeError.new(fake_requester)
            expect(time_error.error(time)).to eq 0.498637
        end
    end
end