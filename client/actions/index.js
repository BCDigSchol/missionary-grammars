export const nextPage = () => {
    return {
        type: 'NEXT_PAGE'
    }
};

export const prevPage = () => {
    return {
        type: 'PREV_PAGE'
    }
};

export const openSection = (id) => {
    return {
        type: 'OPEN_SECTION',
        id: id
    }
};

export const closeSection = (id) => {
    return {
        type: 'CLOSE_SECTION',
        id: id
    }
};