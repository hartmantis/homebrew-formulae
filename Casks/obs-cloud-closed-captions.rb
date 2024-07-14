cask "obs-cloud-closed-captions" do
  version "0.30"
  sha256 "f1c1e09b960a28a2b54fdce8f68a17fcf466cd51d4d4e445ad4af5ca38b15180"

  url "https://github.com/ratwithacompiler/OBS-captions-plugin/releases/download/v#{version}/Closed_Captions_Plugin__v#{version}_MacOS.zip",
      verified: "github.com/ratwithacompiler/OBS-captions-plugin/"
  name "Cloud Closed Captions"
  desc "Closed Captioning via Google Speech Recognition"
  homepage "https://obsproject.com/forum/resources/closed-captioning-via-google-speech-recognition.833"

  livecheck do
    # The version on the OBS site *would be* authoritative but doesn't seem to
    # have been updated past 0.0.8 so we'll use the latest GitHub release.
    url "https://github.com/ratwithacompiler/OBS-captions-plugin/releases/latest"
    strategy :header_match
  end

  depends_on cask: "obs"

  artifact "Closed_Captions_Plugin__v#{version}_MacOS/cloud-closed-captions.plugin",
           target: "#{Dir.home}/Library/Application Support/obs-studio/plugins/cloud-closed-captions.plugin"
end
