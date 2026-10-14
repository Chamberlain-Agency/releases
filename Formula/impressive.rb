class Impressive < Formula
  desc "Build and edit WordPress/Bricks websites through your AI assistant"
  homepage "https://impressive.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/releases/releases/download/impressive-0.4.0-unified.13/impressive-0.4.0-unified.13.zip"
  version "0.4.0-unified.13"
  sha256 "b98eaedbbdd19908eabc1518fe9011fa1bc5674163f35a4dddce21173ee8056d"
  license :cannot_represent

  depends_on "python@3.13"

  def install
    libexec.install Dir["*", ".agents", ".codex-plugin", ".mcp.json"]
    (bin/"impressive").write <<~EOS
      #!/bin/sh
      if [ "${1:-}" = "update" ]; then
        shift
        exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{opt_libexec}/helpers/updates.py" "$@"
      fi
      if [ "${1:-}" = "--version" ]; then
        exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{opt_libexec}/helpers/updates.py" version
      fi
      if [ "${1:-}" = "serve" ]; then
        shift
        IMPRESSIVE_EXECUTION_MODE="${IMPRESSIVE_EXECUTION_MODE:-installer}" exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{opt_libexec}/engine/impressive.py" serve "$@"
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
