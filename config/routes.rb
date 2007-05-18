ActionController::Routing::Routes.draw do |map|
  map.open_id_complete 'session', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.resources :changesets, :has_many => :changes
  map.resource  :session, :controller => 'sessions'

  map.with_options :controller => 'browser', :action => 'index' do |b|
    b.rev_browser 'browser/:rev/*paths', :rev => /r\d+/
    b.browser 'browser/*paths'
    b.text    'text/*paths', :action => 'text'
    b.raw     'raw/*paths',  :action => 'raw'
  end

  map.history 'history/*paths', :controller => 'history', :action => 'index'

  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.root :controller => "dashboard"
end