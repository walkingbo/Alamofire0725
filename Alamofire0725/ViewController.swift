import UIKit

import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //Alamofire를 이용해서 데이터 받아오기
        let request = Alamofire.request("https://httpbin.org/get",method: .get, parameters: nil)
        request.response{
            response in
            let msg = String(data:response.data!,encoding: String.Encoding.utf8)
            print(msg!)
        }
        */
        
        //문자열을 받아오는 메소드
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let request = Alamofire.request("https://httpbin.org/get",method: .get, parameters: nil)
        request.responseString{
            response in
            print(response.result.value!)
            sleep(10)
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
 
        
        /*
        //Kakao Open API 활용
        //다운로드 받을 주소 생성
        var addr = "https://dapi.kakao.com/v3/search/book?target=title&page=2&query="
        //인코딩 문자열을 만들기
        let query = "자바".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
         addr = addr + query!
        
        let request = Alamofire.request(addr, method: .get, encoding: JSONEncoding.default, headers:["Authorization" : "KakaoAK 06fab290c9f4eb6f130c09796d57bc30"])
        request.responseJSON{
            response in
            //데이터를 딕셔너리로 변환
            let data = response.result.value as! [String:Any]
            let documents = data["documents"] as! NSArray
            for temp in documents{
               let imsi = temp as! NSDictionary
                print(imsi["title"] as! String)
                
                let auth = imsi["authors"] as! NSArray
                for author in auth{
                    print(author as! String)
                }
                
                
            }
        }
        */
        
    }


}

