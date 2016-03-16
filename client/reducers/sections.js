const initial_state = {
    open_sections: []
};

export const sections = (state, action) => {
    if (typeof state === 'undefined') {
        return initial_state;
    }
    let new_open_sections = state.open_sections;

    switch (action.type) {
        case 'OPEN_SECTION':
            new_open_sections.push(action.id);
            return Object.assign({}, state, {open_sections: new_open_sections});
        case'CLOSE_SECTION':
            let index = new_open_sections.indexOf(action.id);
            new_open_sections = new_open_sections.splice(index, 1);
            return Object.assign({}, state, {open_sections: new_open_sections});
    }
    return state;
};