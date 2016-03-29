import React from "react";

import { TextStructure } from "./TextStructure.jsx";
import { Metadata } from "./Metadata.jsx";
import { ReadBox } from "./ReadBox.jsx";

// Horrible kludge until I understand why ES6 objects sometimes kill 'this'.
var me;

export default class ReadPage extends React.Component {


    constructor() {
        super();
        this.state = {
            text: {
                structure: {
                    sections: []
                },
                authors: [],
                title: '',
                publisher: [],
                languages: [],
            },
            tab: 'text-structure',
            page: 1,
            open_sections: []
        };
        this.fetched = false;
        me = this;
    }

    fetch(id) {
        this.fetched = true;
        var url = '/texts/' + id + '/structure';
        $.get(url, {}, function (response) {
            this.setState({
                text: response
            });
        }.bind(this), 'json');
    }

    handleUpdate(page) {
        this.setState(
            {
                page: page
            }
        );
    }

    toggleSectionDisplay(section_id) {
        let open_sections = me.state.open_sections;
        let index = open_sections.indexOf(section_id);

        if (index === -1) {
            open_sections.push(section_id);
        } else {
            open_sections.splice(index);
        }
        me.setState(
            {
                open_sections: open_sections
            }
        );
    }

    incrementPage() {
        me.handleUpdate(me.state.page + 1);
    }

    decrementPage() {
        me.handleUpdate(me.state.page - 1);
    }

    render() {
        if (!this.fetched) {
            this.fetch(this.props.text_id);
        }
        this.handleUpdate = this.handleUpdate.bind(this);

        let prevlink = <div className="prev-page">&nbsp;</div>;
        if (this.state && this.state.page > 0) {
            prevlink = <div onClick={this.decrementPage} className="prev-page">&lt;</div>;
        }

        let nextlink = <div onClick={this.incrementPage} className="next-page">&gt;</div>;

        console.log('state');
        console.log(this.state.tab);


        return (
            <div className="read-page">
                <div className="structure-pane">
                    <h2>{this.state.text.title}</h2>

                    <ul className="tabs">
                        <li onClick={() => {this.setState({ tab: 'text-structure'});}}
                            className={this.state.tab === 'text-structure' ? 'selected' :'not-selected' }>
                            Structure
                        </li>
                        <li onClick={() => {this.setState({ tab: 'text-metadata'});}}
                            className={this.state.tab === 'text-metadata' ? 'selected' :'not-selected' }>
                            Metadata
                        </li>
                    </ul>
                    <div className={this.state.tab === 'text-structure' ? 'show' :'hidden' } id="text-structure">
                        <TextStructure structure={this.state.text.structure.sections}
                                       handleUpdate={this.handleUpdate}
                                       toggleSectionDisplay={this.toggleSectionDisplay}
                                       open_sections={this.state.open_sections}/>
                    </div>
                    <div className={this.state.tab === 'text-metadata' ? 'show' :'hidden' } id="text-metadata">
                        <Metadata text={this.state.text}/>
                    </div>
                </div>
                <div className="read-pane">
                    {prevlink}
                    <ReadBox page={this.state.page} text_id={this.props.text_id}/>
                    {nextlink}
                </div>
            </div>
        );
    }
}