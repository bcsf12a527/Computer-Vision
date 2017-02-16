import cv2
from matplotlib import pyplot

img = cv2.imread('psycho_triangle.jpg', 0)
edges = cv2.Canny(img, 100, 200)

pyplot.subplot(121), pyplot.imshow(img, cmap='gray')
pyplot.title('Original Image'), pyplot.xticks([]), pyplot.yticks([])
pyplot.subplot(122), pyplot.imshow(edges, cmap='gray')
pyplot.title('Edge Image'), pyplot.xticks([]), pyplot.yticks([])

pyplot.show()
