FROM ubuntu:16.04



RUN export BOOST_ROOT=$HOME/opt/boost_1_66_0  && \
    apt-get update && \
    apt --assume-yes install git cmake autotools-dev build-essential g++ python-dev libicu-dev libbz2-dev wget && \
#   echo done
# RUN \ 
    echo "Installing Boost" && \
    wget -O boost_1_66_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.66.0/boost_1_66_0.tar.gz/download  && \
    tar xzvf boost_1_66_0.tar.gz  && \
    cd boost_1_66_0  && \
    ./bootstrap.sh "--prefix=$BOOST_ROOT"  && \
    export BOOST_BUILD=$HOME/opt/boost_1_63_0.BUILD  && \
    ./b2 --prefix=$BOOST_ROOT --build-dir=$BOOST_BUILD link=static install && \
#   echo done
# RUN \ 
    echo "Installing QT5" && \
    apt-get --assume-yes install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler && \
#   echo done
# RUN \ 
    echo "Installing RAI_WALLET" && \
    export BOOST_ROOT=$HOME/opt/boost_1_66_0  && \
    cd ~ && \
    git clone https://github.com/clemahieu/raiblocks && \
    cd raiblocks && \
    git submodule update --init --recursive && \
    cmake -G "Unix Makefiles" -DRAIBLOCKS_GUI=ON -DBOOST_ROOT="$BOOST_ROOT"  && \
#   echo done
# RUN \ 
    cd ~/raiblocks && \
    make rai_wallet && \
    cp rai_wallet .. && cp librai_lib.so  .. && \
#   echo done
# RUN \ 
    echo "Cleaning" && \
    rm -rf /root/RaiBlocks && \
    rm -rf /root/opt && \
    rm -rf /root/raiblocks && \
    rm -rf /boost_1_66_0 && \
    rm -rf /boost_1_66_0.tar.gz && \
    rm -rf /root/.wget-hsts && \
    rm -rf /root/.bash_history && \
    apt-get --assume-yes remove git cmake autotools-dev build-essential g++ python-dev libicu-dev libbz2-dev wget && \
    apt-get --assume-yes remove qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler && \
    apt-get --assume-yes autoremove && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/*








#ENV DISPLAY=$DISPLAY
#VOLUME ["/tmp/.X11-unix:/tmp/.X11-unix:rw"]
CMD /root/rai_wallet

