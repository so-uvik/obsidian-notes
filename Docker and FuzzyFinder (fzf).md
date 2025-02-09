All we know that _many devs_ spend tons of hours using the terminal, although it’s cool, sometimes it can become a pain when the things you want to express are too long, that’s what’s been happening to me with docker, you should know what I mean.

That’s why I want to show you how to create custom commands and comfortable interactive menus in your terminal by using the amazing project [FuzzyFinder](https://github.com/junegunn/fzf) to make your life easier.

_fzf_ is a general-purpose command-line fuzzy finder that can be used to create custom interactive menus from the terminal, learn more in the [github repository](https://github.com/junegunn/fzf), first of all install _fzf_ in your system:

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf  
~/.fzf/install
```

I’ve made the hardest part for you by _learning_ bash and coding all the examples in this article, to make it work, you just have to add them to your _.bash_profile_ and reload it in your current session, by the way, Bash 4 is a requirement to make them work.

```bash
vim ~/.bash_profile     # edit  
source ~/.bash_profile  # reload
```

## Running containers

The first command is **runc**, which is from now an amazing command to run a new container by selecting the docker image from a interactive menu

![[1_lRHYFLuJHotqevMJBt2BVA.gif]]

```bash
|   |
|---|
|runc() {|

|   |
|---|
|export FZF_DEFAULT_OPTS='--height 90% --reverse --border'|

|   |
|---|
|local image=$(docker images --format '{{.Repository}}:{{.Tag}}' \| fzf-tmux --reverse --multi)|

|   |
|---|
|if [[ $image != '' ]]; then|

|   |
|---|
|echo -e "\n \033[1mDocker image:\033[0m" $image|

|   |
|---|
|read -e -p $' \e[1mOptions: \e[0m' -i "-it --rm" options|

|   |
|---|
||

|   |
|---|
|printf " \033[1mChoose the command: \033[0m"|

|   |
|---|
|local cmd=$(echo -e "/bin/bash\nsh" \| fzf-tmux --reverse --multi)|

|   |
|---|
|if [[ $cmd == '' ]]; then|

|   |
|---|
|read -e -p $' \e[1mCustom command: \e[0m' cmd|

|   |
|---|
|fi|

|   |
|---|
|echo -e " \033[1mCommand: \033[0m" $cmd|

|   |
|---|
||

|   |
|---|
|export FZF_DEFAULT_COMMAND='find ./ -type d -maxdepth 1 -exec basename {} \;'|

|   |
|---|
|printf " \033[1mChoose the volume: \033[0m"|

|   |
|---|
|local volume=$(fzf-tmux --reverse --multi)|

|   |
|---|
|local curDir=${PWD##*/}|

|   |
|---|
|if [[ $volume == '.' ]]; then|

|   |
|---|
|echo -e " \033[1mVolume: \033[0m" $volume|

|   |
|---|
|volume="`pwd`:/$curDir -w /$curDir"|

|   |
|---|
|else|

|   |
|---|
|echo -e " \033[1mVolume: \033[0m" $volume|

|   |
|---|
|volume="`pwd`/$volume:/$volume -w /$volume"|

|   |
|---|
|fi|

|   |
|---|
||

|   |
|---|
|export FZF_DEFAULT_COMMAND=""|

|   |
|---|
|export FZF_DEFAULT_OPTS=""|

|   |
|---|
||

|   |
|---|
|history -s runc|

|   |
|---|
|history -s docker run $options -v $volume $image $cmd|

|   |
|---|
|echo ''|

|   |
|---|
|docker run $options -v $volume $image $cmd|

|   |
|---|
|fi|

}
```

## Running commands in already running containers

Sometimes you just need to run a command in already running container, but it’s pretty annoying to list all the running containers just to get the container’s ID or name, now you can have **runinc**

![[1_lRHYFLuJHotqevMJBt2BVA 1.gif]]

```bash
|   |
|---|
|runinc() {|

|   |
|---|
|export FZF_DEFAULT_OPTS='--height 90% --reverse --border'|

|   |
|---|
|local container=$(docker ps --format '{{.Names}} => {{.Image}}' \| fzf-tmux --reverse --multi \| awk -F '\\=>' '{print $1}')|

|   |
|---|
|if [[ $container != '' ]]; then|

|   |
|---|
|echo -e "\n \033[1mDocker container:\033[0m" $container|

|   |
|---|
|read -e -p $' \e[1mOptions: \e[0m' -i "-it" options|

|   |
|---|
|if [[ $@ == '' ]]; then|

|   |
|---|
|read -e -p $' \e[1mCommand: \e[0m' cmd|

|   |
|---|
|else|

|   |
|---|
|cmd="$@"|

|   |
|---|
|fi|

|   |
|---|
|echo ''|

|   |
|---|
|history -s runinc "$@"|

|   |
|---|
|history -s docker exec $options $container $cmd|

|   |
|---|
|docker exec $options $container $cmd|

|   |
|---|
|echo ''|

|   |
|---|
|fi|

|   |
|---|
|export FZF_DEFAULT_OPTS=""|

}
```

## Stopping/Removing containers

Stop or a remove a container choosing it from a fancy menu, removing is optional.

![[1_lRHYFLuJHotqevMJBt2BVA 2.gif]]

```bash
|   |
|---|
|# Stops and/or removes a docker container|

|   |
|---|
|stopc() {|

|   |
|---|
|export FZF_DEFAULT_OPTS='--height 90% --reverse --border'|

|   |
|---|
|local container=$(docker ps --format '{{.Names}} => {{.Image}}' \| fzf-tmux --reverse --multi \| awk -F '\\=>' '{print $1}')|

|   |
|---|
|if [[ $container != '' ]]; then|

|   |
|---|
|echo -e "\n \033[1mDocker container:\033[0m" $container|

|   |
|---|
|printf " \033[1mRemove?: \033[0m"|

|   |
|---|
|local cmd=$(echo -e "No\nYes" \| fzf-tmux --reverse --multi)|

|   |
|---|
|if [[ $cmd != '' ]]; then|

|   |
|---|
|if [[ $cmd == 'No' ]]; then|

|   |
|---|
|echo -e "\n Stopping $container ...\n"|

|   |
|---|
|history -s stopc|

|   |
|---|
|history -s docker stop $container|

|   |
|---|
|docker stop $container > /dev/null|

|   |
|---|
|else|

|   |
|---|
|echo -e "\n Stopping $container ..."|

|   |
|---|
|history -s stopc|

|   |
|---|
|history -s docker stop $container|

|   |
|---|
|docker stop $container > /dev/null|

|   |
|---|
||

|   |
|---|
|echo -e " Removing $container ...\n"|

|   |
|---|
|history -s stopc|

|   |
|---|
|history -s docker rm $container|

|   |
|---|
|docker rm $container > /dev/null|

|   |
|---|
|fi|

|   |
|---|
|fi|

|   |
|---|
|fi|

|   |
|---|
|export FZF_DEFAULT_OPTS=""|

}
```

## Getting the container’s IP Address

Inspect the IP address quickly choosing the container from the menu by running **showipc**

![[1_lRHYFLuJHotqevMJBt2BVA 3.gif]]

```bash
|   |
|---|
|showipc() {|

|   |
|---|
|export FZF_DEFAULT_OPTS='--height 90% --reverse --border'|

|   |
|---|
|local container=$(docker ps -a --format '{{.Names}} => {{.Image}}' \| fzf-tmux --reverse --multi \| awk -F '\\=>' '{print $1}')|

|   |
|---|
||

|   |
|---|
|if [[ $container != '' ]]; then|

|   |
|---|
|local network=$(docker inspect $container -f '{{.NetworkSettings.Networks}}' \| awk -F 'map\\[\|:' '{print $2}')|

|   |
|---|
|echo -e "\n \033[1mDocker container:\033[0m" $container|

|   |
|---|
|history -s showipc|

|   |
|---|
|history -s docker inspect -f "{{.NetworkSettings.Networks.${network}.IPAddress}}" $container|

|   |
|---|
|echo -e " \033[1mNetwork:\033[0m" $network|

|   |
|---|
|echo -e " \033[1mIP Address:\033[0m" $(docker inspect -f "{{.NetworkSettings.Networks.${network}.IPAddress}}" $container) "\n"|

|   |
|---|
|fi|

}
```

As you can see, these are just few examples about how to operate with fzf and docker, you can adapt them to make them work as you want, hope you find it useful and suggestions or new commands are welcome.