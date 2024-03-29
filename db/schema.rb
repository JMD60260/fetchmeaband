# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_922_162_133) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'cities', force: :cascade do |t|
    t.string 'zip_code'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'title'
    t.text 'content'
    t.bigint 'forum_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['forum_id'], name: 'index_comments_on_forum_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'contacts', force: :cascade do |t|
    t.string 'name'
    t.text 'message'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.datetime 'start_date'
    t.integer 'duration'
    t.string 'title'
    t.text 'description'
    t.integer 'price'
    t.string 'location'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'forums', force: :cascade do |t|
    t.string 'topic'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'description'
    t.index ['user_id'], name: 'index_forums_on_user_id'
  end

  create_table 'mailboxer_conversation_opt_outs', id: :serial, force: :cascade do |t|
    t.string 'unsubscriber_type'
    t.integer 'unsubscriber_id'
    t.integer 'conversation_id'
    t.index ['conversation_id'], name: 'index_mailboxer_conversation_opt_outs_on_conversation_id'
    t.index %w[unsubscriber_id unsubscriber_type], name: 'index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type'
  end

  create_table 'mailboxer_conversations', id: :serial, force: :cascade do |t|
    t.string 'subject', default: ''
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'mailboxer_notifications', id: :serial, force: :cascade do |t|
    t.string 'type'
    t.text 'body'
    t.string 'subject', default: ''
    t.string 'sender_type'
    t.integer 'sender_id'
    t.integer 'conversation_id'
    t.boolean 'draft', default: false
    t.string 'notification_code'
    t.string 'notified_object_type'
    t.integer 'notified_object_id'
    t.string 'attachment'
    t.datetime 'updated_at', null: false
    t.datetime 'created_at', null: false
    t.boolean 'global', default: false
    t.datetime 'expires'
    t.index ['conversation_id'], name: 'index_mailboxer_notifications_on_conversation_id'
    t.index %w[notified_object_id notified_object_type], name: 'index_mailboxer_notifications_on_notified_object_id_and_type'
    t.index %w[notified_object_type notified_object_id], name: 'mailboxer_notifications_notified_object'
    t.index %w[sender_id sender_type], name: 'index_mailboxer_notifications_on_sender_id_and_sender_type'
    t.index ['type'], name: 'index_mailboxer_notifications_on_type'
  end

  create_table 'mailboxer_receipts', id: :serial, force: :cascade do |t|
    t.string 'receiver_type'
    t.integer 'receiver_id'
    t.integer 'notification_id', null: false
    t.boolean 'is_read', default: false
    t.boolean 'trashed', default: false
    t.boolean 'deleted', default: false
    t.string 'mailbox_type', limit: 25
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'is_delivered', default: false
    t.string 'delivery_method'
    t.string 'message_id'
    t.index ['notification_id'], name: 'index_mailboxer_receipts_on_notification_id'
    t.index %w[receiver_id receiver_type], name: 'index_mailboxer_receipts_on_receiver_id_and_receiver_type'
  end

  create_table 'newsletters', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.integer 'age'
    t.text 'description'
    t.bigint 'city_id'
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'phone'
    t.string 'instrument'
    t.string 'genre'
    t.string 'level'
    t.string 'facebook'
    t.string 'linkedin'
    t.string 'twitter'
    t.string 'skype'
    t.string 'youtube'
    t.float 'latitude'
    t.float 'longitude'
    t.string 'location'
    t.index ['city_id'], name: 'index_users_on_city_id'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'forums'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'mailboxer_conversation_opt_outs', 'mailboxer_conversations', column: 'conversation_id', name: 'mb_opt_outs_on_conversations_id'
  add_foreign_key 'mailboxer_notifications', 'mailboxer_conversations', column: 'conversation_id', name: 'notifications_on_conversation_id'
  add_foreign_key 'mailboxer_receipts', 'mailboxer_notifications', column: 'notification_id', name: 'receipts_on_notification_id'
end
