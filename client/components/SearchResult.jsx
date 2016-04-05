import React, { PropTypes } from "react";

export const SearchResult = ({id, title, author, date}) => {

    let authors_display = author.join('; ');
    let cover_url = "/img/texts/" + id + "/cover-small.jpg";

    return <li>
        <a href={id}><img src={cover_url} className="list-cover-image" alt="book cover"/></a>
        <div><a href={id}>{title}</a></div>
        <div>{authors_display} <span className="date">{date}</span></div>
    </li>;
};