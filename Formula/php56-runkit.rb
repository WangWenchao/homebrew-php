require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php56Runkit < AbstractPhp56Extension
  init
  homepage 'http://php.net/manual/en/book.runkit.php'
  url 'https://github.com/zenovich/runkit/archive/27f33f55eae4459448fc39fac49daba26bb6b575.tar.gz'
  sha1 '16da4d06156061e65a637f766bfa5ea49455b9be'
  head 'https://github.com/zenovich/runkit.git'
  version '5e179e9'

  
  patch do
    url "https://github.com/zenovich/runkit/pull/71.diff"
    sha1 "c5ede24d0200d728e73ba19d3d22df1b496d0fc7"
  end

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/runkit.so"
    write_config_file if build.with? "config-file"
  end
end
