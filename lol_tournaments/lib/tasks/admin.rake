namespace :admin do
  desc "List all admin accounts"
  task list: :environment do
    puts "\n=== Admin Accounts ===\n\n"
    Admin.all.each do |admin|
      puts "ID: #{admin.id}"
      puts "Email: #{admin.email}"
      puts "Created at: #{admin.created_at}"
      puts "Last sign in: #{admin.last_sign_in_at || 'Never'}"
      puts "----------------------------------------"
    end
    puts "\nTotal admins: #{Admin.count}\n"
  end

  desc "Create a new admin account"
  task :create, [:email, :password] => :environment do |t, args|
    if args[:email].blank? || args[:password].blank?
      puts "Usage: rails admin:create[email,password]"
      exit
    end

    admin = Admin.new(
      email: args[:email],
      password: args[:password],
      password_confirmation: args[:password]
    )

    if admin.save
      puts "\nAdmin account created successfully!"
      puts "Email: #{admin.email}"
    else
      puts "\nFailed to create admin account:"
      admin.errors.full_messages.each do |error|
        puts "- #{error}"
      end
    end
  end
end 