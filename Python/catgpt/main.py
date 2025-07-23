import random as r
import time

# Random number that decides how many meows to print
meow_multiplier = int(r.randint(1, 20)) 

# Random number of seconds 
sleepTimer = int(r.randint(5, 25)) 

surprise = int(r.randint(1, 4))

input("What would you like to ask?: ") 

# Time in seconds
time.sleep(sleepTimer) 

if surprise > 3:
    print("I can haz cheezburger")
else:
    print("Meow " * meow_multiplier)