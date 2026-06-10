import numpy as np
import matplotlib.pylab as plt

def plot_data(x, y, theta=None, theta_0=None, final=False):
    fig, ax = plt.subplots(figsize=(6, 6))
    for i in range(x.shape[0]):
        x1 = x[i, 0]
        x2 = x[i, 1]

        if y[i] == -1:
            ax.plot(x1, x2, 'ro')
            ax.text(x1 + 0.1, x2 + 0.1, '-', color='red', fontsize=14)

        else:
            ax.plot(x1, x2, 'go')
            ax.text(x1 + 0.1, x2 + 0.1, '-', color='green', fontsize=14)

        if theta is not None and theta[1] != 0:
            x_vals = np.linspace(-3, 3, 100)
            theta1 = theta[0]
            theta2 = theta[1]
            y_vals = -(theta1/theta2) * x_vals - (theta_0 / theta2)
            ax.plot(x_vals, y_vals, 'b-')

            norm_eq = np.dot(theta, theta)
            x0 = -(theta_0 / norm_eq) * theta

            ax.plot([x0[0], theta1], [x0[1], theta2])
            # print(theta1, theta2, theta_0)

    ax.set_xlim([-3, 3])
    ax.set_ylim([-3.5, 3.5])
    ax.set_xlabel("x1")
    ax.set_xlabel("x2")
    ax.set_title("Perceptron")
    ax.grid(True)

    if final:
        plt.show()
    else:
        plt.show(block=False)
        plt.pause(0.1)

T = 3

x = np.array([
    [2, -3],
    [0, -1],
    [2, -1],
    [0, 1],
    [-2, 1],
    [-2, 3]
], dtype=float)

y = np.array([-1, -1, 1, 1, -1, 1], dtype=float)

theta = np.zeros(x[1].shape)
theta_0 = 0.0

for t in range(T):
    for i in range(x.shape[0]):
        if y[i] * (np.dot(theta, x[i]) + theta_0) <= 0:
            theta = theta + y[i]*x[i]
            theta_0 = theta_0 + y[i]

            plot_data(x, y, theta, theta_0)
            input("Press enter to continue")
            plt.close()
    print(t)
    print(theta)
    print(theta_0)

plot_data(x, y, theta, theta_0, final=True)
print("\n")
print(theta)
print(theta_0)

