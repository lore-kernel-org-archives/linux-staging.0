Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B110E2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:11 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id q6so22237654edr.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 00:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wl769BdnSt1skLLR67Pc8JYCPc0C5/Mlxx5Ssv8fz88=;
        b=KQnMN/lQAUtrvUFNqVpjEMZe+tbTxrOyjozrUSeXVC0y4YQ5DgT4jRFMMvq798QgoZ
         AWYktPYYfyApR/AKTMBvxggADHLhu8FG2PgYJHSEnjde8sX5x+7dxJBIUKpaUxpSOQ5s
         IWgLSks2+/vyB3Ho9BXX0r6WP1pZFLhiKteqbHWHNm9pL7XqU3m4HKMGLrJNmUqpFNqw
         y9GVJfmVPAWaFtXn5Y0t0SAa85QnO6kzEg97deHGzf491qSadMy0ych4m+RqtmNjujdz
         C2+yyN2bw61uYOoi4MMHgQWKOn08R7TcMl+Ks0TBb9RShz9AvfLIIkisePtgQiL4Y4KI
         wE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wl769BdnSt1skLLR67Pc8JYCPc0C5/Mlxx5Ssv8fz88=;
        b=KSsAWU6kX2rj/kg9lJHmm9g8O8NjmKjdi0Fjen2/xS+kUz5Tr0o18JW+Rl5ATAu8Ip
         7BzVor4xLCT1rhFjtosf7s4AEwbvMCI13b1wbpbOJZGb+mwx8S3gUuvcDFT6BuoDxSmL
         pcyfE/D3V9MTxJi5IXumPNQmB2lp6bOEmNH/4LMJ1pmOpYmMOkqk8Z1lHVVoeNMUdG5c
         tg0a4ZMJBuJKx3Gh3QZzfjVsWWoPKYFU23SwCXmaGA++/pJeHhBc4vOpQdtyIGvRuYMt
         JL4cHOcsF+KmsJTihs1fTkXbjnWMbynngbP4x45WqxDcau72PpJkDTIK/hDu5TAI9O07
         3yqg==
X-Gm-Message-State: AOAM531mKzkNIZ1RLIZ/l9hs5ADxj+ST1ka3LNoLwO0M283D2eX/k8vW
	kL1n6nXhuwsRmCgzrH1BLo0=
X-Google-Smtp-Source: ABdhPJxztVMd9cfMgqwns4fbdR6q4D5eAt4sVTSxHWl6FnnvuyFU/XPh1kmvpNRpDrufPWtvUBj3mA==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr4140318edq.23.1619768710227;
        Fri, 30 Apr 2021 00:45:10 -0700 (PDT)
Received: from agape ([5.171.81.86])
        by smtp.gmail.com with ESMTPSA id b9sm666295edt.2.2021.04.30.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 00:45:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/43] staging: rtl8723bs: remove ODM_InitDebugSetting() function
Date: Fri, 30 Apr 2021 09:43:57 +0200
Message-Id: <8495b9075594003c0909f66175c2b103f438daee.1619768150.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619768150.git.fabioaiuto83@gmail.com>
References: <cover.1619768150.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove ODM_InitDebugSetting() function. It was
intended to initialize removed private debug
system. So remove it.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c       |  2 --
 drivers/staging/rtl8723bs/hal/odm_debug.c | 35 -----------------------
 drivers/staging/rtl8723bs/hal/odm_debug.h |  2 --
 3 files changed, 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index fcd3f97e7df5..45e4038530c0 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -290,8 +290,6 @@ static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
 	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT, pDM_Odm), ODM_BIT(CCK_RPT_FORMAT, pDM_Odm));
 	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH, pDM_Odm), ODM_BIT(BB_RX_PATH, pDM_Odm));
 
-	ODM_InitDebugSetting(pDM_Odm);
-
 	pDM_Odm->TxRate = 0xFF;
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.c b/drivers/staging/rtl8723bs/hal/odm_debug.c
index b35451bcb437..1a2e367bb306 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.c
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.c
@@ -7,38 +7,3 @@
 
 #include "odm_precomp.h"
 
-void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm)
-{
-	pDM_Odm->DebugLevel = ODM_DBG_LOUD;
-
-	pDM_Odm->DebugComponents =
-/* BB Functions */
-/* 		ODM_COMP_DIG					| */
-/* 		ODM_COMP_RA_MASK				| */
-/* 		ODM_COMP_DYNAMIC_TXPWR		| */
-/* 		ODM_COMP_FA_CNT				| */
-/* 		ODM_COMP_RSSI_MONITOR			| */
-/* 		ODM_COMP_CCK_PD				| */
-/* 		ODM_COMP_ANT_DIV				| */
-/* 		ODM_COMP_PWR_SAVE				| */
-/* 		ODM_COMP_PWR_TRAIN			| */
-/* 		ODM_COMP_RATE_ADAPTIVE		| */
-/* 		ODM_COMP_PATH_DIV				| */
-/* 		ODM_COMP_DYNAMIC_PRICCA		| */
-/* 		ODM_COMP_RXHP					| */
-/* 		ODM_COMP_MP					| */
-/* 		ODM_COMP_CFO_TRACKING		| */
-
-/* MAC Functions */
-/* 		ODM_COMP_EDCA_TURBO			| */
-/* 		ODM_COMP_EARLY_MODE			| */
-/* RF Functions */
-/* 		ODM_COMP_TX_PWR_TRACK		| */
-/* 		ODM_COMP_RX_GAIN_TRACK		| */
-/* 		ODM_COMP_CALIBRATION			| */
-/* Common */
-/* 		ODM_COMP_COMMON				| */
-/* 		ODM_COMP_INIT					| */
-/* 		ODM_COMP_PSD					| */
-0;
-}
diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index c7c7865dd7e2..94011343f7e7 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -85,6 +85,4 @@
 #define ODM_COMP_COMMON				BIT30
 #define ODM_COMP_INIT				BIT31
 
-void ODM_InitDebugSetting(struct dm_odm_t *pDM_Odm);
-
 #endif	/*  __ODM_DBG_H__ */
-- 
2.20.1

