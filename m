Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37243FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:11 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id x6so6829482wrv.13
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZDLKIG02S57iTgea+fzcYhjGfU+Y6z/F7xXcBTQO7sk=;
        b=khr1+Ts8uUAV2Jd72Zwr4SK9Yorkz1mUSjJI4wmtZhEBBXawqaVKi2mUoDBUEdzCs5
         KDdOeX2Ht2nVW5i6DhB6wXfibOxJc9LKrvjkGUs/DLwKLqiYjWoEcwm9FmrV5ODckZ7Z
         LwUUb05VZxasw+aDIhwZ0m7mCo/mVexR/rogfn6Odb7tIYxtC+Vd/piEs6lTP46ErDZ4
         7onOOHkx3IrF/4/ZiiKJ3gR5hJSRrYhZIWvXGBCV0M00gjP+FC/bo8vy7BsCn+n/kdsX
         BvBMYjysQHQAJq16u0QIBm+eej1y01c3wu+R6PmibgQ46rw7rYpNKgek6lBBuXRa5VOP
         VTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZDLKIG02S57iTgea+fzcYhjGfU+Y6z/F7xXcBTQO7sk=;
        b=tQQ/J6AGtF46XOIoH0g5+XLahhaVZCwJ8YC7dwp34D6b+Dw83ZuZBApOZSCB7JQyRS
         sjE+Kmo9Qm58UBnGOvy1tcIZn8xK/cHpAVzMBm63XrP75huXLhdJ4BEr7fyeTY/DXx3c
         sxxORTRhmVkQjGwDbQta4YP6CvnoAH4FCNBCyyv9D5vuqkWk0KCC4/vigriotoG30Xwu
         fYL+woPtWzmTl4JrjLvMoWpsFTfbapEQFVSdXkZkswSA/4CZPA3Lx5IaQqzKtI8iOee0
         sOrrigbNex0km+UpeWUZlgZB6xtrXJEtaNfPDJlhR3rPKRLoq12hbIqI2O9uxSEJJjr/
         sU+A==
X-Gm-Message-State: AOAM533dsCHqUJQ/tN/jp2HtUUoepn6wQgsA4glbrH04yT71+uOdC7j7
	EZNwYC90Eg8UiGuP6MUuFbA=
X-Google-Smtp-Source: ABdhPJy92YBonb8jFzGRvPw83j0lHDfOttGY3Sy8T8AOzB3IdRKycfCNEAXp5v7NS1dwWReQe9xt6w==
X-Received: by 2002:adf:f892:: with SMTP id u18mr3062773wrp.31.1631366830397;
        Sat, 11 Sep 2021 06:27:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 06/18] staging: r8188eu: remove unused ODM_InitializeWorkItem()
Date: Sat, 11 Sep 2021 15:26:23 +0200
Message-Id: <20210911132635.30369-7-straube.linux@gmail.com>
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

Function ODM_InitializeWorkItem() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 6 ------
 drivers/staging/r8188eu/include/odm_interface.h | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 80c8a18f3791..ee1d2cb232a5 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -94,12 +94,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 }
 
 /*  Work item relative API. FOr MP driver only~! */
-void ODM_InitializeWorkItem(struct odm_dm_struct *pDM_Odm, void *pRtWorkItem,
-			    RT_WORKITEM_CALL_BACK RtWorkItemCallback,
-			    void *pContext, const char *szID)
-{
-}
-
 void ODM_StartWorkItem(void *pRtWorkItem)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 45caa73c0af0..6f65ae519b4f 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -96,10 +96,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
 /*  ODM MISC-workitem relative API. */
-void ODM_InitializeWorkItem(struct odm_dm_struct *pDM_Odm, void *pRtWorkItem,
-			    RT_WORKITEM_CALL_BACK RtWorkItemCallback,
-			    void *pContext, const char *szID);
-
 void ODM_StartWorkItem(void *pRtWorkItem);
 
 void ODM_StopWorkItem(void *pRtWorkItem);
-- 
2.33.0

