FactoryBot.define do
  factory :task do
    title { 'test_title' }
    content { 'test_content' }
  end

  factory :second_task, class: Task do
    title { 'factory_second_title' }
    content { 'factory_second_content' }
  end
end
