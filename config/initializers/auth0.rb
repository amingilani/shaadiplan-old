Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'TIKTNP8kYglAOMR6jhOEBBEi0qJUxFCI',
    'Z4bDzH-f0t1VSMCc7NsTE81m2Y_gLzwhsichz90hQqfci_XrojKOMbGwsj_wgtkU',
    'gilani.auth0.com',
    callback_path: '/auth/auth0/callback'
  )
end
