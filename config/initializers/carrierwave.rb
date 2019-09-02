if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_key:   ENV["AWS_SECRET_ID"],
      region: 'ap-northeast-1'
    }

    config.fog_directory = "sharemade-img"
  end

  # 日本語ファイル名の設定 secure_tokenにしているからいらない？
  # CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 

end
