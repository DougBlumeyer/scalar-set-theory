let assert = require('assert');

describe('Scalar Set Theory', function () {
	it('shows the title and a table', function () {
		browser.url('/src/ScalarSetTheory/Main.elm');
		assert.equal(browser.getText('h1'), 'Scalar Set Theory');

		assert.equal(browser.getText('//table/tr[1]/th[1]'), 'section');
		assert.equal(browser.getText('//table/tr[1]/th[2]'), 'ed');
		assert.equal(browser.getText('//table/tr[2]/td[1]'), 'max');
		assert.equal(browser.getText('//table/tr[2]/td[2]'), '7');
		assert.equal(browser.getText('//table/tr[3]/td[1]'), 'min');
		assert.equal(browser.getText('//table/tr[3]/td[2]'), '7');
		assert.equal(browser.getText('//table/tr[4]/td[1]'), 'count (1)');
		assert.equal(browser.getText('//table/tr[4]/td[2]'), '7');
	});
});