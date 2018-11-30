from PIL import Image

input_dir = "/home/ramon/Desktop/super-resolution-slide-examples"
image_name = "nature_128_128.jpg"
image_path = input_dir + '/' + image_name
scale = 2

img = Image.open(image_path)
width, height = img.size
img = img.resize((int(width*scale), int(height*scale)), Image.BICUBIC)
img.save(input_dir + '/processed_' + image_name)
