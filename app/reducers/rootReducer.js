import initialState from '../initialState'

export default (state = initialState, action) => {
	switch (action.type) {
	case 'SET_SCALAR_INPUT_COUNT': {
		const count = parseInt(action.data)
		if (count) {
			return state
				.set('scalarCount', count)
				.set('scalarCountDisplay', count)
				.set('scalarSet', state.get('scalarSet').setSize(count))
		}
		return state
			.set('scalarCountDisplay', '')
	}
	case 'UPDATE_SCALAR': {
		const {index, val} = action.data
		return state
			.set('scalarSet', state.get('scalarSet').set(index, parseInt(val || 0)))
	}
	default:
		return state
	}
}