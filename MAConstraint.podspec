#
#  Be sure to run `pod spec lint MAConstraint.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "MAConstraint"
  s.version      = "0.4"
  s.summary      = "This project makes it super easy to use AutoLayout."
  s.homepage     = "https://github.com/HomeSchoolDev/MAConstraint"

  s.license      = { "type" => "MIT", "file" => "LICENSE.txt" }

  s.author             = { "Derek" => "derekm9292@gmail.com" }
  s.social_media_url   = "http://twitter.com/Derek_maurer"


  s.source       = { :git => "https://github.com/HomeSchoolDev/MAConstraint.git", :tag => "0.4" }
  s.platform = :ios, '7.0'
  s.source_files  = "*.{h,m}"
  s.requires_arc = true

end
