#require "diaryentry_class.rb"

class Diary
    def initialize
        @all_entries = []
        @all_tasks = []
        @phone_numbers = []
    end

    def add_entry(entry)
        @all_entries << entry
    end

    def add_task(task)
        @all_tasks << task
    end

    def display_all_entries
        @all_entries
    end

    def display_all_tasks
        @all_tasks
    end

    def best_entry_for_given_time(wpm, min)
      readable_words = wpm * min
      readable_entries = []
      @all_entries.each do |entry|
        readable_entries << entry if entry.count_words <= readable_words
      end
      fail "No suitable entries for the time given" if readable_entries.empty?
      dable_entries.max_by(&:count_words)
    end

    def phone_list
      @all_entries.each do |entry|
         @phone_numbers += entry.contents.scan(/[0-9]{11}/)
      end
      @phone_numbers
    end
end