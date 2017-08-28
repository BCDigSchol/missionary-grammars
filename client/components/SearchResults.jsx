import React, {PropTypes} from "react";
import {SearchResult} from "./SearchResult.jsx";


export const SearchResults = ({hits, total, filters, removeFilter, pageSearch, search_string}) => {

    let handleChange = function(e) {
        search_string = e.target.value;
    };

    let search_bar = <div className="text-search-box">
        <h2>Search</h2>
        <form onSubmit={(e) => pageSearch(e, search_string)}>
            <input type="text" id="text-search" onChange={handleChange}/>
            <button>go</button>
        </form>
    </div>


    return <div className="search-result-page">
        {search_bar}
        <h2>Results</h2>
        <div className="result-total">{total} results</div>
        <ul id="search-results">
            {hits.map((hit) => (<SearchResult id={hit.id} title={hit.title} author={hit.author} date={hit.date} pages={hit.pages} search_string={search_string}/>))}
        </ul>
    </div>
};