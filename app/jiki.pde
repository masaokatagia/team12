public class Hero extends Character {

    // コンストラクタ（スーパークラスのものを使う）
    public Hero(int HP, int balletSpeed, int weapon, int ap, int speed, int x, int y) {
        super(HP, balletSpeed, weapon, ap, speed, x, y);
    }

    // walk() のオーバーライド
    @Override
    public void walk() {
        x += speed;
        System.out.println("Heroが歩いています。現在位置: (" + x + ", " + y + ")");
    }

    // attack() のオーバーライド
    @Override
    public void attack() {
        System.out.println("Heroが武器番号 " + weapon + " で " + ap + " のダメージを与えた！");
    }

    // loadIMG() のオーバーライド
    @Override
    public void loadIMG() {
        System.out.println("Heroの画像を読み込みました。");
    }

    // junp() のオーバーライド
    @Override
    public void junp() {
        y += 10;
        System.out.println("Heroがジャンプ！ 新しい位置: (" + x + ", " + y + ")");
    }
}
