import React, { PropTypes } from "react";

export const TextSectionTitle = ({handleClick, page, title}) => {
    return (<a onClick={() => handleClick(page)} page={page}>{title}</a>);
};