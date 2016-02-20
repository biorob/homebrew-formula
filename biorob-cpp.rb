require 'formula'

class BiorobCpp < Formula
  homepage 'https://ponyo.epfl.ch/gitlab/core/projects/biorob-cpp'
  head 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git
  url 'https://ponyo.epfl.ch/gitlab/core/biorob-cpp.git' , :using => :git, :tag => 'v0.4.1'
  version '0.4.1'

  option :universal

  depends_on 'cmake' => :build
  depends_on 'biorob-cmake-utils' => :build
  depends_on 'pkgconfig' => :build
  depends_on 'glog'
  def install
    ENV.universal_binary if build.universal?
    
    args = std_cmake_args
    args << "-DCMAKE_BUIDL_TYPE=Release"


    system "cmake", ".", *args
    system "make install" 
  end

  def test
    system "make check"
  end
end
