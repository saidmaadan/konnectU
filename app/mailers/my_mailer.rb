class MyMailer < ActionMailer::Base

  def sendgrid_client
    @sendgrid_client ||= SendGrid::API.new(api_key: ENV.fetch("SENDGRID_INVENTIVE_KEY"))
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

  # Send Stripe receipt with Mandrill
  def new_receipt(user, project)
    template_id = "d6864483-26ff-4b34-a539-124ef48c353a"

    data = {
      "personalizations": [
        {
          "to": [
            {
              "email": user.email
            }
          ],
          "substitutions": [
            {"-name-": "STUDENT_NAME", "-content-": user.name},
						{"-name-": "PROJECT_NAME", "-content-": project.name},
						{"-name-": "PROJECT_PRICE", "-content-": project.price}
          ],

          "subject": "KonnectU Support - Your Receipt"
        }
      ],
      "from": {
        "email": "info@inventivelabs.co"
      },
      "template_id": template_id
    }

    sendgrid_client.client.mail._("send").post(request_body: data)
  end

  #   # With Mandrill
  # def mandrill_client
	# 	@mandrill_client ||= Mandrill::API.new ENV['MAILER_API_KEY']
	# end
  #
	# def new_user(user)
	# 	template_name = "new-user"
	# 	template_content = []
	# 	message = {
	# 		to: [{email: "#{user.email}"}],
	# 		subject: "Welcome to Code4Pro",
	# 		merge_vars: [
	# 			{
	# 				rcpt: user.email,
	# 				vars: [{name: "USER_NAME", content: user.name}]
	# 			}
	# 		]
	# 	}
  #
	# 	mandrill_client.messages.send_template template_name, template_content, message
	# end
  #
	# def new_receipt(user, project)
	# 	template_name = "new-receipt"
	# 	template_content = []
	# 	message = {
	# 		to: [{email: "#{user.email}"}],
	# 		subject: "Code4Pro - Your Receipt",
	# 		merge_vars: [
	# 			{
	# 				rcpt: user.email,
	# 				vars: [
	# 					{name: "STUDENT_NAME", content: user.name},
	# 					{name: "PROJECT_NAME", content: project.name},
	# 					{name: "PROJECT_PRICE", content: project.price}
	# 				]
	# 			}
	# 		]
	# 	}
  #
	# 	mandrill_client.messages.send_template template_name, template_content, message
	# end

end
