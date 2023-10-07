import os
import sys
from PIL import Image

build_path = sys.argv[1]

def single_resize(imagedir, filename):
    """Resize a single image."""
    filepath = os.path.join(imagedir, filename)
    print("Resizin (overwriting) %s ..." %filepath)
    image = Image.open(filepath)
    old_w, old_h  = image.size
    h = min(old_h, 300)
    w = (int)(old_w * h / old_h)
    image = image.resize((w,h), Image.Resampling.LANCZOS)
    image.save(filepath, quality=95)

def bulk_resize(imagedir):
    """Resize all images in a folder."""
    imgexts = ["png", "jpeg", "jpg"]
    for (path, dirs, files) in os.walk(imagedir):
        for filename in files:
            ext = filename[-3:].lower()
            ext_j = filename[-4:].lower()
            if ext not in imgexts and ext_j not in imgexts:
                continue
            single_resize(path, filename)

file_path = os.path.realpath(__file__)
subdir_path = file_path[0:file_path.rfind('/')]
dir_path = subdir_path[0:subdir_path.rfind('/')]
imagedir = dir_path + '/' + build_path + '/latex'
bulk_resize(imagedir)
