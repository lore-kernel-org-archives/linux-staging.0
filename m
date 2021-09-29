Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9CF72
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 19:27:10 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id l8so13051942edw.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GWWBBMK+dhPCf+tLzn30tL9ZHRbmxU5D+2YHd8HF5y4=;
        b=hOfBsJQHroPbQFFh72JbnBLkEizmFts389lgJJ6yABX0/PL+nhs6bBsUzlcEXUC5iv
         fcvyJmAAoJ2qIFu2E80F2ebt5BUjzEx7SNDxdEx0C4CcmlBMCxK/udzEeBTtDj9fIh5T
         6U7YwSnAjf8j+NedZixN4RSl2Ndfq3flxQnDi4a1sVZrzcDmnWynhjnRg3mUySacuMsv
         nhCpba09+G2EZVR0RgqTUgHeZVKPYfNWlJvRSuGJ9LYX51+3n2/6V5qy4pRxnLoAY4dx
         Gx1mcZ7/9TJaxi+v2yzgVNDyQXmBYgLE0XtZ5rGCc3v2nVKgl99PGG8nXhjJEFRNqAS4
         ovFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GWWBBMK+dhPCf+tLzn30tL9ZHRbmxU5D+2YHd8HF5y4=;
        b=faQ1AygJD9JNKKDRhkKj/PTKgjIM2RW8oqHyI/Gldp+r80JdK1EYjSvIi13eEAaLGB
         qsRDQzwxz9QatNlo4aSmLEQeD8dZd4BCDp57McTwl+qHCqyVnpoNj4vuiiEl5H0VvPZE
         6cDw6HtBhzP2mMl0kV4QlGmJirLty4rCx1GtOieaUuDMDmvCo+EwyVpBoYr5iot4EMql
         dO4vFarMllqoou87qG3gLzCdl45ULiN4do5Kt/Gc9DwnJKAra2OJK2ZssApzQ+op9/vS
         7jINPHU3UnQcLCgxJk9rRTJ6tfEWOZHhkyP4enWRNpPHKUT856vOoeqk6E/KfkepTMvN
         Um2A==
X-Gm-Message-State: AOAM533pupLGERyfE0mO6sNji/xSIcSt0cWYOGjSWcYC/M4iz2Yk+2fT
	9a2iVP7sV+nNtS5i/vZ611E=
X-Google-Smtp-Source: ABdhPJzBxOZo0vcKgGNajKEhqnzprgFV8+WoDiT0mY6zvcIsvIh3psJt1Lna46aZfHRxL3nEOZijLA==
X-Received: by 2002:a05:6402:2889:: with SMTP id eg9mr2128624edb.384.1632943628577;
        Wed, 29 Sep 2021 12:27:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::bfc8])
        by smtp.gmail.com with ESMTPSA id f10sm449019edu.70.2021.09.29.12.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 12:27:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/7] staging: r8188eu: remove free_recv_priv from struct hal_ops
Date: Wed, 29 Sep 2021 21:26:55 +0200
Message-Id: <20210929192657.9569-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929192657.9569-1-straube.linux@gmail.com>
References: <20210929192657.9569-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove free_recv_priv from struct hal_ops and remove its wrapper
rtw_hal_free_recv_priv(). Call rtl8188eu_free_recv_priv() directly
instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 2 +-
 drivers/staging/r8188eu/hal/hal_intf.c     | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c  | 2 --
 drivers/staging/r8188eu/include/hal_intf.h | 4 ----
 4 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 3054cc6459c5..51a13262a226 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -104,7 +104,7 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 
 	vfree(precvpriv->pallocated_frame_buf);
 
-	rtw_hal_free_recv_priv(padapter);
+	rtl8188eu_free_recv_priv(padapter);
 }
 
 struct recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index ad327c495b5d..039723d62ae1 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -72,12 +72,6 @@ u32 rtw_hal_inirp_deinit(struct adapter *adapt)
 	return _FAIL;
 }
 
-void rtw_hal_free_recv_priv(struct adapter *adapt)
-{
-	if (adapt->HalFunc.free_recv_priv)
-		adapt->HalFunc.free_recv_priv(adapt);
-}
-
 void rtw_hal_update_ra_mask(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 {
 	struct mlme_priv *pmlmepriv = &adapt->mlmepriv;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 6465be895574..bdadd801693f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2153,8 +2153,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->inirp_init = &rtl8188eu_inirp_init;
 	halfunc->inirp_deinit = &rtl8188eu_inirp_deinit;
 
-	halfunc->free_recv_priv = &rtl8188eu_free_recv_priv;
-
 	halfunc->SetHwRegHandler = &SetHwReg8188EU;
 	halfunc->GetHwRegHandler = &GetHwReg8188EU;
 }
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index a74250f6d9dd..2f8c62ebf6b7 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -128,8 +128,6 @@ struct hal_ops {
 	u32	(*inirp_init)(struct adapter *padapter);
 	u32	(*inirp_deinit)(struct adapter *padapter);
 
-	void	(*free_recv_priv)(struct adapter *padapter);
-
 	void	(*SetHwRegHandler)(struct adapter *padapter, u8	variable,
 				   u8 *val);
 	void	(*GetHwRegHandler)(struct adapter *padapter, u8	variable,
@@ -185,8 +183,6 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 u32	rtw_hal_inirp_init(struct adapter *padapter);
 u32	rtw_hal_inirp_deinit(struct adapter *padapter);
 
-void	rtw_hal_free_recv_priv(struct adapter *padapter);
-
 void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
-- 
2.33.0

