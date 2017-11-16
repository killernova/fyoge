module SoftDelete
  extend ActiveSupport::Concern
  included do
    def destroy
      update soft_delete: true
    end
  end
end