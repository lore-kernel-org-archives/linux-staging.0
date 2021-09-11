Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45533FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id d6so6831525wrc.11
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4m9mJssrqG/NmF5Cx2Pbp99k9OyrxMssGnUz8bhdveI=;
        b=WCnt1qn9wskR8EOztENndhkcglJYRe7uLUq9hUof2Mo2K4lS56EVCI6cDPvbv+ign/
         bji5JxC4liRkZINJv9O0rpY5Zikaz2dnNM/flhf86aW26zzQDSG/3HP05xV76n1m/Fow
         KC1DvMI5plGBKaMkjzPAFnE6XeuNqksorFU4iBdcxg7uskY0Q3reZUtUU5lmyan2cxlN
         yI7F6GFIt4ZH+fbJcyP/bJLjGT6sqcLyA0mb2/n1IL1t8OgmigS8Yj7iv3+w/xaaWfg5
         c/jEOvTrGmTRQpm93/QizY5D6/sFae+qkuNdx74SQ8YmuNVjAJRF4pq08c4Zkj3qd6VP
         PMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4m9mJssrqG/NmF5Cx2Pbp99k9OyrxMssGnUz8bhdveI=;
        b=S0FsqbmppoAFFGRuFpBZ51J2pMtrSvkXsHjYB8/MNntfPcZvCa2PEXBEiMf7SkEcPv
         9drtWrtFaPYcUwJUZvuQrUPaP7rxGlhX3qVyqbEXgkgwao3Y2n+5k1aoxws2f91GHi0S
         F0poZkJfohKTGBcbF8sqGl6xDzV4FdChLta6kObL5wEKIDotBqgpDwCT6sG9t5ubACU+
         F5rLcTFnLEbJuE0KrMfPOYYYbT5A5mYeTl7jUeFbCFX7wFxhqoCMt3SwIKoqbIgZdGkX
         H765gxLppI3+OGsrpM44/DZNhuCwZTiiOOc1VlYb89DhHZsVzdAz6AJ1W1vEWVwNB5Ai
         U8gA==
X-Gm-Message-State: AOAM532Npe2UAHF13Y3mQ7QoGmR54GAQIhPwvw7nxLTP7daAaCoP4iB1
	sV/tFJMmW2kYZUq+vcime0M=
X-Google-Smtp-Source: ABdhPJz4sAOXzIUG8W2l6DQEIIm89WHkk67pZt+8g035DPlKfyob82o1XlV4PM3uW7S3KBBXqkmYaw==
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr3112111wrq.263.1631366834406;
        Sat, 11 Sep 2021 06:27:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.13
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
Subject: [PATCH 11/18] staging: r8188eu: remove unused ODM_IsWorkItemScheduled()
Date: Sat, 11 Sep 2021 15:26:28 +0200
Message-Id: <20210911132635.30369-12-straube.linux@gmail.com>
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

Function ODM_IsWorkItemScheduled() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm_interface.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index c4ab858db29b..7fd450575eb4 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -93,11 +93,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 	return !memcmp(pBuf1, pBuf2, length);
 }
 
-/*  Work item relative API. FOr MP driver only~! */
-void ODM_IsWorkItemScheduled(void *pRtWorkItem)
-{
-}
-
 /*  ODM Timer relative API. */
 void ODM_StallExecution(u32 usDelay)
 {
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 65749c213cb9..f6c23fd9b31b 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -95,9 +95,6 @@ void ODM_FreeMemory(struct odm_dm_struct *pDM_Odm, void *pPtr, u32 length);
 s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
-/*  ODM MISC-workitem relative API. */
-void ODM_IsWorkItemScheduled(void *pRtWorkItem);
-
 /*  ODM Timer relative API. */
 void ODM_StallExecution(u32 usDelay);
 
-- 
2.33.0

