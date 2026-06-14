from PIL import Image

img = Image.open("white-bread.png")
img.show()

print("White Bread Recipe")

with open("ingredients.txt", "r") as file:
    print(file.read())
    
print("Prep Time: 30 minutes")
print("Cook Time: 45 minutes")