it("Visits the homepage", () => {
  cy.visit("/")
  
});
it("There are products on the page", () => {
  cy.get(".products article").should("be.visible");
});
it("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 2);
});
it("Displays sold out badge when inventory is 0", () => {
  cy.get(".soldout").should("be.visible")
})
it("navigates to product information", () => {
  cy.get(".products article").first().click()
})
it("adds product to cart, and cart counter increases", () => {
  cy.get(".btn").click()
  cy.get(".nav-link").contains("My Cart (1)")
})