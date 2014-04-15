require "formula"

class Restli < Formula
  homepage "http://rest.li/"
  url "http://rest.li/releases/restli-tool/0.0.1/restli-0.0.1.tar.gz"
  sha1 "dceab18f7cbc2aba0f4738ebd9cfa2501846988a"
  
  depends_on "giter8"

  def install
    bin.install 'restli'
  end

  test do
    system "#{bin}/restli"
  end
end
