class Charactor {
    int HP;             // 体力
    int bulletSpeed;    // 弾の速度
    int weapon;         // 武器
    int ap;             // 攻撃力
    int speed;          // 移動速度
    int x;              // X座標
    int y;              // Y座標

    Charactor(int HP, int bulletSpeed, int weapon, int ap, int speed, int x, int y) {
        this.HP = HP;
        this.bulletSpeed = bulletSpeed;
        this.weapon = weapon;
        this.ap = ap;
        this.speed = speed;
        this.x = x;
        this.y = y;
    }

    // 歩く
    void walk() {
        x += speed;
    }

    // 攻撃
    void attack() {
    }

    // ジャンプ
    void jump() {
        y -= 10; // 上にジャンプ
    }

    // 画像読み込み
    void loadIMG() {
    }
}

