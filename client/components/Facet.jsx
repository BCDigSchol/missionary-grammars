import React, { PropTypes } from "react";
import { FacetItem } from "./FacetItem.jsx";


export const Facet = ({addFilter, removeFilter, filters, values, displayName, field, open_fields, toggleField}) => {
    let toggle_switch = (
        <div >{open_fields.indexOf(field) > -1 ? '-' : '+'}</div>
    );

    let container_style = {
        height: open_fields.indexOf(field) > -1 ? values.length * 27 + "px" : 0
    };

    return <div className="facet-container">
        <h3 className="open-field-control" onClick={() => toggleField(field)}>{displayName} {toggle_switch}</h3>
        <ul style={container_style} className={open_fields.indexOf(field) > -1 ? 'show' : 'hidden'}>
            {values.map((value) => (<FacetItem value={value}
                                               addFilter={addFilter}
                                               removeFilter={removeFilter}
                                               field={field}
                                               filters={filters}/>))}
        </ul>
    </div>
};