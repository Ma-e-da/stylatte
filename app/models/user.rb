class User < ActiveRecord::Base

# posts
  has_many :posts, dependent: :destroy
# favorites
  has_many :favorites
  has_many :favorite_scomments, through: :favorites, source: :scomment
# ratings
  has_many :ratings
  has_many :rating_scomments, through: :ratings, source: :scomment
# relationship
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:  :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:  :destroy
# following, followers
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

# ヘッダーの写真（アバターと違う方）
  mount_uploader :picture, PictureUploader
  validate :picture_size

  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  # 与えられた文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続的セッションで使用するユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # ユーザーログインを破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # アカウントを有効にする
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # パスワード再設定の期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # 試作feedの定義
  # 完全な実装は第12章「ユーザーをフォローする」を参照してください。
  def feed
    Post.where("user_id = ?",id)
  end

# フォロー、アンフォローのメソッド３つ。

  # ユーザーをフォローするメソッド。
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローするメソッド。
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返すメソッド。
  def following?(other_user)
    following.include?(other_user)
  end

# Favorite関連
  def favorite?(scomment)
      favorites.find_by(scomment_id: scomment.id)
  end

  def favorite!(scomment)
    favorites.create!(scomment_id: scomment.id)
  end

  def unfavorite!(scomment)
    favorites.find_by(scomment_id: scomment.id).destroy
  end

# rating関連
  def rating?(scomment)
      ratings.find_by(scomment_id: scomment.id)
  end

# enum; プログラムからは文字列（名前）でアクセスでき、DBには整数値で保存される属性を作成できます。
# DBカラムのデフォルト値はenumの初期値と合わせておきます。

# add_column :users, :gender, :integer
# add_column :users, :country, :integer
# add_column :users, :height, :string
# add_column :users, :size, :string
# add_column :users, :age, :string
# add_column :users, :hair_style, :integer
# add_column :users, :hair_color, :integer
# add_column :users, :eyes_color, :integer

enum gender: { no_choice_gender: 0, male: 1, female: 2, others: 3 }
enum country: { no_choice_country: 0, japan: 1, usa: 2, china: 3, other_countries: 4 }
enum hair_style: { no_choice_hair_style: 0, short: 1, middle: 2, long: 3, other_hair_style: 4 }
enum hair_color: { no_choice_hair_color: 0, black_hair: 1, brown_hair: 2, blond_hair: 3, red_hair: 4, other_hair_color: 4 }
enum eyes_color: { no_choice_eyes_color: 0, brown: 1, blue: 2, green: 3, other_eyes_color: 4 }


# scope/絞り込み（ユーザーが入力し、usersコントローラーからの指令が出たらscope（絞り込み）をする。）
  # ユーザー名による絞り込み
  scope :get_by_name, ->(name) {
    where("name like ?", "%#{name}%")
  }
  # 性別による絞り込み
  scope :get_by_gender, ->(gender) {
    where(gender: gender)
  }
  # 国による絞り込み
  scope :get_by_country, ->(country) {
    where(country: country)
  }
  # stylistかによる絞り込み
  scope :get_by_stylist, ->(stylist) {
    where(stylist: stylist)
  }

  # スタイリストかどうかによる絞り込み（プルダウンで）enumなし。integerでなく真偽値なので。
  SELECT_OPTIONS = [
      ['Stylist', [
          ['Not Stylist', 'f'],
          ['Stylist', 't'],
        ]
      ],
    ]


  private

  # メールアドレスをすべて小文字にする
  def downcase_email
    self.email = email.downcase
  end

  # 有効化トークンとダイジェストを作成および代入する
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  # アップロード画像のサイズを検証する
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
