cask "obs-cloud-closed-captions" do
	version "0.28"

	name "Cloud Closed Captions"
	desc "Closed Captioning via Google Speech Recognition"
	homepage "https://obsproject.com/forum/resources/closed-captioning-via-google-speech-recognition.833"
	url "https://github.com/ratwithacompiler/OBS-captions-plugin/releases/download/v#{version}/Closed_Captions_Plugin__v#{version}_MacOS.zip"
	sha256 "f8bef90b407c455d8d3cd5ecee65a4c513513032bae89e2938c259c0690ed9d5"

	depends_on cask: "obs"

	livecheck do
		# The version on the OBS site *would be* authoritative but doesn't seem to
		# have been updated past 0.0.8 so we'll use the latest GitHub release.
		url "https://github.com/ratwithacompiler/OBS-captions-plugin/releases/latest"
		strategy :header_match
	end

	artifact "Closed_Captions_Plugin__v#{version}_MacOS/cloud-closed-captions.plugin",
	 target: "#{Dir.home}/Library/Application Support/obs-studio/plugins/cloud-closed-captions.plugin"
end
