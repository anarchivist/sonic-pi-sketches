load_samples(sample_names :glitch)
sleep 2

with_fx :reverb, damp: 0.88, room: 1, amp: 1, mix: 0.8 do
  live_loop :foo do
    sp_name = choose sample_names :glitch
    sp_time = [1, 1.25, 2].choose
    sp_rate = [0.33, 0.66, 1, 1.33, 1.66, 2].choose
    
    s = sample sp_name, cutoff: rrand(60, 130),
      rate: sp_rate * choose([0.25, 0.5, 0.75, 1]),
      pan: rrand(-1, 1), pan_slide: sp_time, decay: 1000
    control s, pan: rrand(-1, 1)
    sleep sp_time
  end
end

