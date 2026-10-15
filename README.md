# Chamberlain Agency releases

Public release files and Homebrew formulas for Impressive and Locke. Product source repositories remain private. Each product retains its included license; publication grants no additional rights.

## Homebrew

```sh
brew tap Chamberlain-Agency/releases https://github.com/Chamberlain-Agency/releases.git
brew install Chamberlain-Agency/releases/impressive && impressive setup
```

Locke: copy the installation request from https://locke.chamberlain.agency/ into your agent. It follows https://locke.chamberlain.agency/install.md and preserves existing setup.

## npm

```sh
npm install -g https://impressive.chamberlain.agency/downloads/impressive.tgz && impressive setup
npm install -g https://locke.chamberlain.agency/downloads/locke.tgz && locke setup --register codex
```

These are downloadable npm packages; no npm registry publication is implied. Impressive connects through your agent's standard local MCP settings. Locke setup registers native Codex with automatic updates; Web uses private import/update controls. Each customer uses their own connected Google Drive plugin.

ZIPs and npm tarballs are attached to [GitHub Releases](https://github.com/Chamberlain-Agency/releases/releases). Checksums are in `releases/`. [Impressive install guide](https://impressive.chamberlain.agency/downloads/INSTALL-impressive.md) · [Locke](https://locke.chamberlain.agency/) · [Permanent Locke download](https://download.locke.chamberlain.agency/).

Locke 0.4.2 retains seven skills and adds native Codex lifecycle hooks plus one-time ChatGPT Web setup. Google Drive is required before capture state is created. Enable future-chat capture after choosing a folder; review/trust Codex hooks or add the generated Web instruction to existing Custom Instructions. Web final replies remain pending until the next turn where no completion callback is available. Download distribution only; no plugin-directory submission.

For native Codex, run `locke codex-install` after package-manager installation, then trust Locke's five hooks through `/hooks`. The installer checks the existing Google Drive connection first and registers a native copy with Codex's supported local plugin source. The ZIP stays a single portable plugin for private ChatGPT Web import.

Locke 0.4.3 adds one copied agent installation request and automatic verified native updates during normal session startup, at most daily, with retained versions and interrupted-switch recovery. Existing Drive bindings, capture settings and pending deliveries remain outside packages.

Locke 0.4.5 adds project save/reopen, authorized Shield work and retained output delivery, bounded native recovery, source-linked context packs, quiet post-answer saving and the final file-transfer repairs. Native updates follow the existing normal-startup channel; Web uses private host controls. Chrome remains deferred and Handoff remains independent.
