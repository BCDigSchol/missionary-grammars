import React from "react";

import { TextStructure } from "./TextStructure.jsx";
import { ReadBox } from "./ReadBox.jsx";

// Horrible kludge until I understand why ES6 objects sometimes kill 'this'.
var me;

export default class ReadPage extends React.Component {


    constructor() {
        super();
        this.state = {structure: [], page: 1, title: '', authors: [], open_sections: []};
        this.fetched = false;
        me = this;
    }

    fetch(id) {
        this.fetched = true;
        var url = '/texts/' + id + '/structure';
        $.get(url, {}, function (response) {
            console.log(response);
            this.setState({
                structure: response.structure.sections,
                text_title: response.title,
                authors: response.authors
            });
        }.bind(this), 'json');
    }

    handleUpdate(page) {
        console.log('here');
        console.log(page);
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
            console.log('opening');
        } else {
            open_sections.splice(index);
            console.log('closing');
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
        var prevlink = <div className="prev-page">&nbsp;</div>;
        if (this.state && this.state.page > 0) {
            prevlink = <div onClick={this.decrementPage} className="prev-page">&lt;</div>;
        }

        return (
            <div className="read-page">
                <div className="structure-pane">
                    <h2>{this.state.text_title}</h2>
                    <ul className="author-list">
                        {this.state.authors.map((author) => (<li ref='a'>{author.first} {author.last}</li>))}
                    </ul>
                    <div className="text-structure">
                        <TextStructure structure={this.state.structure}
                                       handleUpdate={this.handleUpdate}
                                       toggleSectionDisplay={this.toggleSectionDisplay}
                                       open_sections={this.state.open_sections}/>
                    </div>
                </div>
                <div className="read-pane">
                    {prevlink}
                    <ReadBox page={this.state.page} text_id={this.props.text_id}/>
                    <div onClick={this.incrementPage} className="next-page">&gt;</div>
                </div>
            </div>
        );
    }
}