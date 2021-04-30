Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A0B2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:43 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id y26so3354972eds.4
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=auqmHaougiorEJiold25Fwbfcoe9phFoSmF9xCEzReU=;
        b=kILlZF3JkAYiT8+cq3igucLG8UBqezgW0iQ+w/CglQ6kufyaFYg/7MTbwgQ4wkoBxu
         DsiDuFTIhGFrgXXqLgXvI6BLU42HCfuw9jHhKwcjiVUNQZ7BntolIQlgZ0hLF9vrCrZn
         bUNZKxTvZ6FhK/+kK36uywVkjMHubD5Toh1pkORubegvWP0lCqAmxej868xhKh/HzYQm
         9PqY3CNen1obThxXPuYf4KTcHfBCbqR0cozG3vKrQ8gNcHsl6EQgByNfXlm+h9ZgRBm7
         mm1eYeZLor+gPhbmZ7OV/mYVljhtgtGXj1V22remNWUddJLrGjyd8i5nF3Y84/EW88Vj
         3zZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=auqmHaougiorEJiold25Fwbfcoe9phFoSmF9xCEzReU=;
        b=j0sAujta0AFQ+r4uzf3j3x9oExBLwkwm9dN7ri4hxgmillpsRSFLWGpvoi8JBTJaM1
         YTyasb8p/9rfiNNLGJ96PaFtAGUr1yNCRKLrXl+uZbhXoHrEXNFGmzUAoIDL0Gkv5rpn
         ZArFyciM0Dx1rYufxUKGI75d51RbTQIbrZd0XxnENgUy7e3Yg5XWjsSb3kpgQwW2zsIl
         5Y0aockrn7dZopZeXyLUlhUQdOziruvhynO8+JxYqflsfslzhQo6JjDPqFuXpi4J9qWR
         RKSNea6eyTPOxIJq368TK6trmi3bs7KHV428gX+4BV1XZWGkCc8pDPPfzXF/nVf6PL0t
         Rr1A==
X-Gm-Message-State: AOAM5323JD1hH6GyZHizULk739Y71TpGts840EdmNW9NlnO7dejb4b7D
	NaqUIJaD+TN7NePhHALhe6XAh9dtaho=
X-Google-Smtp-Source: ABdhPJzrDtf/JQNPJBuqvNfv+lJSHEkWIcd5nTRNWcHYckZZu81D04+oEr1Vf3/KUOoxECcNJs19Ng==
X-Received: by 2002:a05:6402:1cc1:: with SMTP id ds1mr6272454edb.135.1619794661855;
        Fri, 30 Apr 2021 07:57:41 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id h15sm2058466ejs.72.2021.04.30.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/43] staging: rtl8723bs: remove empty if-else blocks after BTC_PRINT removal
Date: Fri, 30 Apr 2021 16:56:43 +0200
Message-Id: <102455368fa9535dc78584d7d24cd12ee4160737.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove if-else blocks left empty after BTC_PRINT removal.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 16 +---------------
 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c | 12 +-----------
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 28f41a637c96..57579d7eab71 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -606,8 +606,7 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (bBtHsOn) {
-				} else {
+				if (!bBtHsOn) {
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
 				}
 			}
@@ -1063,10 +1062,6 @@ static void halbtc8723b1ant_PsTdma(
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_WIFI_BUSY, &bWifiBusy);
 
-	if (pCoexDm->bCurPsTdmaOn) {
-	} else {
-	}
-
 	if (!bForceExec) {
 		if (
 			(pCoexDm->bPrePsTdmaOn == pCoexDm->bCurPsTdmaOn) &&
@@ -1373,10 +1368,6 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 
 		bCommon = true;
 	} else {
-		if (bWifiBusy) {
-		} else {
-		}
-
 		bCommon = false;
 	}
 
@@ -1528,7 +1519,6 @@ static void halbtc8723b1ant_TdmaDurationAdjustForAcl(
 				halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, 1);
 				pCoexDm->psTdmaDuAdjType = 1;
 			}
-		} else {	  /* no change */
 		}
 
 		if (
@@ -3012,10 +3002,6 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		pCoexSta->btInfoC2h[rspSource][i] = tmpBuf[i];
 		if (i == 1)
 			btInfo = tmpBuf[i];
-		if (i == length - 1)
-			{}
-		else
-			{}
 	}
 
 	if (BT_INFO_SRC_8723B_1ANT_WIFI_FW != rspSource) {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index 73f1cc6bc27c..15304feb2442 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -1621,8 +1621,7 @@ static void halbtc8723b2ant_TdmaDurationAdjust(
 
 		if (!bScan && !bLink && !bRoam)
 			halbtc8723b2ant_PsTdma(pBtCoexist, NORMAL_EXEC, true, pCoexDm->psTdmaDuAdjType);
-		else {
-		}
+
 	}
 }
 
@@ -2859,10 +2858,6 @@ void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 	u8 wifiCentralChnl;
 	u8 apNum = 0;
 
-	if (BTC_MEDIA_CONNECT == type) {
-	} else {
-	}
-
 	/*  only 2.4G we need to inform bt the chnl mask */
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U1_WIFI_CENTRAL_CHNL, &wifiCentralChnl);
 	if ((BTC_MEDIA_CONNECT == type) && (wifiCentralChnl <= 14)) {
@@ -2889,8 +2884,6 @@ void EXhalbtc8723b2ant_MediaStatusNotify(struct btc_coexist *pBtCoexist, u8 type
 
 void EXhalbtc8723b2ant_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 type)
 {
-	if (type == BTC_PACKET_DHCP) {
-	}
 }
 
 void EXhalbtc8723b2ant_BtInfoNotify(
@@ -2915,9 +2908,6 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		if (i == 1)
 			btInfo = tmpBuf[i];
 
-		if (i == length - 1) {
-		} else {
-		}
 	}
 
 	if (pBtCoexist->bManualControl) {
-- 
2.20.1

