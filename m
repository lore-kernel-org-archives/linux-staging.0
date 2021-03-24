Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B52E6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:02 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id b9so24319913wrt.8
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mDCBmXSv0GJTIbqsrNWebF1i5ik4+dtqW/xY7fjSilc=;
        b=UYpSqygtJ0ydMIpoBhFZWaXZ8lmd33LFGeQXFMiGSW1w8BB0eE+yOPKhKYF4F948fQ
         PbN9Moaj6jwiso9tcfZPN9AgM0zC01Gn7Knu8J4OAelvrcA5ZpPYvuDvTxhgB1XZcFnv
         e9vSBXzFzm3IratBVjBotgE1YfgrU60wkV54eZjFvwQQ3BuwhYot2obCipBJC6hjOXSa
         E82cpZ9SnpRa/Ymza5mAtdXum/mTD4+DJOkbNc35y5prrbEjh2z7nO4/pZMl0MJev5qJ
         EX4JygWE9zcJEQXGjVJRjT3gtjgG1EdCPdWyQGJVdKzGpFg7mV7uagT85eGEXZJ6IaA6
         f7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mDCBmXSv0GJTIbqsrNWebF1i5ik4+dtqW/xY7fjSilc=;
        b=DJrJofVeFGBZKjtqPeZEhKd1bAmD4aIwwlxqIKHjbCSWn74I+98sdN+EsCL+2pqUOq
         WmyTJxRr9GK20lRWG1UHT+/8ODpKminHJ8Z1EV2xPo/EVvGkKEezH3E5rxHerLjxQdCF
         88bjSIhFpq+T7rvqGgGI2oYyzQIdTzpc25LhsQOjlfbFYiitXnJlb2lcZ+lX8UUU7WKI
         nsgyEgfhjEvvzngSc2WRs2Dq25QxL3t95ckDDP2+v2UiWYI/KuZmVGsDYEIRleAvhQbK
         IiWqXpWKdaWOWHijEeq1KAaCIdCxtKwKtLNu27CAuAXOUOlXuuRYdTYu9LkoGOHbU52S
         6O3g==
X-Gm-Message-State: AOAM530PCA2P2lMO4ZBhAdRvSPKYENYxfzB+kZ7mpeLQOITxqJS0FgCQ
	ellUxjTPfvcsPBqJk9Tclsg=
X-Google-Smtp-Source: ABdhPJxeC63ZvlqY/5tjQIn6zQPEgAL/lqsncUf4Q0KHjBfGcVw7DOUaeEmrr06gN4PeEgHsFbR/4Q==
X-Received: by 2002:adf:de91:: with SMTP id w17mr3373066wrl.268.1616589901021;
        Wed, 24 Mar 2021 05:45:01 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:00 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 15/33] Staging: rtl8723bs: remove named enums in rtw_wifi_regd.h
Date: Wed, 24 Mar 2021 13:44:38 +0100
Message-Id: <20210324124456.25221-16-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum definition in
include/rtw_wifi_regd.h:

	enum country_code_type_t

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_wifi_regd.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
index 66bf3d1b1d5a..e611651cb40b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_wifi_regd.h
@@ -8,13 +8,6 @@
 #ifndef __RTW_WIFI_REGD_H__
 #define __RTW_WIFI_REGD_H__
 
-enum country_code_type_t {
-	COUNTRY_CODE_USER = 0,
-
-	/*add new channel plan above this line */
-	COUNTRY_CODE_MAX
-};
-
 void rtw_regd_init(struct wiphy *wiphy,
 		   void (*reg_notifier)(struct wiphy *wiphy,
 					struct regulatory_request *request));
-- 
2.30.2

