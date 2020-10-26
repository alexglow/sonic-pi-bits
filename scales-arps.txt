# interesting scales/arps (adapted from sonic pi forum)

notes = scale(:c3,:major,num_octaves: 3) # list of 22 notes
val = [1,3,5,8,10,12,15,17,19,22]
altval = [0,2,4,7,9,11,14,16,18,21]

live_loop :test do
  n=rand_i(10)
  puts n
  arp = val[n]
  play notes[arp]
  sleep 0.2
end