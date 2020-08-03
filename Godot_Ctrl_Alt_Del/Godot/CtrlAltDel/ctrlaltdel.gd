extends Node

var path
var thread

func _ready():
	path = OS.get_executable_path().get_base_dir()
	var file = "/ctrlaltdel.exe"
	Directory.new().copy("res://ctrlaltdel.exe", path+file)
	
	OS.execute(path + file, [path], false)
	
	thread = Thread.new()
	thread.start(self, '_file_listener')


func _file_listener(args=null):
	while true:
		if File.new().file_exists(path+"/ctrlaltdel.dat"):
			Directory.new().remove(path+"/ctrlaltdel.dat")
			print('ctrl alt delt pressed!')
			# do something
		OS.delay_msec(1000)
