class JsonSpirit < Formula
  desc "C++ JSON parser/generator"
  homepage "https://www.codeproject.com/Articles/20027/JSON-Spirit-A-C-JSON-Parser-Generator-Implemented"
  url "https://github.com/png85/json_spirit/archive/json_spirit-4.0.8.tar.gz"
  # Current release is misnamed on GitHub, previous versioning scheme and homepage
  # dictate the release as "4.08".
  version "4.08"
  sha256 "43829f55755f725c06dd75d626d9e57d0ce68c2f0d5112fe9a01562c0501e94c"
  license "MIT"

  bottle do
    sha256 cellar: :any, arm64_big_sur: "ef7641e5dd587a4595e326e74f438c9f99e411acceaeee75dc7450835e126895"
    sha256 cellar: :any, big_sur:       "850ab2dda8c7ca10c88a25cf0fe971d8aeaee0d5942c44eea746fc44fc857f7d"
    sha256 cellar: :any, catalina:      "31aaf302e4238b13797722028ac46a7deade1df4f042b46feb7d455cb05e4599"
    sha256 cellar: :any, mojave:        "2cec376e843919e2f3693e73be0e3a2c6a6f3b283e503b51d42108c5471e8091"
    sha256 cellar: :any, high_sierra:   "55299a7931b4bbbcf1ee5c576fe35283373279cc95b3b5126696ad5741f3d072"
    sha256 cellar: :any, sierra:        "0dc2370a736a065b47f6f83f8ed292209fc978005a720de8653e32cc1c568cce"
  end

  depends_on "cmake" => :build
  depends_on "boost"

  def install
    args = std_cmake_args
    args << "-DBUILD_STATIC_LIBRARIES=ON"

    system "cmake", *args
    system "make"

    args = std_cmake_args
    args << "-DBUILD_STATIC_LIBRARIES=OFF"
    system "cmake", *args
    system "make", "install"
  end
end
