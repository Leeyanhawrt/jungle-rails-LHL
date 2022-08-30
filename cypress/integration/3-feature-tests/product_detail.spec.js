describe('homepage', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Finds the product detail for the first listed", () => {
    cy.get(':nth-child(1) > a > img')
      .click()

    let searchedText = 'The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.'

    cy.contains(searchedText)
  });

})