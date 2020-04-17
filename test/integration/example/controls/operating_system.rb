# frozen_string_literal: true

control "operating_system" do
  describe "the operating system" do
    subject do
      command("cat /etc/os-release").stdout
    end

    it "is Amazon Linux" do
      is_expected.to match /Amazon Linux/
    end
  end
end
