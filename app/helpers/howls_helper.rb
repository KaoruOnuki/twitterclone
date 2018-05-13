module HowlsHelper
    def choose_new_or_edit
        if action_name == "new" || action_name == "confirm"
            confirm_howls_path
        elsif action_name == "edit"
            howl_path
        end
    end
    
end
