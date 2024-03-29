it("Visits the homepage", () => {
  cy.visit("/")
  
});
it("There are products on the page", () => {
  cy.get(".products article").should("be.visible");
});
xit("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 2);
});
it("adds product to cart, and cart counter increases", () => {
  cy.get(".btn").first().click({force: true})
  cy.get(".nav-link").contains("My Cart (1)")
})