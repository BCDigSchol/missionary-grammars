import React, { PropTypes } from "react";


export const FacetItem = ({addFilter, removeFilter, value, field, filters}) => {
    let filter = field + '=' + value;


    let drop_button = (
        <div className="open-field-control"
             onClick={() => removeFilter(filter)}>{filters.indexOf(filter) > -1 ? 'x' : ''}</div>
    );

    return <li><a onClick={() => addFilter(filter)}>{value}</a> {drop_button}</li>;
};