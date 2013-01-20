# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  
  $('#twitter-button').remove() if $('#twitter').length
  $('#facebook-button').remove() if $('#facebook').length
  $('#github-button').remove() if $('#github').length