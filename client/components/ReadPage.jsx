import React from "react";

import { TextStructure } from "./TextStructure.jsx";
import { ReadBox } from "./ReadBox.jsx";

// Horrible kludge until I understand why ES6 objects sometimes kill 'this'.
var me;

export default class ReadPage extends React.Component {


    constructor() {
        super();
        this.state = {structure: [], page: 1};
        this.fetched = false;
        me = this;
    }

    fetch(id) {
        this.fetched = true;
        var url = '/texts/' + id + '/structure';
        $.get(url, {}, function (response) {
            this.setState({
                structure: response.sections
            });
        }.bind(this), 'json');
    }

    handleTitleClick(event) {
        console.log(event.target);
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
                    <h2>TITLE HERE</h2>
                    <TextStructure structure={this.state.structure} handleUpdate={this.handleUpdate}/>
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