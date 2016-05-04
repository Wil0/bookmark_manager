require './app/models/link'
# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage
feature 'Viewing links' do
  scenario 'User can see links on the links page' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'

    # as this is our first feature test,
    # the following expectation is a quick check that everything is working.
    expect(page.status_code).to eq 200
    # you might remove this later.

    # why do we use within here?
    # might we get a false positive if we just test for 'Makers Academy'?
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
