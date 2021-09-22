Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F893FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:51 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d6so10290750wrc.11
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SWZAcSHy+xz+mt5JppKK8Jvgmvso+0sUnm/KmWuezFU=;
        b=o8MOvjOYq5hTAl9P1nl04KIiIz2VjorGmAOHWj7mN5mlPWwn/x8TBcNNfE1Ral2q2V
         UdKKa5N0w6wXT6mbnrD7ggcaVr8YUE1Z3gvzrGtRjXbstdGB1/9QlgOMQRIL6PpnxzcX
         22gycuzQQWWpn5Hh2kp+IG43As+em8ou5/oVrfEaWQXduX8bj9fItPeleHQ6JywPsE/w
         4V1ky4AXMXIuK58OMmkM3JKW9+OyUK+wEhy+wJMPgsqrt1m60RCk9aKI+7rLdtdCxV1T
         sE0e9cKDgBu8DKfl1De//Ba0y+S69M3+yidTchoLCdR94RBLhveX5R8SeSZbp4a+pEGa
         f+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SWZAcSHy+xz+mt5JppKK8Jvgmvso+0sUnm/KmWuezFU=;
        b=ICtPRuvbsLCTueBpShyOMUo6qiLOeECP6KuS5LGDKi582tRZQ6Z+Ffp58+Jqs3kWGc
         YrCZaevKcw5U0ydgJR326aC0uPByLtUtFx8YZBezOLu1416qySPbnaXOENRYBfOK2uRJ
         zYbA8JxRVfu1EwLZBjPHSm4EEZhsGRRBR1dXmYXjfaR32ZnCuHTLXJFiVeGuG/eqMP1q
         9B4FGRgM6Xb1OnibqlgsbQ6HpUKkrOsllxZ2BHV/vv2CUFnj5yk+tzC0yr8gm0hSet58
         I5tEmNT4WORuGnSSksFSiBFWL3OesLDVTnOnlDtq6nZmrb/l80es+2l2DzhIoZgX3pXp
         KOTw==
X-Gm-Message-State: AOAM532Vu3eVXQ+aooDRgSUmuGPn81sZ273S6yLUS6jh1ys7S7nvreag
	D6+PCA9sUgaGkk7Wicg+fk4=
X-Google-Smtp-Source: ABdhPJzrSMFKDHyleskDdGW2HvpaM0N2Sy/ojwTb6cruLBTQoznrkaFmegLx71Meb3mFQ5+4tmK0UQ==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr873721wrw.327.1632341149821;
        Wed, 22 Sep 2021 13:05:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 26/47] staging: r8188eu: remove rtw_cbuf_push()
Date: Wed, 22 Sep 2021 22:03:59 +0200
Message-Id: <20210922200420.9693-27-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_cbuf_push() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/osdep_service.h   |  1 -
 .../staging/r8188eu/os_dep/osdep_service.c    | 21 -------------------
 2 files changed, 22 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index b9b87f2317a1..59747822148e 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -294,7 +294,6 @@ struct rtw_cbuf {
 
 bool rtw_cbuf_full(struct rtw_cbuf *cbuf);
 bool rtw_cbuf_empty(struct rtw_cbuf *cbuf);
-bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 int wifirate2_ratetbl_inx(unsigned char rate);
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 489a7d33b212..8b0c8429e836 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -245,27 +245,6 @@ inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
 	return (cbuf->write == cbuf->read) ? true : false;
 }
 
-/**
- * rtw_cbuf_push - push a pointer into cbuf
- * @cbuf: pointer of struct rtw_cbuf
- * @buf: pointer to push in
- *
- * Lock free operation, be careful of the use scheme
- * Returns: true push success
- */
-bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
-{
-	if (rtw_cbuf_full(cbuf))
-		return _FAIL;
-
-	if (0)
-		DBG_88E("%s on %u\n", __func__, cbuf->write);
-	cbuf->bufs[cbuf->write] = buf;
-	cbuf->write = (cbuf->write + 1) % cbuf->size;
-
-	return _SUCCESS;
-}
-
 /**
  * rtw_cbuf_pop - pop a pointer from cbuf
  * @cbuf: pointer of struct rtw_cbuf
-- 
2.33.0

