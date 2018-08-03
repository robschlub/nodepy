FROM rschlub/nodepy

# ## General ##
WORKDIR /opt/app

# ## Javascript ##

# Node packages
ADD dev/package.json .
ADD dev/package-lock.json .

RUN npm install

# Update path so modules can be run from anywhere
ENV PATH="/opt/app/node_modules/.bin:${PATH}"

# ## Python ##

# Python packages
ADD dev/requirements.txt .
RUN pip install --no-cache-dir -q -r requirements.txt

ENTRYPOINT ["bash"]