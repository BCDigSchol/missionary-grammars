import React, { PropTypes } from "react";
import { FacetItem } from "./FacetItem.jsx";


export const Facet = ({addFilter, removeFilter, filters, values, displayName, field, open_fields, toggleField}) => {
    let toggle_switch = (
        <div className="open-field-control"
             onClick={() => toggleField(field)}>{open_fields.indexOf(field) > -1 ? '-' : '+'}</div>
    );

    return <div>
        <h3>{displayName} {toggle_switch}</h3>
        <ul className={open_fields.indexOf(field) > -1 ? 'show' : 'hidden'}>
            {values.map((value) => (<FacetItem value={value}
                                               addFilter={addFilter}
                                               removeFilter={removeFilter}
                                               field={field}
                                               filters={filters}/>))}
        </ul>
    </div>
};