Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45203FC3
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id i3so3124339wmq.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POwxzOGbaxERw6tzIml22WJjBb0QN0x5uUL6a441S9o=;
        b=n+Okq3Snw94UeY/WLWGfGkE8kMNRH7WvKolSF69MPAa0vsclEHzWCtIzk8uKSjAx0q
         rckB2Cy9dI5gJYoY0YifbIiE7GqZf3iUX17EBndgagjQmq+EuZUidP2GdVvtsaDKU2Ym
         DuQLjuJO3Lmagz5CT6jG7Ex6Iel2wR3RAI3H45lc9o2qBIKWxHzLVpeY5T952JDl4x0y
         ZrgTk9ZhVSpa27StwB7NTT4WKx1IJR6qLAegfz1gjs+Sd9r6NMDfwFwtyqGBldQjFjcc
         ktGQTwrDjEE8s+UxhwDSrzA0L1m7Vm73Gn0858metk7MwZP7+Bcz9A5Mpei61+3zHdB9
         j2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POwxzOGbaxERw6tzIml22WJjBb0QN0x5uUL6a441S9o=;
        b=EkqiNYJBLhzlpa52Om2pINTHasZ2dPR5/cOhpKjz31yCyvauGvx8GVT0RH/DdVZUGJ
         TSqdLI0WFQyBqhVlSZH+fgY39JtpIS06FtROTVV7QXnL4rbqELKJf/EtEEC/W3Sh0A/u
         d3r01BngfsWtA4yVbsuIoV708kWUj83N6RpytENJpUwhsl/a4B19gsIKO7QtKkHOIyI/
         pntbNJ769WTnpL6FLSFr6pBKf2n+FgEcJ+L9fGensfzIUKELaVnoz7kQzfCrchZOOU1+
         CRX3/K7km/McS94jgsq3Y30bgmWPP2LZLWSX5Dl00coeCvG+3G5xgX3HH1jJnWHIcfvK
         rAGQ==
X-Gm-Message-State: AOAM531JI5oH/oBS17Sgg+XrEjVg6g1sTgKo1MvcXXt1qUv/ILccY/9M
	xQqarkf2tKixFEtoEIgCcFc=
X-Google-Smtp-Source: ABdhPJwq31v9puiy3U7yJRfW4uu/9kvxeCJjAKhpobDzq2HnHmOAwjfQcVgqHLJtvR+qb+o1p6rMnw==
X-Received: by 2002:a1c:2705:: with SMTP id n5mr2720287wmn.176.1631366831145;
        Sat, 11 Sep 2021 06:27:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/18] staging: r8188eu: remove unused ODM_StartWorkItem()
Date: Sat, 11 Sep 2021 15:26:24 +0200
Message-Id: <20210911132635.30369-8-straube.linux@gmail.com>
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

Function ODM_StartWorkItem() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 4 ----
 drivers/staging/r8188eu/include/odm_interface.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index ee1d2cb232a5..2ec73d998f0a 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -94,10 +94,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 }
 
 /*  Work item relative API. FOr MP driver only~! */
-void ODM_StartWorkItem(void *pRtWorkItem)
-{
-}
-
 void ODM_StopWorkItem(void *pRtWorkItem)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 6f65ae519b4f..febdbe7548ba 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -96,8 +96,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
 /*  ODM MISC-workitem relative API. */
-void ODM_StartWorkItem(void *pRtWorkItem);
-
 void ODM_StopWorkItem(void *pRtWorkItem);
 
 void ODM_FreeWorkItem(void *pRtWorkItem);
-- 
2.33.0

