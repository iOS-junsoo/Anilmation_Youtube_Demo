//UIView.animate(withDuration: 1,
//                       // ~시간동안 애니메이션이 진행되구요...
//                       delay: 1,
//                       // ~시간이후에 애니메이션이 진행되요...
//                       usingSpringWithDamping: 0.6,
//                       // 그리구 0~1.0사이에 값을 지정할 수 있어요...
//                       // 요만큼 튕긴다?? 튕겨요...
//                       initialSpringVelocity: 1,
//                       // 이건 속도를 지정해주구요...
//                       options: [.curveEaseIn],
//                       // 이건 해당 애니메이션이 어떤 유형으로 움직이는지 보여줘요...
//                       // 아래에서 어떤게 있는지 한 번 알아볼게요...
//                       animations: {
//                       // 우리 animate는 이렇게 사용해요...
//                       // 우리 animate 잘 사용해주세요...
//                       // 마지막으로 self.를 지정해줘야해요...
//                       self.animateView.alpha = 1
//        })

import UIKit

class ViewController: UIViewController {

    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200)) //View 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .red //View 배경색
        myView.center = view.center //View 중앙으로
        view.addSubview(myView) //View 추가
        
        let button = UIButton(frame: CGRect(x: (view.frame.size.width - 200)/2, y: view.frame.size.height - 220, width: 200, height: 70)) //버튼 생성
        button.backgroundColor = .black //버튼 색
        button.setTitleColor(.white, for: .normal) //버튼의 타이틀 색
        button.setTitle("Go", for: .normal) //버튼의 타이틀
        button.addTarget(self, action: #selector(animate), for: .touchUpInside) //버튼을 클릭하면 작동되는 함수 연결
        view.addSubview(button) //버튼 추가
        
    }
    @objc func animate() {
//        UIView.animate(withDuration: 1, animations: {
//            //MARK: View 없애기
//            self.myView.alpha = 0.0
//            //MARK: View 커기지
//            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
//            self.myView.center = self.view.center
//        })
        //MARK: View 줌인 줌아웃
        UIView.animate(withDuration: 1, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            self.myView.center = self.view.center
        }, completion: { done in
            if done { //위의 애니메이션이 작동 되고 난후 - 즉, 다커지고 나면
                self.shrink() //작아지는 함수 작동
            }
        })
    }
    
    func shrink() {
        UIView.animate(withDuration: 1, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            self.myView.center = self.view.center
        }, completion: { done in
            if done { //위의 애니메이션이 작동 되고 난후 - 즉, 다커지고 나면
                self.animate() //커지는 함수 작동
            }
        })
    }

}

