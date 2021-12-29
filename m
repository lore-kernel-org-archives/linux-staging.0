Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF4C2CA4
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:35 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d9so46677846wrb.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVOyTdq/5dHYhqv/1i6ZsUz7g+g+c+tsXa1zpjG5d2M=;
        b=pG/SaO2m4P+jMZTnL5DxxiO7glcchCgRY6YHfgHidfeYsuHMzeOYbYpN39mX1jCDXS
         7oJwQVT0d5I24OP6XXaojd7z5YNZOC5P6+QynUOZiVZV12iYdzsK0Vw8BqKEpGY5pLmw
         ldYpZslyw0GK6lKSZz274ivFxTZOmu26rVJS7f+sD/rOwOUpsO4a2cKn6FutwIjixnpv
         Ug6zm4sUiP1AxEUaFTkG3ViA2dsSVmKYYzlt9WSZjaqIn721F/IMVdXkEktrkYEAMOb8
         v7DxeYX9b86yxgg5lkC3Q9n+SFkWFnxXD5K6r/Sfbi5qbk8rAazzjIkuxz+MeFbb1NGt
         HcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVOyTdq/5dHYhqv/1i6ZsUz7g+g+c+tsXa1zpjG5d2M=;
        b=IO5YDu74LZUe4edavSfhroFTE8p85RoqN6ltP95mVz4eGIQyD6R4Wplm1sm3Bmammc
         yqLVa/yGkdo34uUvBcJVrHd42ZnRE5yfPvvoA5pxqgKru/ffsLFm40zLQKBmjivbgJMJ
         408dSZf4wVaKIsiHasP41SU8KRReiW4um2DHPv7eWCKNGWBddldRPPMv4TjkxFYZjYuy
         cfdrMy2X09QX8ctvzYlWbP1fpfIOB38s9zDiUhbq8r83ufS4QKIBVZ33GM52AQV0k3mN
         SPY6r2TpAE17oZ7iDTlQvDApgVXF27gERI8sm0Mm0TlluOFcQ5RWWsnd7967NziFbMx1
         Fufw==
X-Gm-Message-State: AOAM532FHXw0vybLt2DARwiOR5EWRLiXaM4CjD+k3MNdga0/d/Qcd9v8
	qeIUIX1utkL8TNhRteZdih8=
X-Google-Smtp-Source: ABdhPJwNdv9BCnMGV162yKJE8osChh8oCjvW4YA3On6EXThSBYkpwvwFS5BTJVluzEMewwCt8E5lrg==
X-Received: by 2002:adf:fac9:: with SMTP id a9mr14673260wrs.172.1640811094345;
        Wed, 29 Dec 2021 12:51:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:34 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/32] staging: r8188eu: remove ODM_CompareMemory()
Date: Wed, 29 Dec 2021 21:50:47 +0100
Message-Id: <20211229205108.26373-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ODM_CompareMemory() is just a wrapper around memcmp().
Remove ODM_CompareMemory() and call memcmp() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c    | 4 ++--
 drivers/staging/r8188eu/hal/odm_interface.c     | 5 -----
 drivers/staging/r8188eu/include/odm_interface.h | 4 ----
 3 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
index 5db8ea92046e..04e24beb0488 100644
--- a/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
+++ b/drivers/staging/r8188eu/hal/HalPhyRf_8188e.c
@@ -171,13 +171,13 @@ odm_TXPowerTrackingCallback_ThermalMeter_8188E(
 
 		for (i = 0; i < CCK_TABLE_SIZE; i++) {
 			if (dm_odm->RFCalibrateInfo.bCCKinCH14) {
-				if (ODM_CompareMemory(dm_odm, (void *)&TempCCk, (void *)&CCKSwingTable_Ch14[i][2], 4) == 0) {
+				if (memcmp((void *)&TempCCk, (void *)&CCKSwingTable_Ch14[i][2], 4)) {
 					CCK_index_old = (u8)i;
 					dm_odm->BbSwingIdxCckBase = (u8)i;
 					break;
 				}
 			} else {
-				if (ODM_CompareMemory(dm_odm, (void *)&TempCCk, (void *)&CCKSwingTable_Ch1_Ch13[i][2], 4) == 0) {
+				if (memcmp((void *)&TempCCk, (void *)&CCKSwingTable_Ch1_Ch13[i][2], 4)) {
 					CCK_index_old = (u8)i;
 					dm_odm->BbSwingIdxCckBase = (u8)i;
 					break;
diff --git a/drivers/staging/r8188eu/hal/odm_interface.c b/drivers/staging/r8188eu/hal/odm_interface.c
index 03a149069126..a70fda30a24f 100644
--- a/drivers/staging/r8188eu/hal/odm_interface.c
+++ b/drivers/staging/r8188eu/hal/odm_interface.c
@@ -4,8 +4,3 @@
 #include "../include/odm_precomp.h"
 /*  ODM IO Relative API. */
 
-/*  ODM Memory relative API. */
-s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2, u32 length)
-{
-	return !memcmp(pBuf1, pBuf2, length);
-}
diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index d5a75dfe0f8e..ef96d577cfa5 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -12,8 +12,4 @@ typedef void (*RT_WORKITEM_CALL_BACK)(void *pContext);
 
 /*  =========== EXtern Function Prototype */
 
-/*  Memory Relative Function. */
-s32 ODM_CompareMemory(struct odm_dm_struct *pDM_Odm, void *pBuf1, void *pBuf2,
-		      u32 length);
-
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.34.1

