import numpy as np
from mpl_toolkits.mplot3d import Axes3D
from scipy.misc import imread
from scipy import misc
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import argparse
import os.path
# https://matplotlib.org/users/colors.html
# https://matplotlib.org/mpl_toolkits/mplot3d/tutorial.html
# https://imgur.com/a/aRBd1
# Colors are an RGB or RGBA tuple of floats in [0, 1]

def plot(imagePath):
    """
    Plot an image as a 3D scatter plot

    imagePath: Filepath for image to plot. Must be small or this will take forever
    """
    image = mpimg.imread(imagePath)
    flatImage = np.reshape(image, (image.shape[0] * image.shape[1], 3))
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    colors = [tuple(image[r, c,:] / 255) for r in range(image.shape[0]) for c in range(image.shape[1])]
    ax.scatter(
        flatImage[:,0],
        flatImage[:,1],
        flatImage[:,2], c=colors)
    ax.set_title(os.path.basename(imagePath), y=1.1)
    ax.set_xlabel('Red')
    ax.xaxis.label.set_color('red')
    ax.set_ylabel('Green')
    ax.yaxis.label.set_color('green')
    ax.set_zlabel('Blue')
    ax.zaxis.label.set_color('blue')

    imageaxis = fig.add_axes([-0.15, 0.7, 0.35, 0.3], anchor = "NE")
    # fig.figimage(im, fig.bbox.xmax - width, height)
    imageaxis.imshow(image)
    imageaxis.axis('off')

    plt.show()

def is_valid_image(arg):
    """
    Verifies that a given argument is a valid image files

    arg: string representing filepath

    Returns
    -------
    img : A W*H*3 array representing a color image
    """

    if not os.path.isfile(arg):
        raise argparse.ArgumentTypeError(f"{arg} does not exist!")
    else:
        try:
            img = mpimg.imread(arg)
            return arg
        except IOError:
            raise argparse.ArgumentTypeError(f"{arg} isn't a valid image file!")
        except:
            raise argparse.ArgumentTypeError(f"Something wrong with input files")

if __name__ =="__main__":
    parser = argparse.ArgumentParser(description='Creates a 3D scatter plot of colors in an image')
    parser.add_argument('input_files', metavar='IMG_PATH', nargs='+',
                        type=is_valid_image, default=['assets/gogh.jpg'],
                        help="An image to graph")
    args = parser.parse_args()
    for path in args.input_files:
        plot(path)
