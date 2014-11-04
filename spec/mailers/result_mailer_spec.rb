require "spec_helper"

describe ResultMailer do
  describe 'create_result' do
    let(:user) { FactoryGirl.create(:user) }
    let(:result) { FactoryGirl.create(:result)}
    let(:mail) { ResultMailer.create_result(user, result) }

    let(:asserted_body) { ["You have successfully created your dog's result.",
                           "You will receive an email when the administrator valide or reject your result",
                           "Thank you for comunicating the result #{user.email}",
                           "results/#{result.id}"] }

    it 'renders the subject' do
      expect(mail.subject).to eql('The result has been created')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql(['notifications@example.com'])
    end

    it 'assigns @email' do
      expect(mail.body.encoded).to match(user.email)
    end

    it "includes asserted_body in the body of the email" do
     asserted_body.each do |content|
     mail.body.encoded.should match(content)
      end
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("results/#{result.id}")
    end
  end


  describe 'create_result_to_admin' do
    let(:user) { FactoryGirl.create(:user) }
    let(:result) { FactoryGirl.create(:result)}
    let(:admin) { FactoryGirl.create(:admin)}
    let(:mail) { ResultMailer.create_result_to_admin(user, result, admin) }

    let(:asserted_body) { ["The user #{user.email} has been created a dog's result.",
                           "You can validate or reject in the following link",
                           "admin/results/#{result.id}/edit" ] }

    it 'renders the subject' do
      expect(mail.subject).to eql("A result has been created by #{user.email}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([admin.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql([user.email])
    end

    it 'assigns @email' do
      expect(mail.body.encoded).to match(user.email)
    end

    it "includes asserted_body in the body of the email" do
      asserted_body.each do |content|
        mail.body.encoded.should match(content)
      end
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("admin/results/#{result.id}/edit")
    end
  end


  describe 'edit_result_by_admin' do
    let(:user) { FactoryGirl.create(:user) }
    let(:result) { FactoryGirl.create(:result)}
    let(:admin) { FactoryGirl.create(:admin)}
    let(:mail) { ResultMailer.edit_result_by_admin(user, result, admin) }

    let(:asserted_body) { ["In the following link you can see if the administrator has validated or has rejected the result sent by #{user.email}",
                           "results/#{result.id}" ] }

    it 'renders the subject' do
      expect(mail.subject).to eql("The response to the result sent")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eql([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eql([admin.email])
    end

    it 'assigns @email' do
      expect(mail.body.encoded).to match(user.email)
    end

    it "includes asserted_body in the body of the email" do
      asserted_body.each do |content|
        mail.body.encoded.should match(content)
      end
    end

    it 'assigns @confirmation_url' do
      expect(mail.body.encoded).to match("results/#{result.id}")
    end
  end

end
