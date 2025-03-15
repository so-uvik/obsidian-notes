<h3>Change your root user (nixos) passwd</h3>

By default the sudo user does not have any password. You can change that by running:

Source:
[https://github.com/nix-community/NixOS-WSL/issues/27]

```bash
sudo passwd nixos
```

<h3>Make WSL connect to the internet</h3>
Type in the following command:

```bash
sudo nano /etc/resolv.conf
```

And comment the original `nameserver` line and add a new line that says `nameserver 8.8.8.8` and save the file. You should now be able to connect to the internet.

For more information:
[https://github.com/nix-community/NixOS-WSL/discussions/379]
[https://stackoverflow.com/questions/62314789/no-internet-connection-on-wsl-ubuntu-windows-subsystem-for-linux]

<h4>Setting up a User</h4>


