from PIL import Image

input_dir = "/home/ramon/Github/super-resolution-service/docs/assets/users_guide"
image_name = "tiger_original.jpeg"
image_path = input_dir + '/' + image_name
scale = 2

img = Image.open(image_path)
width, height = img.size
img = img.resize((int(width*scale), int(height*scale)), Image.BICUBIC)
img.save(input_dir + '/processed_' + image_name)
