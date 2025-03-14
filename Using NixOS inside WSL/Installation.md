Download the latest nixos.wsl from the Github repository:

```sh
https://github.com/nix-community/NixOS-WSL
```

Make sure you have wsl installed and then run:

```sh
wsl --install --from-file ./path-to-the-nixOS-file
```

>[!note]
>The above command will install the operating system in your C: drive. If you dont want that run:
>
```sh
wsl --import NixOS D:\folder-you-would-like-to-have-it-installed .\nixos.wsl
```

Then start NixOS using:

```sh
wsl -d NixOS
```


