package shop.mtcoding.jobara.employee.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Employee {
    private Integer userId;
    private String realName;
    private Integer career;
    private String education;

    public Employee(Integer userId, String realName, Integer career, String education) {
        this.userId = userId;
        this.realName = realName;
        this.career = career;
        this.education = education;
    }
}
