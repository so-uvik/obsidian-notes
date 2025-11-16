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

Virtual Machines (VMs) run on a [hypervisor (opens in a new tab)](https://en.wikipedia.org/wiki/Hypervisor) , which virtualizes the physical hardware. Each VM includes a full operating system (OS) along with the necessary binaries and libraries, making them heavier and more resource-intensive. Containers, on the other hand, share the host OS kernel and only package the application and its dependencies, resulting in a more lightweight and efficient solution.

VMs provide strong isolation and are suited for running multiple OS environments, but they have a performance overhead and longer startup times. Containers offer faster startup, better resource utilization, and high portability across different environments, though their isolation is at the process level, which may not be as robust as that of VMs. Overall, VMs could be used for scenarios needing complete OS environments, while containers excel in lightweight, efficient, and consistent application deployment.

![[01-03-tradeoffs.webp]]
