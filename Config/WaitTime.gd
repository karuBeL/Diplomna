extends Node

var min_wait_time = 0.1
var wait_time = min_wait_time
var max_wait_time = 0.4
var increment = 0.05

func get_wait_time():
	var result = wait_time
	wait_time = wait_time + increment
	if wait_time > max_wait_time:
		wait_time = min_wait_time
	print(result)
	return result
