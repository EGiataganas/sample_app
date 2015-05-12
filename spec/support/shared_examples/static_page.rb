RSpec.shared_examples_for 'all static pages' do
	it { is_expected.to have_selector('h1', text: heading) }
	it { is_expected.to have_title(full_title(page_title)) }
end