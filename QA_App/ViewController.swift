import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var showAnswerAndShowNextQuestionButton: UIButton!
    
    private var questions:Array = [Question]()
    private var index:Int = 0
    private var buttonState:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonType()
        labelType()
        
        let question1 = Question(description: "仰頭點眼藥水時，怎麼做眼睛就不會亂眨了？", answer: "微微張嘴")
        
        let question2 = Question(description: "什麼時候看書會特別記得牢？", answer: "上廁所的時候")
        
        let question3 = Question(description: "被蚊子咬完時該怎麼做就不會癢了？", answer: "塗上肥皂")
        
        let question4 = Question(description: "切洋蔥怎麼做就不會流淚？", answer: "嚼口香糖")
        
        let question5 = Question(description: "臭屁和臭雞蛋為什麼會臭？", answer: "因為他們都含有同一種發出臭味的氣體硫化氫")
        
        let question6 = Question(description: "牛奶巧克力跟可口可樂哪一個咖啡因含量比較多？", answer: "牛奶巧克力")
        
        let question7 = Question(description: "鯨魚的心臟平均每小時跳幾次？", answer: "540次")
        
        let question8 = Question(description: "在我們吸入的氧氣之中，有多少是被腦細胞消耗的？", answer: "1/5")
        
        let question9 = Question(description: "為什麼飛蛾不會吃東西？", answer: "因為牠沒有口和胃")
        
        let question10 = Question(description: "左撇子男人跟左撇子女人哪個多？", answer: "左撇子的男人多一倍")
        
        questions.append(question1)
        questions.append(question2)
        questions.append(question3)
        questions.append(question4)
        questions.append(question5)
        questions.append(question6)
        questions.append(question7)
        questions.append(question8)
        questions.append(question9)
        questions.append(question10)
        
        questions.shuffle()
        
        questionLabel.text = questions[index].description
        
        indexLabel.text = "第\(index + 1) / 10題"
        
        showAnswerAndShowNextQuestionButton.setTitle("showAnswer", for: UIControl.State.normal)
        
        print("question.count = ", questions.count)
        print("default index = ", index)
    
    }

    @IBAction func restart(_ sender: UIButton) {
        
        index = 0
        buttonState = false
        questions.shuffle()
        questionLabel.text = questions[index].description
        showAnswerAndShowNextQuestionButton.setTitle("showAnswer", for: UIControl.State.normal)
        indexLabel.text = "第\(index + 1) / 10題"
        answerLabel.text = "Answer"
        print("Restart")
        
    }
    
    @IBAction func next(_ sender: UIButton) {

        if buttonState == false {
            
            answerLabel.text = questions[index].answer
            sender.setTitle("Next", for: UIControl.State.normal)
            buttonState = true
            
        } else {
            
            sender.setTitle("ShowAnswer", for: UIControl.State.normal)

            index += 1

            if index == questions.count {

                index = 0
                print("reset index")

            }

            questionLabel.text = questions[index].description
            indexLabel.text = "第\(index + 1) / 10題"
            answerLabel.text = "Answer"
            buttonState = false
            
        }
        
        print("current index = ", index)
        
    }
    
    private func buttonType() {
        
        restartButton.layer.cornerRadius = 15
        restartButton.layer.borderColor = UIColor.brown.cgColor
        restartButton.layer.backgroundColor = UIColor(red: 230/255, green: 251/255, blue: 120/255, alpha: 1).cgColor
        restartButton.layer.borderWidth = 2
        restartButton.tintColor = UIColor.black
        
        showAnswerAndShowNextQuestionButton.layer.cornerRadius = 15
        showAnswerAndShowNextQuestionButton.layer.borderColor = UIColor.brown.cgColor
        showAnswerAndShowNextQuestionButton.layer.backgroundColor = UIColor(red: 230/255, green: 251/255, blue: 120/255, alpha: 1).cgColor
        showAnswerAndShowNextQuestionButton.layer.borderWidth = 2
        showAnswerAndShowNextQuestionButton.tintColor = UIColor.black
        
    }
    
    private func labelType() {
        
        answerLabel.layer.cornerRadius = 15
        answerLabel.clipsToBounds = true
        answerLabel.backgroundColor = UIColor(red: 24/255, green: 90/255, blue: 178/255, alpha: 0.5)
        answerLabel.numberOfLines = 5
        
        questionLabel.layer.cornerRadius = 15
        questionLabel.clipsToBounds = true
        questionLabel.backgroundColor = UIColor(red: 24/255, green: 90/255, blue: 178/255, alpha: 0.5)
        questionLabel.numberOfLines = 5
        
    }
    
}
