import React, { PropTypes } from "react";

export const SearchResult = ({id, title, author, date, search_string}) => {

    let authors_display = author.join('; ');
    let cover_url = "/img/texts/" + id + "/cover-small.jpg";
    let result_url = id
    if (search_string !== '') {
        result_url = result_url + '?q=' + search_string
    }

    return <li>
        <a href={id}><img src={cover_url} className="list-cover-image" alt="book cover"/></a>
        <div><a href={result_url}>{title}</a></div>
        <div>{authors_display} <span className="date">{date}</span></div>
    </li>
};