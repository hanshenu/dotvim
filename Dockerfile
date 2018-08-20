FROM ubuntu:18.04

ADD ./apt-sources.list.ubuntu.18.04 /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y tmux gdb cmake ctags ack-grep curl wget libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.3 lua5.3-dev libperl-dev git

RUN cd ~ && \
    git clone https://github.com/vim/vim.git && \
    cd vim && \
    ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr && \
    make && make install


ADD tmux.conf /root/.tmux.conf
RUN echo "alias tmux='tmux -2'" >> /root/.bashrc

ADD ycm_extra_conf.py /root/.ycm_extra_conf.py
RUN curl --insecure -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ADD vimrc /root/.vimrc

RUN mkdir -p /root/.vim/plugged/ && \
    cd /root/.vim/plugged/ && \
    git clone https://github.com/Valloric/YouCompleteMe.git && \
    cd YouCompleteMe && \
    git submodule update --init --recursive && \
    ./install.py --clang-completer

VOLUME ["/root/projects"]



