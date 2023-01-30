describe('Cart', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000')
  })

  it('add product to cart', () => {
    cy.get('.btn').contains('Add').first().click({force:true})
    cy.contains('My Cart (1)').should('exist')

    //Go to product details page then add it to cart
    cy.get('[alt="Giant Tea"]').click({
      force: true
    })
    cy.contains('.product-detail','Giant Tea').should('exist')
    cy.get('.btn').contains('Add').click({force:true})
    cy.contains('My Cart (2)').should('exist')
  })
})