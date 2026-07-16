package pagefactory;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * Annotation definition modeling Selenium's @FindBy mechanism.
 */
@interface FindBy {
    String id() default "";
    String xpath() default "";
}

/**
 * Page Factory Pattern implementation leveraging runtime reflection.
 * Dynamically binds element locators to page fields on instantiation.
 */
public class LoginPage {

    @FindBy(id = "txt-username")
    private String usernameField;

    @FindBy(id = "txt-password")
    private String passwordField;

    @FindBy(xpath = "//button[@type='submit']")
    private String loginButton;

    // Local locator cache matching declared fields to annotations
    private final Map<String, String> locatorCache = new HashMap<>();

    public LoginPage() {
        // Triggers the Page Factory element initialization engine
        initElements(this);
    }

    /**
     * Simulates standard Selenium PageFactory initialization.
     * Uses reflection to locate annotated fields and bind selectors.
     */
    private void initElements(Object page) {
        Field[] fields = page.getClass().getDeclaredFields();
        for (Field field : fields) {
            if (field.isAnnotationPresent(FindBy.class)) {
                FindBy findBy = field.getAnnotation(FindBy.class);
                String locator = !findBy.id().isEmpty() ? "ID: " + findBy.id() : "XPath: " + findBy.xpath();
                locatorCache.put(field.getName(), locator);
            }
        }
    }

    public void enterUsername(String username) {
        System.out.println("[PAGE-FACTORY] Locating element via " + locatorCache.get("usernameField") + " -> Typing: " + username);
    }

    public void enterPassword(String password) {
        System.out.println("[PAGE-FACTORY] Locating element via " + locatorCache.get("passwordField") + " -> Typing: [SECURE]");
    }

    public void clickLogin() {
        System.out.println("[PAGE-FACTORY] Clicking element located via " + locatorCache.get("loginButton"));
    }
}