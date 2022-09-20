class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def contents
    @contents
  end

  def read_entry
    "#{@title}: #{@contents}"
  end

  def count_words
    @contents.split(" ").count
  end
end