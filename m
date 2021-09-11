Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BCA3FD2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 13:27:08 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m2so3143623wmm.0
        for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 06:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oj7vQGxgyu7rJkvqI51taxiHsAhwORuTJgNLc1WmslU=;
        b=ZEg13UNkd02SJOXUvwf4/AmEOTQ+WsUDP7GVt/N066AwWW7yxK/nIFhrd8DmX4baxc
         SxGFarz691D6lroJnhpRh/2DMJ1OOIAISh+x+fmsQiYrZWwxxu/79PKpIQZ3t5QansHh
         XlE0QZSRoZtK2CrgynflWvW9EB4n0/ntDbXKlOOrYfSJ0LLP0JVE/nQGaxd/lk2zTBvE
         61cmtPkHBcogYDLRq3K0lpIulcWRvkUP/XbSJwqq8AuaEiw7M/ISQG0SE2UTZBJDZUII
         PvY8D/yF/GWX2ge+3c5tQpvehZpGu4YhLH6vzyp1mzBgy17mFqcCcyfuAuOkiPyFiVR/
         1lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oj7vQGxgyu7rJkvqI51taxiHsAhwORuTJgNLc1WmslU=;
        b=eHwIptYhMv1JmwfyUWCmuzRB57wfhybd2TDlQs5jip/F4QPIuMW83t5/46YhHBv9br
         7X16kbBsZuEJj9KuCh+HnBBLY0iJh0CQoTjCbFWEODBTmiO21Wr+61dPnBY4U2VkisWO
         wWx8fdRotU4a4NCh53lv8xFQKk+O2musT6lEfh18z+SVB0/h2IDk0SK8zxoicGNB/B3C
         mP2Kqmbo+knrHK4h+2415xPAFQPwDtR+1+xOuEXl0LgJdTNHKaUpIEmSjkmqGN9DpXf9
         PHq2MTJsiiMm1l/2grR6hC79a+HFUK/NArvlJf7DARDtU1BbIbtYDs0B/PKi1lH5/FHZ
         n5Dw==
X-Gm-Message-State: AOAM533mqf0cHJX7oNsgP4IbaOgK/AbAuzEKKSMZNvuTEkozlNX1dlkg
	i0oVgWv2L0UPv9ZS0FHYZSM=
X-Google-Smtp-Source: ABdhPJxgKwg/qDJLKcUXMBkvZhJ99sE2AOeXDOJNfghyagKkmCpNxtnx0sr/5eA3Nw2qAZ3Lr/idqg==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr2663458wmb.112.1631366826800;
        Sat, 11 Sep 2021 06:27:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id 48sm1770253wrc.14.2021.09.11.06.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 06:27:06 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/18] staging: r8188eu: remove unused ODM_AcquireSpinLock()
Date: Sat, 11 Sep 2021 15:26:19 +0200
Message-Id: <20210911132635.30369-3-straube.linux@gmail.com>
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

Function ODM_AcquireSpinLock() is unused and empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_interface.c     | 4 ----
 drivers/staging/r8188eu/include/odm_interface.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index c33ef4736ff6..ab9100d4b1e1 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -94,10 +94,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u
 }
 
 /*  ODM MISC relative API. */
-void ODM_AcquireSpinLock(struct odm_dm_struct *pDM_Odm, enum RT_SPINLOCK_TYPE type)
-{
-}
-
 void ODM_ReleaseSpinLock(struct odm_dm_struct *pDM_Odm, enum RT_SPINLOCK_TYPE type)
 {
 }
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 9109d72915cd..7eccf459b636 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -96,9 +96,6 @@ s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
 		      u32 length);
 
 /*  ODM MISC-spin lock relative API. */
-void ODM_AcquireSpinLock(struct odm_dm_struct *pDM_Odm,
-			 enum RT_SPINLOCK_TYPE type);
-
 void ODM_ReleaseSpinLock(struct odm_dm_struct *pDM_Odm,
 			 enum RT_SPINLOCK_TYPE type);
 
-- 
2.33.0

