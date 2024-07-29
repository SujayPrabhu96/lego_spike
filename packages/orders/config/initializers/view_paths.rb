Orders::Engine.configure do
  config.paths['app/views'].unshift(Rails.root.join('app', 'views'))
end
