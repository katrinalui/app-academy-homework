import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    this.setState({ searchTerm: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm).then(() => { this.setState({ searchTerm: "" }); });
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <input onChange={this.handleChange} value={this.state.searchTerm}></input>
          <br />
          <input type="submit" value="Get your giphys!"></input>
        </form>
        <GiphysIndex giphys={this.props.giphys} />
      </div>
    );
  }
}

export default GiphysSearch;
