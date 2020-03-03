FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
    time_limit { '2020-04-30 19:00:00'}
    completed { '未着手' }
  end

  factory :second_task, class: Task do
    title { 'factory_second_title' }
    content { 'factory_second_content' }
    time_limit { '2020-03-31 19:00:00'}
    completed { '未着手' }
  end
end
