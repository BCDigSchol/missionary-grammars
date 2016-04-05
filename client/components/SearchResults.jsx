import React, { PropTypes } from "react";

export const SearchResults = ({hits, total, filters, removeFilter}) => {

    return <div>
        <div>You searched for:
            {filters.map((filter)=> (<div>{filter}<a onClick={() => removeFilter(filter)}>x</a></div>))}
        </div>
        <ul>
            {hits.map((hit) => (<li>{hit.title}</li>))}
        </ul>
    </div>
};