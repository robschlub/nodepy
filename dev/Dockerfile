FROM rschlub/nodepy

# ## General ##
WORKDIR /opt/app

# ## Javascript ##

# Node packages
ADD dev/package.json .
RUN npm install --save 		 react@16.4.0 \
    											 react-dom@16.4.0

RUN npm install --save-dev eslint@4.19.1 \
													 eslint-plugin-import@2.12.0 \
													 eslint-config-airbnb-base@12.1.0 \
													 eslint-plugin-flowtype@2.47.1 \
													 eslint-plugin-react@7.8.2 \
													 webpack@4.8.3 \
													 webpack-cli@2.1.4 \
													 babel-preset-env@1.7.0 \
													 babel-loader@7.1.4 \
													 babel-core@6.26.3 \
													 babel-preset-flow@6.23.0 \
													 babel-preset-react@6.24.1 \
													 flow-bin@0.68.0 \
													 uglifyjs-webpack-plugin@1.2.5 \
													 babel-eslint@8.2.3 \
													 jest@22.4.4 \
													 babel-jest@22.4.4 \
    											 regenerator-runtime@0.11.1 \
    											 eslint-plugin-jest@21.15.2 \
    											 clean-webpack-plugin@0.1.19 \ 		
    											 mini-css-extract-plugin@0.4.0 \	
    											 css-loader@0.28.11 \							
    											 sass-loader@6.0.7 \							
    											 node-sass@4.9.0 \								
												   postcss-loader@2.1.5 \						
												   autoprefixer@8.5.0 \
													 react-test-renderer@16.4.0 \
													 whatwg-fetch@2.0.4 \
													 babel-polyfill@6.26.0 \
													 stylelint-config-standard@18.2.0 \
													 stylelint@9.2.1 \ 
													 stylelint-scss@3.1.0 \
													 postcss@6.0.22


# Update path so modules can be run from anywhere
ENV PATH="/opt/app/node_modules/.bin:${PATH}"

# ## Python ##

# Python packages
ADD dev/requirements.txt .
RUN pip install --no-cache-dir -q -r requirements.txt

ENTRYPOINT ["bash"]