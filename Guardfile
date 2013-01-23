ignore!( /\.bundle/, /\.git/, /tmp/, /log/, /\..*-cache/, /sample\/.*\/vendor/, /sample\/.*\/spec/ )

guard 'jasmine-headless-webkit' do
  watch(%r{^spec\/.*Spec\.js\.coffee$})
  watch(%r{^spec\/.*Spec\.js$})
  watch(%r{^vendor\/assets\/(.*)\.js\.coffee$}) {|m| "spec/#{m[1]}Spec.js.coffee" }
end

guard :shell do
  watch(%r{^vendor\/assets\/(.*)\.js\.coffee$}) do |m|
    js_path = 'vendor/assets/javascripts'
    n m[0], 'Changed'
    `coffee --join #{js_path}/event_calendar.js --compile #{js_path}/lib/*.coffee #{js_path}/models/*.coffee #{js_path}/controllers/*.coffee #{js_path}/*.coffee`
  end
end

