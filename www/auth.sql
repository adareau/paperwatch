
SELECT 'authentication' AS component,
    case sqlpage.basic_auth_username()
        when 'admin'
            then '$argon2id$v=19$m=19456,t=2,p=1$+BSXMGi+Ftzqks4vYT1ZHA$FdeEqkOrnrxbLkfHLjMaoKSMjCHCujgTgNTvPrxySzY'
    end AS password_hash,
    sqlpage.basic_auth_password() AS password;
