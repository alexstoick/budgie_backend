class Device < ActiveRecord::Base

  require 'apns'

  def send_notification(items)

    APNS.host = "gateway.sandbox.push.apple.com"
    APNS.port = 2195
    APNS.pem  = "ck.pem"
    APNS.pass = "qplazm04"

    message = "You didn't buy: " ;

    message = message + items.map(&:name).join(", ")
    token = "650d14eca94356143757fba2b61b5aaa458eec72f2404dae047c5ee9022554b1"

    APNS.send_notification(token,:alert => message ,:badge => '1',:sound => 'default')

  end
end
