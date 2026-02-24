cask "firebot" do
  arch arm: "arm64", intel: "x64"

  version "5.65.4"
  sha256 arm:   "72cd6daf94d4170d124981f21e6df7ce01894b4d89581e409e58ea60f52a5644",
         intel: "71ee0b52da84307c05b2aabf0822e31acc29fd285361b6130e4ab35cff6c516f"

  url "https://github.com/crowbartools/Firebot/releases/download/v#{version}/firebot-v#{version}-macos-#{arch}.dmg",
      verified: "github.com/crowbartools/Firebot/"
  name "Firebot"
  desc "All-in-one bot for Twitch streamers"
  homepage "https://firebot.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Firebot.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Firebot",
    "#{Dir.home}/Library/Application Support/firebotv#{version.split(".").first}",
    "#{Dir.home}/Library/Preferences/com.electron.firebot.plist",
    "#{Dir.home}/Library/Saved Application State/com.electron.firebot.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
