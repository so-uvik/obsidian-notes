
Images are the basic building blocks for containers and other images. When you "containerize" an application you work towards creating the image.

By learning what images are and how to create them, you'll be ready to start utilizing containers in your own projects.

### A detailed look into an image

Let's go back to a more relevant image than 'hello-world', the Ubuntu image, one of the most common Docker images to use as a base for your own image.

Let's pull Ubuntu and look at the first lines:

```sh
$ docker pull ubuntu
  Using default tag: latest
  latest: Pulling from library/ubuntu
```

Since we didn't specify a tag, Docker defaulted to `==latest==`, which is usually the latest image built and pushed to the registry. **However**, in this case, the repository's [README (opens in a new tab)](https://hub.docker.com/_/ubuntu) [(opens in a new tab)](https://hub.docker.com/_/ubuntu)

says that the `==ubuntu:latest==` tag points to the "latest LTS" instead since that's the version recommended for general use.

Images can be tagged to save different versions of the same image. You define an image's tag by adding `==:<tag>==` after the image's name.

### Building Images

Finally, we get to build our own images and get to talk about [`Dockerfile` (opens in a new tab)](https://docs.docker.com/engine/reference/builder/) [(opens in a new tab)](https://docs.docker.com/engine/reference/builder/)

 and why it's so great.

Dockerfile is simply a file that contains the build instructions for an image. You define what should be included in the image with different instructions. We'll learn about the best practices here by creating one.