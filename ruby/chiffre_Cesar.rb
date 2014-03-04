# Caesar cipher
cipher = -> key { Hash[characters.zip(characters.to_a.rotate(key))] }

def crypt message, key, characters
  characters = characters.chars.to_a
  cipher = Hash[characters.zip(characters.to_a.rotate(key))]
  message.chars.map { |c| cipher[c.upcase] || c }.join
end

def decrypt message, key, characters
  characters = characters.chars.to_a
  cipher = Hash[characters.rotate(key).zip(characters)]
  # or: cipher = Hash[characters.zip(characters.rotate(-key))]
  message.chars.map { |c| cipher[c.upcase] || c }.join
end

crypted = crypt "Wikipedia l'encyclopedie libre", 3, ('A'..'Z').to_a.join
p crypted # => "ZLNLSHGLD O'HQFBFORSHGLH OLEUH"
p decrypt crypted, 3, ('A'..'Z').to_a.join # "WIKIPEDIA L'ENCYCLOPEDIE LIBRE"

