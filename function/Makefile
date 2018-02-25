compile:
	GOOS=linux go build -o main

compress:
	zip function.zip main	

release: compile \
	compress