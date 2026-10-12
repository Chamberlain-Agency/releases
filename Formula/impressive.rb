class Impressive < Formula
  desc "Build and edit WordPress/Bricks websites through your AI assistant"
  homepage "https://impressive.chamberlain.agency/"
  url "https://github.com/yaw-sh/releases/releases/download/impressive-0.4.0-unified.7/impressive-0.4.0-unified.7.zip"
  version "0.4.0-unified.7"
  sha256 "90a69d2373e103dd22f0fd729045e5c3a47c5d9bc1c8a044eb1f3f17e3e7a8d5"
  license :cannot_represent

  depends_on "python@3.13"

  def install
    libexec.install Dir["*", ".agents", ".codex-plugin", ".mcp.json"]
    (bin/"impressive").write <<~EOS
      #!/bin/sh
      if [ "${1:-}" = "serve" ]; then
        shift
        exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{opt_libexec}/engine/impressive.py" serve "$@"
      fi
      if [ "${1:-}" = "config" ]; then
        shift
        exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{opt_libexec}/helpers/install.py" --stage --connection "$@"
      fi
      if [ "${1:-}" = "setup" ] || [ "${1:-}" = "install" ]; then shift; fi
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{opt_libexec}/helpers/install.py" --stage "$@"
    EOS
    (bin/"impressive").chmod 0755
  end

  def caveats
    <<~EOS
      Run `impressive setup`, then connect your agent through its MCP settings.
      `impressive config --format entry` prints the command and arguments.
      Impressive is free for personal, noncommercial use only.
      Full terms: https://impressive.chamberlain.agency/downloads/LICENSE.txt
    EOS
  end
end
