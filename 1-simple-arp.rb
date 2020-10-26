# simple arp: iterate over chords

cmaj = scale(:c2,:major,num_octaves: 5) # list of 36 notes
emin = scale(:e2,:minor,num_octaves: 5)
fmaj = scale(:f2,:major,num_octaves: 5)
fmin = scale(:f2,:minor,num_octaves: 5)

arp = [0,2,4,7,9,11,14,16,18,21,23,25,28,30,32,35] # note values for arpeggiation, 0-indexed

purty = [cmaj, emin, fmaj, fmin]

iter = 1
frame = 0

live_loop :test do
  mynote = arp[iter % 16] # iterate over the sequence – this is where your normalized data go
  
  if mynote == (iter % 16)  # at the top of the sequence
    frame = frame+1
  end
  
  play (purty[(frame % 4)])[mynote]
  
  iter = iter+1
  sleep 0.2
end