RSpec.describe Bongloy::Refund do
  it "creates a refund" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )
    refund = Bongloy::Refund.create(
      charge: charge.id
    )

    expect(refund.amount).to eq(10000)
    expect(refund.charge).to eq(charge.id)
  end

  it "creates a partial refund" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )
    refund = Bongloy::Refund.create(
      amount: 5000,
      charge: charge.id
    )

    expect(refund.amount).to eq(5000)
  end

  it "shows a refund" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )
    refund = Bongloy::Refund.create(
      charge: charge.id
    )

    result = Bongloy::Refund.retrieve(refund.id)

    expect(result.id).to eq(refund.id)
  end

  it "list refunds" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )
    refund = Bongloy::Refund.create(
      charge: charge.id
    )

    refunds = Bongloy::Refund.list

    expect(refunds.data.is_a?(Array)).to eq(true)
    expect(refunds.first.id).to eq(refund.id)
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
