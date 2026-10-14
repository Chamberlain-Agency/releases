class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/releases/releases/download/locke-0.4.3/locke-0.4.3.zip"
  version "0.4.3"
  sha256 "a64c3452d4ce404b0aaf0c515a1b2b3c91e8dc961cf9e2342321aabb4f0d9b98"
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
