import React from "react";

import { TextSectionTitle } from "./TextSectionTitle.jsx"


export const TextStructure = (props) => {

    function renderField(field) {
        let key = field.title + "p" + field.page;
        let subsections = '';
        let open_box = '';
        if (field.sections) {
            open_box = <div className="open-subsection-control">+</div>
            subsections =
                <TextStructure structure={field.sections} handleUpdate={props.handleUpdate}/>;
        }

        return (<li key={key}>
                <TextSectionTitle handleClick={props.handleUpdate} page={field.page}
                                  title={field.title}/>{open_box}
                {subsections}
            </li>
        );
    };

    return (
        <ul className="sections">
            {props.structure.map(renderField)}
        </ul>
    );
};