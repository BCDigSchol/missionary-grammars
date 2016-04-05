import React, { PropTypes } from "react";
import { SearchResult } from "./SearchResult.jsx";


export const SearchResults = ({hits, total, filters, removeFilter}) => {

    let result_box = <div className="searched-for-box">You searched for:
        <ul>
            {filters.map((filter)=> (<li className='searched-for-item'>
                <div className="filter">{filter}</div>
                <a className='remove-filter' onClick={() => removeFilter(filter)}>x</a></li>))}
        </ul>
    </div>;

    console.log(hits);

    return <div className="search-result-page">
        {filters.length ? result_box : ''}
        <h2>Results</h2><div className="result-total">{total} results</div>
        <ul id="search-results">
            {hits.map((hit) => (<SearchResult id={hit.id} title={hit.title} author={hit.author} date={hit.date} />))}
        </ul>
    </div>
};