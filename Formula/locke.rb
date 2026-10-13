class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/releases/releases/download/locke-0.4.0/locke-0.4.0.zip"
  version "0.4.0"
  sha256 "5336e14bda518524379c02cb013814e3e54aa96ec8f63eaaa261c3620c2803ce"
  license :cannot_represent

  def install
    # Preserve .app.json and .codex-plugin as well as the executable skills.
    libexec.install buildpath.children
    (bin/"locke").write <<~EOS
      #!/bin/sh
      case "${1:-setup}" in
        path) echo "#{opt_libexec}" ;;
        version|--version) echo "0.4.0" ;;
        setup|install|help|--help)
          cat <<'LOCKE_HELP'
      Locke 0.4.0
      Local plugin: #{opt_libexec}

      Load this directory using your host's supported local plugin controls.
      For a ZIP import, download https://download.locke.chamberlain.agency/.
      In your own ChatGPT account, attach that ZIP to Plugin Creator and ask
      for an unchanged private import, then install its returned plugin.
      Install/connect Google Drive and select your destination folder once.
      Enable capture for future chats; trust the native Codex hooks.
      Web setup provides one instruction to add to Custom Instructions.

      The host must load executable skills, provide Node execution and expose
      its connected Google Drive tools. This command stages the plugin; it
      does not register an agent, create a Drive folder or run an MCP server.
      LOCKE_HELP
          ;;
        *) echo "Usage: locke [setup|path|version]" >&2; exit 2 ;;
      esac
    EOS
    (bin/"locke").chmod 0755
  end

  def caveats
    <<~EOS
      Run `locke setup` for the installed plugin path and import instructions.
      Capture uses your host's connected Google Drive tools and Node execution.
    EOS
  end
end
