cask 'chromium-snapshots' do
  version :latest
  sha256 :no_check

  # commondatastorage.googleapis.com/chromium-browser-snapshots/Mac was verified as official when first introduced to the cask
  url do
    require 'open-uri'
    base_url = 'https://commondatastorage.googleapis.com/chromium-browser-snapshots/Mac/'
    version = URI("#{base_url}LAST_CHANGE").open.read.scan(%r{^\d+$}).flatten.first
    "#{base_url}#{version}/chrome-mac.zip"
  end
  name 'Chromium'
  homepage 'https://www.chromium.org/getting-involved/download-chromium'

  app 'chrome-mac/Chromium.app'

  zap trash: [
               '~/Library/Preferences/org.chromium.Chromium.plist',
               '~/Library/Caches/Chromium',
               '~/Library/Application Support/Chromium',
               '~/Library/Saved Application State/org.chromium.Chromium.savedState',
             ]
end
