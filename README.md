# homebrew-klok

A [Homebrew](https://brew.sh) tap for [Klok](https://getklok.io) - an AI assistant that learns you
and your company, answers your questions and runs work for you on schedules and events.

## Install

```sh
brew install --cask eirsyl/klok/klok
```

That expands to tapping `eirsyl/homebrew-klok` and installing the `klok` cask from it. Klok is
signed with a Developer ID certificate and notarized by Apple, so it opens on a machine that has
never seen it before.

Apple silicon and Intel Macs each get their own build. Homebrew picks the right one.

## Update

Klok updates itself: it downloads new versions in the background and installs them the next time
it quits. The cask says so with `auto_updates true`, so `brew upgrade` leaves the app alone rather
than fighting the updater over which version is on disk.

## Uninstall

```sh
brew uninstall --cask klok
```

Add `--zap` to also remove Klok's settings and anything it has not finished uploading.

## What's here

- `Casks/klok.rb` - the cask, written by Klok's own release script.
- GitHub Releases - the signed, notarized `.dmg` and `.zip` for each architecture, and
  `latest-mac.yml`, which is the manifest installed copies read to find out there is a newer one.

Requires macOS 13 or later.
