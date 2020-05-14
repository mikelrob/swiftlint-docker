FROM cimg/base:2020.05

LABEL maintainer="Community & Partner Engineering Team <community-partner@circleci.com>"

ENV SWIFTLINT_VERSION 0.39.2
ENV SWIFT_VERSION 5.2.3

# Install Swift
WORKDIR /home/circleci
RUN sudo apt-get update && sudo apt-get install binutils git libc6-dev libcurl4 libedit2 libgcc-5-dev libpython2.7 libsqlite3-0 libstdc++-5-dev libxml2 pkg-config tzdata zlib1g-dev && \
    wget https://swift.org/builds/swift-${SWIFT_VERSION}-release/ubuntu1804/swift-${SWIFT_VERSION}-RELEASE/swift-${SWIFT_VERSION}-RELEASE-ubuntu18.04.tar.gz && \
    mkdir /home/circleci/swift && \
    tar xzf swift-${SWIFT_VERSION}-RELEASE-ubuntu18.04.tar.gz --strip 1 -C /home/circleci/swift && \
    sudo cp -r /home/circleci/swift/usr/* /usr/local

# Install SwiftLint
RUN git clone https://github.com/realm/SwiftLint.git
WORKDIR /home/circleci/SwiftLint
RUN git checkout tags/${SWIFTLINT_VERSION} && \
    git submodule update --init --recursive; sudo make install
WORKDIR /home/circleci
RUN sudo rm -rf SwiftLint && \
    swiftlint version

WORKDIR /home/circleci/project
