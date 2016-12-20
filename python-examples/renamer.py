import glob
import os.path
import re

folder = "~/Downloads/prank"
expanded_path = os.path.expanduser(folder)
file_names = glob.glob(expanded_path + "/*")

for file_name in file_names:
    new_name = re.sub(r'\d+', '', file_name)
    print(new_name)
    # os.rename(file_name, new_name)

# could've used os.listdir
# could've used string.translate
# os.getwd and os.chdir can be used as well
