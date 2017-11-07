import re
import os
import argparse
import shutil

def publish_file(path):
    (head, tail) = os.path.split(path)
    dest = os.path.join('_posts', tail)
    print(dest)
    shutil.copy(path, dest)

def is_valid(file):
    if file.endswith('.md') or file.endswith('.html'):
        return file
    else:
        raise argparse.ArgumentTypeError(f'Bad file type')
if __name__ == "__main__" :
    parser = argparse.ArgumentParser()
    parser.add_argument('input_files', nargs='+', type=is_valid)
    args=parser.parse_args()
    for path in args.input_files:
        publish_file(path)
