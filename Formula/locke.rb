class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/releases/releases/download/locke-0.4.10/locke-0.4.10.zip"
  version "0.4.10"
  sha256 "f0de3e2d388db30261849365155292507cea722c6a943bacebeb910736f10ef3"
  license :cannot_represent
  depends_on "node"
  def install
    libexec.install buildpath.children
    (bin/"locke").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{opt_libexec}/runtime/launcher.mjs" "$@"
    EOS
    (bin/"locke").chmod 0755
  end
  def caveats
    "Installation: https://locke.chamberlain.agency/install.md"
  end
end
