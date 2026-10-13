# Chamberlain Agency releases

Public release files and Homebrew formulas for Impressive and Locke. Product source repositories remain private. Each product retains its included license; publication grants no additional rights.

## Homebrew

```sh
brew tap Chamberlain-Agency/releases https://github.com/Chamberlain-Agency/releases.git
brew install Chamberlain-Agency/releases/impressive && impressive setup
```

Locke:

```sh
brew tap Chamberlain-Agency/releases https://github.com/Chamberlain-Agency/releases.git
brew install Chamberlain-Agency/releases/locke && locke setup
```

## npm

```sh
npm install -g https://impressive.chamberlain.agency/downloads/impressive.tgz && impressive setup
npm install -g https://github.com/Chamberlain-Agency/releases/releases/download/locke-0.4.0/locke-0.4.0.tgz && locke setup
```

These are downloadable npm packages; no npm registry publication is implied. Impressive connects through your agent's standard local MCP settings. Locke stages the existing plugin files and shows their location; host import and your own Google Drive connection remain required.

ZIPs and npm tarballs are attached to [GitHub Releases](https://github.com/Chamberlain-Agency/releases/releases). Checksums are in `releases/`. [Impressive install guide](https://impressive.chamberlain.agency/downloads/INSTALL-impressive.md) · [Locke](https://locke.chamberlain.agency/) · [Permanent Locke download](https://download.locke.chamberlain.agency/).

Locke 0.4.0 retains seven skills and adds native Codex lifecycle hooks plus one-time ChatGPT Web setup. Google Drive is required before capture state is created. Enable future-chat capture after choosing a folder; review/trust Codex hooks or add the generated Web instruction to existing Custom Instructions. Web final replies remain pending until the next turn where no completion callback is available. Download distribution only; no plugin-directory submission.
