#!/usr/bin/ruby

parameters = {
  :dictionary => "dict/1000.dicin",
  :speech => "speeches/trump01.txt"
}

def load_dict(file)
  load_file(file)
end

def load_speech(file)
  load_file(file)
end

def load_file(file)
  # puts "Opening #{file}"
  fd = File.open(file, 'r')
  hash = {}
  while !fd.eof? do
    line = fd.readline.chomp.strip.downcase
    next if line.nil?
    next if line =~ (/^\s+#/) # Allow comments so I can credit sources
    words = line.split(/[\s.,-]+/)
    
    words.each do |word|
      if hash.has_key?(word)
        hash[word] += 1
      else
        hash[word] = 1
      end
    end
  end
  fd.close
  
  # puts hash
  return hash
end

def analyze(speech, dict)
  unique = speech.keys.size
  uniquesimple = speech.keys.select{ |w| dict.has_key?(w)}.size
  
  # This inject syntax is new to me and too "clever" for my taste but this is quick and dirty
  total = speech.values.inject(0, :+)
  totalsimple = speech.keys.select{ |w| dict.has_key?(w)}.collect{|w| speech[w]}.inject(0, :+)

  
  printf "Unique words: %d\n", unique
  printf "Unique words that are simple: %d\n", uniquesimple
  printf "Unique words that are simple (%%): %d %%\n", 100* uniquesimple / unique
  printf "---\n"
  printf "Total words: %d\n", total
  printf "Total words that are simple: %d\n", totalsimple
  printf "Total words that are simple (%%): %d %%\n", 100* totalsimple / total
  
  printf "---\n"
  printf "Top simple words by frequency:\n"
  speech.keys.sort {|a,b| speech[b] <=> speech[a]}.first(5).each do |w|
    printf "- %s (%d)\n", w, speech[w]
  end
  
  printf "---\n"
  printf "Top non-simple words by frequency:\n"
  speech.keys.select{|w| ! dict.has_key?(w)}.sort {|a,b| speech[b] <=> speech[a]}.first(5).each do |w|
    printf "- %s (%d)\n", w, speech[w]
  end
  
end

def main(options)
  speech = load_speech(options[:speech])
  dict = load_dict(options[:dictionary])
  analyze(speech, dict)
end

main(parameters)