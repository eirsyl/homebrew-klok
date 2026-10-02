cask "klok" do
  arch arm: "arm64", intel: "x64"

  version "0.0.10"
  sha256 arm:   "3eef7372035e064b3fe3980027c5f5f9ae3add26c5bc08127afa456e2d521afc",
         intel: "2e1bc021017e38d0e2e67b48d27471d0e136046a0262ed046fe7a01c05948a83"

  # Klok's own URL rather than the release host's, so the cask keeps working if the files ever move.
  url "https://app.getklok.io/downloads/mac/Klok-#{version}-#{arch}.dmg"
  name "Klok"
  desc "AI assistant that learns you and your company"
  homepage "https://getklok.io/"

  livecheck do
    url "https://app.getklok.io/downloads/mac/latest-mac.yml"
    strategy :page_match
    regex(/^version:\s*(\d+(?:\.\d+)+)/i)
  end

  # The app updates itself, so brew installs it and then leaves it alone rather than fighting the
  # updater over which version is on disk.
  auto_updates true
  depends_on macos: :ventura

  app "Klok.app"

  uninstall quit: "io.getklok"

  # The session and the recordings waiting to be uploaded, which are not a cache: only `zap` takes
  # them, so reinstalling does not lose a meeting that has not reached the server yet.
  zap trash: [
    "~/Library/Application Support/Klok",
    "~/Library/Caches/io.getklok",
    "~/Library/Logs/Klok",
    "~/Library/Preferences/io.getklok.plist",
    "~/Library/Saved Application State/io.getklok.savedState",
  ]
end
