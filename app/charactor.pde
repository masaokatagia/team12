public class Character {
    // 属性（変数）
    protected int HP;
    protected int balletSpeed;
    protected int weapon;
    protected int ap;
    protected int speed;
    protected int x;  // 現在位置のX座標
    protected int y;  // 現在位置のY座標

    // コンストラクタ
    public Character(int HP, int balletSpeed, int weapon, int ap, int speed, int x, int y) {
        this.HP = HP;
        this.balletSpeed = balletSpeed;
        this.weapon = weapon;
        this.ap = ap;
        this.speed = speed;
        this.x = x;
        this.y = y;
    }

    // メソッド：移動
    public void walk() {
        x += speed;  // x座標方向に移動（例として右方向に移動）
        System.out.println("新しい位置: (" + x + ", " + y + ")");
    }

    // メソッド：攻撃
    public void attack() {
        System.out.println("武器番号 " + weapon + " で攻撃！ 攻撃力：" + ap);
    }
}
