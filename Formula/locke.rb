class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/yaw-sh/releases/releases/download/locke-0.3.27/locke-0.3.27.zip"
  version "0.3.27"
  sha256 "6dd5447c6fd7600fbd729b935c237229f961f72101f63d1786e85db38923937b"
  license :cannot_represent

  def install
    # Preserve .app.json and .codex-plugin as well as the executable skills.
    libexec.install buildpath.children
    (bin/"locke").write <<~EOS
      #!/bin/sh
      case "${1:-setup}" in
        path) echo "#{opt_libexec}" ;;
        version|--version) echo "0.3.27" ;;
        setup|install|help|--help)
          cat <<'LOCKE_HELP'
      Locke 0.3.27
      Local plugin: #{opt_libexec}

      Load this directory using your host's supported local plugin controls.
      For a ZIP import, download https://download.locke.chamberlain.agency/.
      In your own ChatGPT account, attach that ZIP to Plugin Creator and ask
      for an unchanged private import, then install its returned plugin.
      Connect Google Drive in your account and select your destination folder.
      Enroll capture once; optional folder setup is a separate start action.

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
