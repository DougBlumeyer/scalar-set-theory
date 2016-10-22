import test from 'ava'

import arraysEqual from '../../helpers/arraysEqual'
import eqDivsOfSet from '../../../app/lib/eqDivsOfSet'

import {List} from 'immutable'

import cycles from '../../../app/lib/fromHaskell'
import sawada from '../../../app/lib/sawada'

test.only('composite set', t => {
	// console.log("\nFAINARU AOTTOPUTTO " +
	// 	cycles(
	// 		List([
	// 			List([0,2]),
	// 			List([1,1]),
	// 			List([2,3])
	// 		])
	// 	)
	// )
	sawada()

	t.true(arraysEqual(eqDivsOfSet([20, 20]), [2, 4, 5, 10, 20]))
})

test('no equal divisors', t => {
	t.true(arraysEqual(eqDivsOfSet([2, 3], [])))
})