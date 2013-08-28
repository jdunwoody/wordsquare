 #!/usr/bin/ruby

abort("Usage #{__FILE__} allowedcharacters") unless ARGV[0]

correct_chars_regexp = Regexp.new(/^[#{ARGV[0]}]+$/i)
duplicate_chars_regexp = Regexp.new(/(\w).*\1/i)

count = 0
dictionary = '/usr/share/dict/words'
#dictionary = 'en.txt'
longest = []
length = 0

File.foreach(dictionary) do |line|
  if line.match(correct_chars_regexp) && !line.match(duplicate_chars_regexp)
    line = line.chomp

    if line.length > length
      longest = [line]
      length = line.length
    elsif line.length == 9
      longest << line
    end
    count = count + 1
  end
end
puts "#{count} words matched"
puts "longest word length: #{length}"
puts "longest words are #{longest}"
