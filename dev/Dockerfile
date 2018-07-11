FROM rschlub/nodepy

# ## General ##
WORKDIR /opt/app

# ## Javascript ##

# Node packages
ADD dev/package.json .

RUN npm install -g npm@6.1.0

RUN npm install --save 		 react@16.4.1 \
    											 react-dom@16.4.1

RUN npm install --save-dev eslint@4.19.1 \
													 eslint-plugin-import@2.13.0 \
													 eslint-config-airbnb-base@12.1.0 \
													 eslint-plugin-flowtype@2.50.0 \
													 eslint-plugin-react@7.10.0 \
													 webpack@4.16.0 \
													 webpack-cli@2.1.5 \
													 babel-preset-env@1.7.0 \
													 babel-loader@7.1.5 \
													 babel-core@6.26.3 \
													 babel-preset-flow@6.23.0 \
													 babel-preset-react@6.24.1 \
													 flow-bin@0.68.0 \
													 uglifyjs-webpack-plugin@1.2.7 \
													 babel-eslint@8.2.5 \
													 jest@22.4.4 \
													 babel-jest@22.4.4 \
    											 regenerator-runtime@0.11.1 \
    											 eslint-plugin-jest@21.17.0 \
    											 clean-webpack-plugin@0.1.19 \ 		
    											 mini-css-extract-plugin@0.4.1 \	
    											 css-loader@0.28.11 \							
    											 sass-loader@6.0.7 \							
    											 node-sass@4.9.2 \								
												   postcss-loader@2.1.6 \						
												   autoprefixer@8.6.5 \
													 react-test-renderer@16.4.1 \
													 whatwg-fetch@2.0.4 \
													 babel-polyfill@6.26.0 \
													 stylelint-config-standard@18.2.0 \
													 stylelint@9.3.0 \ 
													 stylelint-scss@3.1.3 \
													 postcss@6.0.23

# Update path so modules can be run from anywhere
ENV PATH="/opt/app/node_modules/.bin:${PATH}"

# ## Python ##

# Python packages
ADD dev/requirements.txt .
RUN pip install --no-cache-dir -q -r requirements.txt

ENTRYPOINT ["bash"]