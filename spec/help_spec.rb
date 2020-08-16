require 'spec_helper'

RSpec.describe "Showing help", :type => :aruba do
  include_context "messages"

  let(:help_text) do
    <<~EXPECTED
      Usage: llmk[.lua] [OPTION]... [FILE]...

      Options:
        -h, --help            Print this help message.
        -V, --version         Print the version number.

        -s, --silent          Silence messages from called programs.
        -q, --quiet           Suppress warnings and most error messages.
        -v, --verbose         Print additional information.
        -D, --debug           Activate all debug output (equal to "--debug=all").
        -d CAT, --debug=CAT   Activate debug output restricted to CAT.

        -c, --clean           Remove the temproray files such as aux and log files.
        -C, --clobber         Remove all generated files including final PDFs.
      
      Please report bugs to <tkt.asakura@gmail.com>.
    EXPECTED
  end

  context "with --help" do
    before(:each) { run_llmk "--help" }
    before(:each) { stop_all_commands }

    it do
      expect(stdout).to eq help_text
      expect(last_command_started).to be_successfully_executed
    end
  end

  context "with -h" do
    before(:each) { run_llmk "-h" }
    before(:each) { stop_all_commands }

    it do
      expect(stdout).to eq help_text
      expect(last_command_started).to be_successfully_executed
    end
  end
end
