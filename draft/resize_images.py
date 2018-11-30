# Script to resize Images in python
# Resize images from original size to 2, 4 and 8 times smaller saving them in different folders
from PIL import Image
import os

input_dir = './images/original/'
output_dir_base = './images/resized_'
scale_list = [2, 4, 8]

# List images in directory (all files)
image_list = [f for f in os.listdir(input_dir) if os.path.isfile(os.path.join(input_dir, f))]

# For each file: get
for scale in scale_list:
    output_dir = output_dir_base + str(scale) + '/'
    for image in image_list:
        image_path = input_dir+image
        img = Image.open(image_path)
        width, height = img.size
        img = img.resize((int(width/scale), int(height/scale)), Image.BICUBIC)
        img.save(output_dir+image)
