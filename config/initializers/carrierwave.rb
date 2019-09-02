if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: "AWS",
      AWS_access_key_id: Rails.application.secrets.AWS_access_key_id,
      AWS_secret_key:   Rails.application.secrets.AWS_secret_key,
      region: 'ap-northeast-1'
    }

    config.fog_directory = "sharemade-img"
  end

  # 日本語ファイル名の設定 secure_tokenにしているからいらない？
  # CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 

end
