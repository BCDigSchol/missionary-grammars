import React, { PropTypes } from "react";

export const SearchResults = ({hits, total, filters, removeFilter}) => {

    let result_box = <div>You searched for:
        {filters.map((filter)=> (<div>{filter}<a onClick={() => removeFilter(filter)}>x</a></div>))}
    </div>;

    return <div>
        <h2>Results</h2>

        {filters.length ? result_box : ''}
        <ul>
            {hits.map((hit) => (<li><a href={hit.id}>{hit.title}</a></li>))}
        </ul>
    </div>
};