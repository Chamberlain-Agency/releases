class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/releases/releases/download/locke-0.4.11/locke-0.4.11.zip"
  version "0.4.11"
  sha256 "bf61a588745cb4168d222d1dc2b9abe58e42202080308b931e5bfc30de02c1c6"
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
