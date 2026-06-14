from PIL import Image

img = Image.open("wheat-bread.png")
img.show()

print("Wheat Bread Recipe")

with open("ingredients.txt", "r") as file:
    print(file.read())
    
print("Prep Time: 30 minutes")
print("Cook Time: 45 minutes")