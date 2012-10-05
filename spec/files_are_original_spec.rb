# Makes sure the files to be refactored are in their
# 'before' state, ie I haven't committed the changed
# versions accidentally.

require 'spec_helper'

describe 'the original files' do
  it 'does not have DataClump extracted' do
    expect { DataClump }.to raise_error
  end
end
