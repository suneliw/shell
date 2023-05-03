#!/bin/bash

# 检查系统是否已经安装zsh和git
if ! [ -x "$(command -v zsh)" ] || ! [ -x "$(command -v git)" ]
then
  echo "需要先安装 zsh 和 git"
  exit 1
fi

# 安装oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]
then
  echo "oh-my-zsh已经安装"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 安装zsh-syntax-highlighting插件
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]
then
  echo "zsh-syntax-highlighting插件已经安装"
else
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

# 安装zsh-autosuggestions插件
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]
then
  echo "zsh-autosuggestions插件已经安装"
else
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# 修改.zshrc文件
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' $HOME/.zshrc

# 重新启动zsh
exec zsh
