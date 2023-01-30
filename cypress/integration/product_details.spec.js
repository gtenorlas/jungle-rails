describe('Product', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('visit the product detail page', () => {
    cy.get('[alt="Scented Blade"]').click({
      force: true
    })
    cy.contains('.product-detail','Scented Blade').should('exist')
    cy.contains('24.99').should('exist')
  })
})