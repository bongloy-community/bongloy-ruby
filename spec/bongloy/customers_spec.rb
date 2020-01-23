RSpec.describe "Bongloy::Customer" do
  it "creates a customer" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    expect(customer.email).to eq("user@example.com")
    expect(customer.description).to eq("Bongloy customer")
  end

  it "shows a customer" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    result = Bongloy::Customer.retrieve(customer.id)

    expect(result.id).to eq(customer.id)
  end

  it "lists customers" do
    customer = Bongloy::Customer.create(
      email: "user@example.com",
      description: "Bongloy customer",
      source: token.id
    )

    customers = Bongloy::Customer.list

    expect(customers.data.is_a?(Array)).to eq(true)
    expect(customers.first.id).to eq(customer.id)
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
