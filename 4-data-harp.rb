# arpeggiate incoming osc data stream, normalized to 0-15
# requires separate input file: see test.py at https://github.com/asanspace/planet-hack-2020

cmaj = scale(:c2,:major,num_octaves: 5) # list of 36 notes
dmaj = scale(:d2,:major,num_octaves: 5)
emin = scale(:e2,:minor,num_octaves: 5)
fmaj = scale(:f2,:major,num_octaves: 5)
fmin = scale(:f2,:minor,num_octaves: 5)
gmaj = scale(:g2,:major,num_octaves: 5)
amin = scale(:a2,:minor,num_octaves: 5)
bmaj = scale(:b2,:major,num_octaves: 5)

revtrag = [cmaj, amin, emin, gmaj]
lotr = [emin, cmaj, gmaj, dmaj]
glass = [emin, cmaj, gmaj, bmaj]
wagon = [gmaj, dmaj, emin, cmaj]
purty = [cmaj, emin, fmaj, fmin]

arp = [0,2,4,7,9,11,14,16,18,21,23,25,28,30,32,35] # note values for arpeggiation, 0-indexed
arrayin = sync "/osc*/trigger/prophet" # incoming data, normalized to those 16 values

# use_synth :blade

iter = 1
frame = 0

live_loop :test do
  notein = arrayin[iter]
  puts notein
  mynote = arp[notein] # select note from arp list, by datain value
  # myrand = arp[rand_i(16)] # random value from the arp
  
  if ((iter % 16) == 0)  # at the end of the sequence
    frame = frame+1
  end
  
  play (lotr[(frame % 4)])[mynote]
  
  iter = iter+1
  sleep 0.2
end