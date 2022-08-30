describe('homepage', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Should increase cart count by 1 when product is added", () => {
    cy.get('.button_to > .btn')
      .click({ force: true })
    cy.contains('.end-0 > .nav-link', "1")
  });

})