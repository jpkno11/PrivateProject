package shop.mtcoding.jobara.company;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import shop.mtcoding.jobara.common.aop.CompanyCheckApi;
import shop.mtcoding.jobara.common.config.auth.LoginUser;
import shop.mtcoding.jobara.common.dto.ResponseDto;
import shop.mtcoding.jobara.company.dto.CompanyReq.CompanyJoinReqDto;
import shop.mtcoding.jobara.company.dto.CompanyReq.CompanyUpdateReqDto;
import shop.mtcoding.jobara.company.dto.CompanyResp.CompanyInfo;

@RestController
@RequiredArgsConstructor
public class CompanyController {
    private final CompanyService companyService;
    private final HttpSession session;

    @GetMapping("/company/{id}")
    @CompanyCheckApi
    public ResponseEntity<?> detail(@PathVariable Integer id) {
        // 1. 기능 : 해당 기업 회원의 상세 정보를 불러오는 메소드
        // 2. Arguments :
        // - PathVariable : id, 해당 기업회원의 id이며, PK이다.

        // 3. Return :
        // - CompanyInfo
        //   (id, username, email, address, detailAddress, tel, 
        //    company(companyName, companyScale, companyField))

        // 작성자 : 김태훈
        // 작성일 : 2023-03-24
        // 수정자 : -
        // 수정일 : -

        CompanyInfo companyInfo = companyService.getCompany(id);
        return new ResponseEntity<>(new ResponseDto<>(1, "기업 회원 정보 불러오기 성공", companyInfo), HttpStatus.OK);
    }

    @PostMapping("/joinCompany")
    public ResponseEntity<?> join(@RequestBody @Valid CompanyJoinReqDto companyJoinReqDto, 
            BindingResult bindingResult) {
        // 1. 기능 : 기업 회원 가입 기능을 구현하는 메소드
        // 2. Arguments :
        // - CompanyJoinReqDto
        //   (username, password, email, address, detailAddress, companyNumb, companyName)
        //    username : 최소 문자열길이 2, 최대 문자열길이 16, empty
        //    password : 최소 문자열길이 2, 최대 문자열길이 32, empty
        //    email : 최소 문자열길이 2, 최대 문자열길이 32, empty
        //    address : 최소 문자열길이 2, 최대 문자열길이 32, empty
        //    detailAddress : 최소 문자열길이 2, 최대 문자열길이 64, empty
        //    companyNumb : 최소 문자열길이 2, 최대 문자열길이 16, empty
        //    companyName : 최소 문자열길이 1, 최대 문자열길이 16, empty

        // 3. Return :

        // 작성자 : 김태훈
        // 작성일 : 2023-03-24
        // 수정자 : -
        // 수정일 : -
        
        companyService.insertCompany(companyJoinReqDto);
        return new ResponseEntity<>(new ResponseDto<>(1, "기업 회원 가입 성공", null), HttpStatus.CREATED);
    }

    @PutMapping("/company/{id}")
    @CompanyCheckApi
    public ResponseEntity<?> update(@PathVariable Integer id, @RequestBody @Valid CompanyUpdateReqDto companyUpdateReqDto, 
            BindingResult bindingResult) {
        // 1. 기능 : 기업 회원 수정 기능을 구현하는 메소드
        // 2. Arguments :
        // - CompanyUpdateReqDto
        //   (password, email, address, detailAddress, tel, profile, companyName, companyScale, companyField)
        //    password : 최소 문자열길이 2, 최대 문자열길이 32, empty
        //    email : 최소 문자열길이 2, 최대 문자열길이 32, empty
        //    address : 최소 문자열길이 2, 최대 문자열길이 32, empty
        //    detailAddress : 최소 문자열길이 2, 최대 문자열길이 64, empty
        //    tel : 최소 문자열길이 2, 최대 문자열길이 64, empty
        //    profile : empty
        //    companyName : 최소 문자열길이 1, 최대 문자열길이 16, empty
        //    companyScale : 최소 문자열길이 1, 최대 문자열길이 8, empty
        //    companyField : 최소 문자열길이 1, 최대 문자열길이 16, empty

        // 3. Return :

        // 작성자 : 김태훈
        // 작성일 : 2023-03-24
        // 수정자 : -
        // 수정일 : -

        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        companyService.updateCompany(companyUpdateReqDto, loginUser.getId());
        return new ResponseEntity<>(new ResponseDto<>(1, "기업 회원 수정 성공", null), HttpStatus.CREATED);
    }
}
