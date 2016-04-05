import React, { PropTypes } from "react";


export const FacetItem = ({addFilter, value, field}) => {
    return <li><a onClick={() => addFilter('language',value)}>{value}</a></li>;
};