class IncomingMailsController < ApplicationController
  require 'mail'
  skip_before_filter :verify_authenticity_token

  def create
    message = Mail.new(params[:message])
    p message.subject #print the subject to the logs
    p message.body.decoded #print the decoded body to the logs
    p message.attachments.first.inspect #inspect the first attachment

    # Do some other stuff with the mail message


    #Task.create(params[:task])

    render :text => 'success', :status => 200 # a status of 404 would reject the mail
  end
end
