ini_open("rating")
global.rating_time = ini_read_real("rating","time",global.rating_gap)
global.rating_finish = ini_read_real("rating","finish",0)
ini_close()
