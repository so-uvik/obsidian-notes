## What is DevOps?

Before we get started with Docker let's lay the groundwork for learning the right mindset. Defining DevOps is not a trivial task but the term itself consists of two parts, _Dev_ and _Ops_. _Dev_ refers to the development of software and _Ops_ to operations. Simple definition for DevOps would be that it means the release configuring, and monitoring of software is in the hands of the very people who 
develop it.

## What is Docker?

>[!quote]
> Docker makes development efficient and predictable
> Docker takes away repetitive, mundane configuration tasks and is used throughout the development lifecycle for fast, easy and portable application development – desktop and cloud. Docker’s comprehensive end to end platform includes UIs, CLIs, APIs and security that are engineered to work together across the entire application delivery lifecycle.
> 
> -- The [Docker](https://www.docker.com/) team

Put simply: Docker allows us to deploy our applications inside "containers", which are kind of like _very_ lightweight virtual machines. Instead of just shipping an application, we can ship an application _and the environment it runs in_.

## Virtual Machines VS Containers

Virtual Machines (VMs) run on a [hypervisor (opens in a new tab)](https://en.wikipedia.org/wiki/Hypervisor)  , which virtualizes the physical hardware. Each VM includes a full operating system (OS) along with the necessary binaries and libraries, making them heavier and more resource-intensive. Containers, on the other hand, share the host OS kernel and only package the application and its dependencies, resulting in a more lightweight and efficient solution.

VMs provide strong isolation and are suited for running multiple OS environments, but they have a performance overhead and longer startup times. Containers offer faster startup, better resource utilization, and high portability across different environments, though their isolation is at the process level, which may not be as robust as that of VMs. Overall, VMs could be used for scenarios needing complete OS environments, while containers excel in lightweight, efficient, and consistent application deployment.

Containers, on the other hand, gives us 90% of the benefits of virtual machines, but are _super_ lightweight. _Containers boot up in seconds, while virtual machines can take minutes._

### Why Are Containers Lightweight?

Virtual machines virtualize _hardware_, they emulate what a physical computer does at a low level. Containers virtualize at the _operating system_ level. Isolation between containers that are running on the same machine is still _really good_. For the most part, each container _feels like_ it has its own operating and filesystem. In reality, a lot of resources are being shared, but they're being shared securely through [namespaces](https://docs.docker.com/engine/security/userns-remap/).

![[01-03-tradeoffs.webp]]

## Images and Containers

- **Image**: A read-only _definition_ of a container
- **Container**: an _instance_ of a virtualized read-write environment

A container is basically an image that's **actively running**. In other words, you boot up a container _from_ an image. You can create multiple separate containers all from the same image (it's _kinda_ like the relationship between classes and objects).

# Run a Container

You can now download the [getting started image](https://hub.docker.com/r/docker/getting-started), using `docker run hello-world` _run_ it inside a new container. The `docker run` command starts a new container from an image. Let's break down the syntax:

```bash
# this is just an example, don't run this
docker run -d -p hostport:containerport namespace/name:tag
```

- `-d`: Run in detached mode (doesn't block your terminal)
- `-p`: Publish a container's port to the host (forwarding)
- `hostport`: The port on your local machine
- `containerport`: The port inside the container
- `namespace/name`: The name of the image (usually in the format `username/repo`)
- `tag`: The version of the image (often `latest`)