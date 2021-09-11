Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB33FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:13 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so3249991wml.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=toaiDr+HoqgKeTV9ngK7JxzaY+3rXFsfglZo4z2EJLQ=;
        b=V1Z/OELEeH5lxksZ0YQ+tl5MVWphV49Jo6mcyGDh2bRXGEc6zidqFSeLWUyq8ORRdF
         zw7m/2KixAY4BzbzJi2wdIU/ETH65+wO+1moMnw1gDr7yduBeSuoCO3Er/NrppDzFV+F
         z3KGBjcedwTQKCGsbEMhG0V8Ia8PosWWpyoZU2C16gwsvk0CXGku2g4rDpGlhq9kQLL9
         OE+zbL61u6U4YhJOtkyGzM6W3SyCKxfJOhZ+ZPL164aMkGchczVZ1rwuN35h1+RFwNI3
         Ljs6rX5R9glSSJNU2r7vyq47KEtur6Y8E4G8gaAQFwyPHhEEGAjFzQwnRNuguWnplqJD
         4Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=toaiDr+HoqgKeTV9ngK7JxzaY+3rXFsfglZo4z2EJLQ=;
        b=LKp1A5xkcmm/XGL+w97eianh7KfuBy5Kl3QnsATqBagF8QxIqUfEVROu7IJCzbPaHU
         NfZ4Pj6Qh+qhlcdKb8tFemjj00rfIG2RS9cGuSn825LM0DlHzC1BL87ucN1ktsvAqCe+
         vHviRvBzz825LvDEwrh9KoXKIboThyxvorjnNSQr+X9WsBWxdcbWnDYstn+p+S5UThwh
         5ogOEzjb0AUysqzT0EdaVvtrE7mRLlshyY+Idq93KVxz3/EdT5J90p8to9FG+Ql5vNl2
         +vXBfmFBVHdcp2PevKnK52lmb3/bKAyUqMg+DeqLhqxLrcHlhGPA5JI+ts0ZQMoiE0On
         lTmw==
X-Gm-Message-State: AOAM532Zn8vMJ+oI7bRdJVwbxAcFKQ23eJP7hNkcgFThATbTgo9ybQPz
	e961Z6nYD0kOffNVp3tS0ZU+X2e8tMwwxA==
X-Google-Smtp-Source: ABdhPJxVR32gp+dMlRDi+/S0MaXwrTzGbB05iAYAMdK8KDjvcQyjj6ZFuX2ol8kHcTA8hML3OP3Vaw==
X-Received: by 2002:a1c:80c7:: with SMTP id b190mr2688909wmd.87.1631366831959;
        Sat, 11 Sep 2021 06:27:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/18] staging: r8188eu: remove unused ODM_StopWorkItem()
Date: Sat, 11 Sep 2021 15:26:25 +0200
Message-Id: <20210911132635.30369-9-straube.linux@gmail.com>
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

Function ODM_StopWorkItem() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 4 ----
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 2ec73d998f0a..bd9d9f832eaf 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -94,10 +94,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 }
 
 /*  Work item relative API. FOr MP driver only~! */
-void ODM_StopWorkItem(void *pRtWorkItem)
-{
-}
-
 void ODM_FreeWorkItem(void *pRtWorkItem)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index febdbe7548ba..5ed4061d2f48 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -96,8 +96,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
 /*  ODM MISC-workitem relative API. */
-void ODM_StopWorkItem(void *pRtWorkItem);
-
 void ODM_FreeWorkItem(void *pRtWorkItem);
 
 void ODM_ScheduleWorkItem(void *pRtWorkItem);
-- 
2.33.0

