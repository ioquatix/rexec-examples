#!/usr/bin/env ruby

flappy_bird = true

while flappy_bird
	puts "Flappy bird is still flapping?"
	
	# Flush output otherwise it would be buffered.
	$stdout.flush
	
	sleep 1
end
