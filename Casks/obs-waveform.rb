cask "obs-waveform" do
  arch arm: "arm64", intel: "x86_64"

  version "1.9.1"
  sha256 arm:   "52f51cb479b42aa4cfa70d4ae31f65d876742fa5a57ce33dd42fdc5378f0e8d2",
         intel: "7b47ad3a3bab85b13c7357629347a0d53c49d1ebdc1965d5b9a9e53a8ad5b106"

  url "https://github.com/phandasm/waveform/releases/download/v#{version}/Waveform_v#{version}_MacOS_#{arch}.pkg",
      verified: "github.com/phandasm/waveform/"
  name "OBS Waveform"
  desc "Audio spectral analysis plugin for OBS Studio"
  homepage "https://obsproject.com/forum/resources/waveform.1423"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos
  depends_on cask: "obs"

  # OBS plugins need to go in the user's home dir and Homebrew's pkg stanza
  # can only put them in the root dir. This is admittedly hacky but feels
  # cleaner to me than the symlink approach in e.g. the obs-ndi cask.
  installer script: {
    executable: "/usr/sbin/installer",
    args:       ["-pkg", "#{staged_path}/Waveform_v#{version}_MacOS_#{arch}.pkg", "-target", "CurrentUserHomeDirectory"],
  }

  uninstall script: {
              executable: "/usr/sbin/pkgutil",
              args:       ["--forget", "com.github.phandasm.waveform.waveform", "--volume", Dir.home],
            },
            delete: "#{Dir.home}/Library/Application Support/obs-studio/plugins/waveform.plugin"
end
