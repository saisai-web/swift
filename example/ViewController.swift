import UIKit

// 追加①：UITableViewDelegate, UITableViewDataSourceを追加
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

    // 追加②：セルに表示するデータ
    var data = [
        ["qiita","2021/8/21"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 追加③：セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    // 追加④：セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // TableViewCellの中に配置したLabelを取得する
        let label1 = cell.contentView.viewWithTag(1) as! UILabel
        let label2 = cell.contentView.viewWithTag(2) as! UILabel
        let button = cell.contentView.viewWithTag(3) as! UIButton

        // Labelにテキストを設定する
        label1.text = data[indexPath.row][0]
        label2.text = data[indexPath.row][1]
        button.setTitle("クリック", for: .normal)
            button.addTarget(self, action: #selector(btnEvent), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    // UIButtonを選択した時
    @objc func btnEvent(_ sender: UIButton) {
        guard let b = storyboard?.instantiateViewController(identifier: "himadana-") else{return}
                
        present(b, animated: true, completion: nil)
    }
    
}
