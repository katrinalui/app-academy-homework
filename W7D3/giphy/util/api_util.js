const APIUtil = {
  fetchSearchGiphys: (searchTerm) => {
    return $.ajax({
      url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`,
      method: 'GET'
    });
  }
};

export default APIUtil;
