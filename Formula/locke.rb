class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/releases/releases/download/locke-0.4.4/locke-0.4.4.zip"
  version "0.4.4"
  sha256 "d36cf6a1da4b6a2e32c2532ec39f15371ebc5248b27de614d277167c79ad0a32"
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
