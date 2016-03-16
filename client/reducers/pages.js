const initial_state = {
    page: 0
};

export const pages = (state, action) => {
    if (typeof state === "undefined") {
        return initial_state;
    }
    let updated_page = 0;
    switch (action.type) {
        case 'NEXT_PAGE':
            updated_page = state.page + 1;
            return Object.assign({}, state, {page: updated_page});
        case'PREV_PAGE':
            if (state.page > 0) {
                updated_page = state.page - 1;
            }
            return Object.assign({}, state, {page: updated_page});
    }
    return state;
};

console.log('asads');