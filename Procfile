web: bundle exec puma -p $PORT -C ./config/puma.rb
release: bundle exec bin/rails db:migrate && bundle exec bin/rails db:correction_seq_id
