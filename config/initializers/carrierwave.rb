if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      region: 'ap-northeast-1'
    }

    config.fog_directory = "sharemade-image"
  end

  # 日本語ファイル名の設定 secure_tokenにしているからいらない？
  # CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 

end
