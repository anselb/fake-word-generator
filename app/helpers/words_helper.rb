module WordsHelper
  def file_to_word_array(file_path)
    words = Array.new

    File.open(file_path, "r") do |f|
      f.each_line do |line|
        words.push(line.gsub("\n",''))
      end
    end

    words
  end

  words = file_to_word_array('./words2.txt')

  class Dictogram < Hash

    def initialize(word = nil)
      @types = 0
      @tokens = 0

      if word != nil
        @tokens += word.length

        word.each_char do |chr|
          if self.key?(chr)
            self[chr] += 1
          else
            self[chr] = 1
            @types += 1
          end

        end
      end
    end

    def add_count(letter, count = 1)
      @tokens += count

      if self.key?(letter)
        self[letter] += 1
      else
        self[letter] = 1
        @types += 1
      end
    end

    def frequency(letter)
      if self.key?(letter)
        self[letter]
      else
        0
      end
    end

  end
end
