import React, { PropTypes } from "react";

export const SearchResults = ({hits, total, filters, removeFilter}) => {

    let result_box = <div className="searched-for-box">You searched for:
        <ul>
            {filters.map((filter)=> (<li className='searched-for-item'>
                <div className="filter">{filter}</div>
                <a className='remove-filter' onClick={() => removeFilter(filter)}>x</a></li>))}
        </ul>
    </div>;

    return <div className="search-result-page">
        {filters.length ? result_box : ''}
        <h2>Results</h2>
        <ul id="search-results">
            {hits.map((hit) => (<li><a href={hit.id}>{hit.title}</a></li>))}
        </ul>
    </div>
};