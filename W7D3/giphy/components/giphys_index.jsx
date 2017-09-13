import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({giphys}) => {
  const gifUrls = giphys.map((gif, i) => {
    return <GiphysIndexItem key={i} url={gif.images.fixed_height.url} />;
  });

  return (
    <div>
      {gifUrls}
    </div>
  );
};

export default GiphysIndex;
