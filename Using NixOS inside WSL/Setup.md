<h3>Change your root user (nixos) passwd</h3>

By default the sudo user does not have any password. You can change that by running:

```bash
sudo passwd nixos
```

<h3>Make WSL connect to the internet</h3>
Type in the following command:

```bash
sudo nano /etc/resolv.conf
```

And change the `nameserver` value to `8.8.8.8` and save the file. You should now be able to connect to the internet.

If you are able to connect to the internet now then you may also need to stop WSL from resetting this file when opening future terminals. You can do that by running these commands:

```bash
sudo rm /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
sudo chattr +i /etc/resolv.conf
```

