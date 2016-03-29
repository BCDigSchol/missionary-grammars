import React from "react";

import { TextSectionTitle } from "./TextSectionTitle.jsx"


export const TextStructure = (props) => {

    function renderField(field) {
        let key = field.title + "p" + field.page;
        let subsections = '';
        let toggle_switch = '';
        if (field.sections) {

            toggle_switch = (
                <div className="open-subsection-control" onClick={() => props.toggleSectionDisplay(field.id)}>{props.open_sections.indexOf(field.id) > -1 ? '-' : '+'}</div>
            );
            subsections =
                <TextStructure structure={field.sections}
                               handleUpdate={props.handleUpdate}
                               open_sections={props.open_sections}
                               toggleSectionDisplay={props.toggleSectionDisplay}
                />;
        }

        return (
            <li key={key} className={props.open_sections.indexOf(field.id) > -1 ? 'open-section' : 'closed-section'}>
                <TextSectionTitle
                    handleClick={props.handleUpdate}
                    page={field.page}
                    title={field.title}
                />{toggle_switch}
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