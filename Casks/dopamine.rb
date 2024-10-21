cask "dopamine" do
  version "3.0.0-preview.35"
  sha256 "b114390bbcf92862c77d4be79dbb8c162e254ac34640d4dc46d45f002909fc35"

  url "https://github.com/digimezzo/dopamine/releases/download/v#{version}/Dopamine-#{version}.dmg"
  name "Dopamine"
  desc "Elegant multi-platform audio player"
  homepage "https://github.com/digimezzo/dopamine"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dopamine.app"

  zap trash: [
    "#{Dir.home}/Library/Application Support/Dopamine",
    "#{Dir.home}/Library/Preferences/com.digimezzo.dopamine.plist",
    "#{Dir.home}/Library/Saved Application State/com.digimezzo.dopamine.savedState",
  ]
end
