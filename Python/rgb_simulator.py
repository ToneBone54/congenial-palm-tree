import pygame

pygame.init()

window = pygame.display.set_mode((800, 600))

color = "red"

running = True
while running:
    for e in pygame.event.get():
        if e.type == pygame.QUIT:
            running = False
    window.fill(color)
    pygame.display.flip()

    if(color == "red"):
        color = "green"
        pygame.time.wait(500)
    elif(color == "green"):
        color = "blue"
        pygame.time.wait(500)
    else:
        color = "red"
        pygame.time.wait(500)
pygame.quit()