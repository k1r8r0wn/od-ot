class User < ApplicationRecord
  before_save :downcase_email

  has_secure_password

  has_many :todo_lists, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\Z/
                    }

  def downcase_email
    self.email = email.downcase
  end

  def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
  end

  def create_default_lists
    tutorial = todo_lists.find_or_create_by(title: 'Od-ot Tutorial')
    default_todo_items_content.each do |content|
      tutorial.todo_items.find_or_create_by(content: content)
    end
  end

  private

  def default_todo_items_content
    [
      'Add a todo list or item by clicking or tapping the \'+\' button at the right top.',
      'The numbers next to a list indicate how many items it has.',
      'Clicking or tapping the list title brings up list items.',
      'Clicking or tapping the list title again gives you more options.',
      'Clicking or tapping a checkmark next to an item marks it complete.',
      'Clicking or tapping it again marks it incomplete.',
      'Clicking or tapping the item lets you edit or delete it.'
    ]
  end
end
