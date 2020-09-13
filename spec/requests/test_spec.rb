RSpec.describe 'test specs' do
  it 'can run tests' do
    visit '/test'
    expect(current_path).to eq('/test')
  end
end
