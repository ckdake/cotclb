module ApplicationHelper
  def gravatar_url(email)
    "https://gravatar.com/avatar/%s" % [Digest::MD5.hexdigest(email.strip.downcase)]
  end
end
