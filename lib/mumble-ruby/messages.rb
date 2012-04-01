### Generated by rprotoc. DO NOT EDIT!
### <proto file: Mumble.proto>

require 'protobuf/message/message'
require 'protobuf/message/enum'
require 'protobuf/message/service'
require 'protobuf/message/extend'

module Mumble
  module Messages
    ::Protobuf::OPTIONS[:optimize_for] = :SPEED
    HEADER_FORMAT = "nN"

    @@sym_to_type = {
      version: 0,
      udp_tunnel: 1,
      authenticate: 2,
      ping: 3,
      reject: 4,
      server_sync: 5,
      channel_remove: 6,
      channel_state: 7,
      user_remove: 8,
      user_state: 9,
      ban_list: 10,
      text_message: 11,
      permission_denied: 12,
      acl: 13,
      query_users: 14,
      crypt_setup: 15,
      context_action_add: 16,
      context_action: 17,
      user_list: 18,
      voice_target: 19,
      permission_query: 20,
      codec_version: 21,
      user_stats: 22,
      request_blob: 23,
      server_config: 24
    }

    @@type_to_sym = @@sym_to_type.invert

    class << self
      def all_types
        return @@sym_to_type.keys
      end

      def sym_to_type(sym)
        @@sym_to_type[sym]
      end

      def type_to_class(type)
        const_get(@@type_to_sym[type].to_s.camelcase)
      end

      def raw_to_obj(type, data)
        message = type_to_class(type).new
        message.parse_from_string(data)
        message
      end
    end

    class Version < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :version, 1
      optional :string, :release, 2
      optional :string, :os, 3
      optional :string, :os_version, 4
    end
    class UdpTunnel < ::Protobuf::Message
      defined_in __FILE__
      required :bytes, :packet, 1
    end
    class Authenticate < ::Protobuf::Message
      defined_in __FILE__
      optional :string, :username, 1
      optional :string, :password, 2
      repeated :string, :tokens, 3
      repeated :int32, :celt_versions, 4
    end
    class Ping < ::Protobuf::Message
      defined_in __FILE__
      optional :uint64, :timestamp, 1
      optional :uint32, :good, 2
      optional :uint32, :late, 3
      optional :uint32, :lost, 4
      optional :uint32, :resync, 5
      optional :uint32, :udp_packets, 6
      optional :uint32, :tcp_packets, 7
      optional :float, :udp_ping_avg, 8
      optional :float, :udp_ping_var, 9
      optional :float, :tcp_ping_avg, 10
      optional :float, :tcp_ping_var, 11
    end
    class Reject < ::Protobuf::Message
      defined_in __FILE__
      class RejectType < ::Protobuf::Enum
        defined_in __FILE__
        None = value(:None, 0)
        WrongVersion = value(:WrongVersion, 1)
        InvalidUsername = value(:InvalidUsername, 2)
        WrongUserPW = value(:WrongUserPW, 3)
        WrongServerPW = value(:WrongServerPW, 4)
        UsernameInUse = value(:UsernameInUse, 5)
        ServerFull = value(:ServerFull, 6)
        NoCertificate = value(:NoCertificate, 7)
      end
      optional :RejectType, :type, 1
      optional :string, :reason, 2
    end
    class ServerConfig < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :max_bandwidth, 1
      optional :string, :welcome_text, 2
      optional :bool, :allow_html, 3
      optional :uint32, :message_length, 4
      optional :uint32, :image_message_length, 5
    end
    class ServerSync < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :session, 1
      optional :uint32, :max_bandwidth, 2
      optional :string, :welcome_text, 3
      optional :uint64, :permissions, 4
    end
    class ChannelRemove < ::Protobuf::Message
      defined_in __FILE__
      required :uint32, :channel_id, 1
    end
    class ChannelState < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :channel_id, 1
      optional :uint32, :parent, 2
      optional :string, :name, 3
      repeated :uint32, :links, 4
      optional :string, :description, 5
      repeated :uint32, :links_add, 6
      repeated :uint32, :links_remove, 7
      optional :bool, :temporary, 8, :default => false
      optional :int32, :position, 9, :default => 0
      optional :bytes, :description_hash, 10
    end
    class UserRemove < ::Protobuf::Message
      defined_in __FILE__
      required :uint32, :session, 1
      optional :uint32, :actor, 2
      optional :string, :reason, 3
      optional :bool, :ban, 4
    end
    class UserState < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :session, 1
      optional :uint32, :actor, 2
      optional :string, :name, 3
      optional :uint32, :user_id, 4
      optional :uint32, :channel_id, 5
      optional :bool, :mute, 6
      optional :bool, :deaf, 7
      optional :bool, :suppress, 8
      optional :bool, :self_mute, 9
      optional :bool, :self_deaf, 10
      optional :bytes, :texture, 11
      optional :bytes, :plugin_context, 12
      optional :string, :plugin_identity, 13
      optional :string, :comment, 14
      optional :string, :hash, 15
      optional :bytes, :comment_hash, 16
      optional :bytes, :texture_hash, 17
      optional :bool, :priority_speaker, 18
      optional :bool, :recording, 19
    end
    class BanList < ::Protobuf::Message
      defined_in __FILE__
      class BanEntry < ::Protobuf::Message
        defined_in __FILE__
        required :bytes, :address, 1
        required :uint32, :mask, 2
        optional :string, :name, 3
        optional :string, :hash, 4
        optional :string, :reason, 5
        optional :string, :start, 6
        optional :uint32, :duration, 7
      end
      repeated :BanEntry, :bans, 1
      optional :bool, :query, 2, :default => false
    end
    class TextMessage < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :actor, 1
      repeated :uint32, :session, 2
      repeated :uint32, :channel_id, 3
      repeated :uint32, :tree_id, 4
      required :string, :message, 5
    end
    class PermissionDenied < ::Protobuf::Message
      defined_in __FILE__
      class DenyType < ::Protobuf::Enum
        defined_in __FILE__
        Text = value(:Text, 0)
        Permission = value(:Permission, 1)
        SuperUser = value(:SuperUser, 2)
        ChannelName = value(:ChannelName, 3)
        TextTooLong = value(:TextTooLong, 4)
        H9K = value(:H9K, 5)
        TemporaryChannel = value(:TemporaryChannel, 6)
        MissingCertificate = value(:MissingCertificate, 7)
        UserName = value(:UserName, 8)
        ChannelFull = value(:ChannelFull, 9)
      end
      optional :uint32, :permission, 1
      optional :uint32, :channel_id, 2
      optional :uint32, :session, 3
      optional :string, :reason, 4
      optional :DenyType, :type, 5
      optional :string, :name, 6
    end
    class Acl < ::Protobuf::Message
      defined_in __FILE__
      class ChanGroup < ::Protobuf::Message
        defined_in __FILE__
        required :string, :name, 1
        optional :bool, :inherited, 2, :default => true
        optional :bool, :inherit, 3, :default => true
        optional :bool, :inheritable, 4, :default => true
        repeated :uint32, :add, 5
        repeated :uint32, :remove, 6
        repeated :uint32, :inherited_members, 7
      end
      class ChanACL < ::Protobuf::Message
        defined_in __FILE__
        optional :bool, :apply_here, 1, :default => true
        optional :bool, :apply_subs, 2, :default => true
        optional :bool, :inherited, 3, :default => true
        optional :uint32, :user_id, 4
        optional :string, :group, 5
        optional :uint32, :grant, 6
        optional :uint32, :deny, 7
      end
      required :uint32, :channel_id, 1
      optional :bool, :inherit_acls, 2, :default => true
      repeated :ChanGroup, :groups, 3
      repeated :ChanACL, :acls, 4
      optional :bool, :query, 5, :default => false
    end
    class QueryUsers < ::Protobuf::Message
      defined_in __FILE__
      repeated :uint32, :ids, 1
      repeated :string, :names, 2
    end
    class CryptSetup < ::Protobuf::Message
      defined_in __FILE__
      optional :bytes, :key, 1
      optional :bytes, :client_nonce, 2
      optional :bytes, :server_nonce, 3
    end
    class ContextActionAdd < ::Protobuf::Message
      defined_in __FILE__
      class Context < ::Protobuf::Enum
        defined_in __FILE__
        Server = value(:Server, 1)
        Channel = value(:Channel, 2)
        User = value(:User, 4)
      end
      required :string, :action, 1
      required :string, :text, 2
      optional :uint32, :context, 3
    end
    class ContextAction < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :session, 1
      optional :uint32, :channel_id, 2
      required :string, :action, 3
    end
    class UserList < ::Protobuf::Message
      defined_in __FILE__
      class User < ::Protobuf::Message
        defined_in __FILE__
        required :uint32, :user_id, 1
        optional :string, :name, 2
      end
      repeated :User, :users, 1
    end
    class VoiceTarget < ::Protobuf::Message
      defined_in __FILE__
      class Target < ::Protobuf::Message
        defined_in __FILE__
        repeated :uint32, :session, 1
        optional :uint32, :channel_id, 2
        optional :string, :group, 3
        optional :bool, :links, 4, :default => false
        optional :bool, :children, 5, :default => false
      end
      optional :uint32, :id, 1
      repeated :Target, :targets, 2
    end
    class PermissionQuery < ::Protobuf::Message
      defined_in __FILE__
      optional :uint32, :channel_id, 1
      optional :uint32, :permissions, 2
      optional :bool, :flush, 3, :default => false
    end
    class CodecVersion < ::Protobuf::Message
      defined_in __FILE__
      required :int32, :alpha, 1
      required :int32, :beta, 2
      required :bool, :prefer_alpha, 3, :default => true
    end
    class UserStats < ::Protobuf::Message
      defined_in __FILE__
      class Stats < ::Protobuf::Message
        defined_in __FILE__
        optional :uint32, :good, 1
        optional :uint32, :late, 2
        optional :uint32, :lost, 3
        optional :uint32, :resync, 4
      end
      optional :uint32, :session, 1
      optional :bool, :stats_only, 2, :default => false
      repeated :bytes, :certificates, 3
      optional :Stats, :from_client, 4
      optional :Stats, :from_server, 5
      optional :uint32, :udp_packets, 6
      optional :uint32, :tcp_packets, 7
      optional :float, :udp_ping_avg, 8
      optional :float, :udp_ping_var, 9
      optional :float, :tcp_ping_avg, 10
      optional :float, :tcp_ping_var, 11
      optional :Version, :version, 12
      repeated :int32, :celt_versions, 13
      optional :bytes, :address, 14
      optional :uint32, :bandwidth, 15
      optional :uint32, :onlinesecs, 16
      optional :uint32, :idlesecs, 17
      optional :bool, :strong_certificate, 18, :default => false
    end
    class RequestBlob < ::Protobuf::Message
      defined_in __FILE__
      repeated :uint32, :session_texture, 1
      repeated :uint32, :session_comment, 2
      repeated :uint32, :channel_description, 3
    end
  end
end
