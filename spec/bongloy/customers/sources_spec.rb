RSpec.describe Bongloy::Customer do
  it "creates a card" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    card = Bongloy::Customer.create_source(
      customer.id,
      source: token.id
    )

    expect(card.customer).to eq(customer.id)
  end

  it "list cards" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    card = Bongloy::Customer.create_source(
      customer.id,
      source: token.id
    )

    cards = Bongloy::Customer.list_sources(customer.id)

    expect(cards.first.id).to eq(card.id)
  end

  it "shows a card" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    card = Bongloy::Customer.create_source(
      customer.id,
      source: token.id
    )

    result = Bongloy::Customer.retrieve_source(customer.id, card.id)

    expect(result.id).to eq(card.id)
  end

  xit "deletes card" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    card = Bongloy::Customer.create_source(
      customer.id,
      source: token.id
    )

    result = Bongloy::Customer.delete_source(customer.id, card.id)

    expect(result.deleted).to eq(true)
  end

  def token
    Bongloy::Token.create({
      card: {
        number: '6200000000000005',
        exp_month: 1,
        exp_year: 2021,
        cvc: '314',
      },
    })
  end
end
