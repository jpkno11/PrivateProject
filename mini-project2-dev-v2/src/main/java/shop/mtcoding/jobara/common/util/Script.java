package shop.mtcoding.jobara.common.util;

public class Script {
    public static String back(String msg) {
        StringBuilder sb = new StringBuilder();
        sb.append("<script>");
        sb.append("alert('" + msg + "');");
        sb.append("history.back();");
        sb.append("</script>");
        return sb.toString();
    }

    public static String herf(String msg, String location) {
        StringBuilder sb = new StringBuilder();
        sb.append("<script>");
        sb.append("alert('" + msg + "');");
        sb.append("location.href =\" " + location + "\" ;");
        sb.append("</script>");
        return sb.toString();
    }
}
