FROM ruby:3.0.2
WORKDIR /oop_training
COPY . /oop_training
RUN bundle install
CMD ["ruby", "./bin/main.rb"]
