class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: ENV["SENDGRID_INVENTIVE_KEY"])
  end

  def new_user(user)
    template_id = "6219b453-c1b6-4663-b2d8-90a77024fa15"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": {
            "-name-": "USER_NAME",
            "-content-": user.name
          },
          "subject": "KonnectU Support"
        }
      ],
      "from": {
        "email": "info@inventivelabs.co"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end
end
