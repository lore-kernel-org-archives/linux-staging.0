Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C260C3FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:16 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q26so6849625wrc.7
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jv3SaRimBllN++YKlTH+V3/aNHdh4o+a7TE+SifVGM=;
        b=WTmuR1Ic0Dizf8+Liqtye5+Rf8dDv/r2YRyPtxDr6ji160UYi2LV2c5qA56MiC3XP4
         zdOW2iFgiyI3XBrmrMeviCkhmjktz2c+RhDN67jHwl7YUoAPqh4rcusjJ0/z5o7nqIrA
         A9RquTtjgy8SoAuTMYxc2upIapZjH+LDnZ0T5Yil/W//yBmIXvNu5nGNOL1/Q+bVLLd/
         6FThEAPFNMVDm7oHEJ45AtDZWPXyrI2zR8QF/6PEFkE02O+GXGVxm7lXki8Gxwfy0Wbp
         AU1qnjHsrhE6HRPJHcq4oZBjftTwsCZdnNeXijbAKwwsAHTsXV+wQWF8dAGqPHiSNrkA
         KGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jv3SaRimBllN++YKlTH+V3/aNHdh4o+a7TE+SifVGM=;
        b=xr+GPC37LyE/VDT9+JUuYbA+ZSq53TeofLfG4BeoOqK92isnluDhmwCMOoUwR2Ildh
         ofrxqgYu14DWKfe5/fueXa2Uct6Q5SN0YJu0i7sabL7Dmo4nnYOOGfB/5RiEWndTK5KD
         dVynIW8PBotK+v3lnSD0BlKYeEQyKEqiZYaUMxbU/BczE1pr4YBHTetgiYbOMthYttDZ
         l0JmCduqPeuND7qMAM3hOHLLgTyI/v4DAD38AmGzmH6DWECuzgyb9KKvfb98/oXn68Pt
         SybH5shahFyVQeAevHUD/DhOCtEQMOtvUaDiVabMvvoSFWJiWz2pcaMGbRUHy2ZfzCsn
         CEHA==
X-Gm-Message-State: AOAM532I5wylOLNRnm8i7Hk2JhyOzYu7y1vawOlJRjOkopeACxBTq+Cx
	Oj6u/LDx4Rw9Bqfg+VamcNw=
X-Google-Smtp-Source: ABdhPJyzhEh86wwW3pEQrZ5IyDsuL33ZfgoZs/hu2OifhnfFg9OfybAoyO7Hk0ZzwkfbRcrBxaWAKA==
X-Received: by 2002:a05:6000:160d:: with SMTP id u13mr3201239wrb.17.1631366835236;
        Sat, 11 Sep 2021 06:27:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 12/18] staging: r8188eu: remove unused ODM_SetTimer()
Date: Sat, 11 Sep 2021 15:26:29 +0200
Message-Id: <20210911132635.30369-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911132635.30369-1-straube.linux@gmail.com>
References: <20210911132635.30369-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ODM_SetTimer() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm_interface.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 7fd450575eb4..31888a6dd9a8 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -114,11 +114,6 @@ void ODM_sleep_ms(u32 ms)
 	msleep(ms);
 }
 
-void ODM_SetTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer, u32 msDelay)
-{
-	_set_timer(pTimer, msDelay); /* ms */
-}
-
 void ODM_CancelTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer)
 {
 	_cancel_timer_ex(pTimer);
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index f6c23fd9b31b..ce9e4d8b6830 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -104,9 +104,6 @@ void ODM_delay_us(u32 us);
 
 void ODM_sleep_ms(u32 ms);
 
-void ODM_SetTimer(struct odm_dm_struct *pDM_Odm, struct timer_list *pTimer,
-		  u32 msDelay);
-
 void ODM_InitializeTimer(struct odm_dm_struct *pDM_Odm,
 			 struct timer_list *pTimer, void *CallBackFunc,
 			 void *pContext, const char *szID);
-- 
2.33.0

