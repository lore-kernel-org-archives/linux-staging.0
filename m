Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3350B48AE24
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119851; cv=none; b=MsuwOPQXO22DwBo6Vl7vKABsw2OoCEwKSdWLLcHub6lHZq0Z+8b/YQg1Q6hMKMt+qTbu2q+JqP/lDm+JDz7/jjj1kXbxLmwm/nvdHQnOgFssHJBsH9JKdg0+aE2aG1NLMlWOoZzUuQ7gX+fg2hXRc1n4EIRWETtkRa5efoHoRLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119851; c=relaxed/simple;
	bh=ugc1wl73gyCiFlC8VPNE08duIEs6oNaSxsOBFhWPaAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fep9+HHbMDP8uigL4TeDnl2ZQWt896snWhvl9ACAhReQQCh9LPZYvpCFWx9vz/im1ctHYvyY9wPs+NvdJzM22B/fZ9yYdbER/n76xwyvDvsXkfymIqgAIZ7E1gbRML+GXD8yciElNcK8Ij+cKyKrVlE1fa+wz+k9WUNMFe6CWAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsSc+XiX; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsSc+XiX"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeae771c49so6245183e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119845; x=1784724645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMl0JK2aYeTwB6YV2v47Dym/vUmzgdvhjJIdnzT3agg=;
        b=QsSc+XiXAQ9AZIKwKL5d0JSou5uXmuC7BC/mT6eNkXquq7awFWCgwHUxf2P2CZhIun
         gvaeskHd0bAJLkfC/fnOkcX1XWFyr3Rorv1F2KOM0b4eknbZMVRqZi+UpfWLgEsCN7LR
         ZBErBD97WZHvLTmMdvcCSk5nCjcSS8qy7LueUCqdziKQJItZ8sF/6wfmMOVBdlCxAf9m
         ZylLzP1GPymalvTgJa/JOqMNsFSk8CGuh/SCCJqrBg44iyGeGR2dfd3JKgu34F3fPDxJ
         voFpcyUL/LuB6qrMCpGqIt7D8TK5fyIfz0VHRQp1Any8cI8LbAj4UVOwtopUsqve+Gs3
         M0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119845; x=1784724645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMl0JK2aYeTwB6YV2v47Dym/vUmzgdvhjJIdnzT3agg=;
        b=cs/kSgVt3ORBSrKeWRJpj/bbSk8KH7irtg8ypPxo9uj5pISE6XeImj+KuXQ/7f4IBt
         hjZ8LQWqIrKYeeiWiZEQlguIjPy8bGqMB5uQ00mzfNk3iVQ+q74Yt4gGsiLaESPePO1j
         MUg48KJ02nnTQHVgLiS9ZQmVwjQFdwkhaTVfe6FnZAzZC4MqBjKtAYIxhyK/zlYKVHRn
         mGoZm8P6whKppO78ZqLVRHVwMM5fKMNOptWS3knfWOMwUVUxGOLtO6zTGXpZ0mtxQ3mC
         +sQrNhXyhv9PX6GXu6swmsmm8GeeBJSvWl94YcJSoUKArUNLFpb1JH1o0q8bJY5+bmaK
         Tr5A==
X-Gm-Message-State: AOJu0Yyj/JcRNCQ0sDUPo0Pp/2JkUgpVpbaC0gZ/cz9CQ+cA3vZnubgY
	jJlKCzcmv0natmrJjbmWQd5a4jFo5+PWyxM6cAhsVgbprRKdLE9TYcQS
X-Gm-Gg: AfdE7cmH2yG1Gh+VedyodmtNUQ3IgFxZabVIyUVQoeEDC5ChTQ0buCwL22+vZ2xlyqQ
	erWe2zJ/uE1db/aEsbjSV730wSbV52FKa/R3aBl2cYAvo2tcMa6PPdtJ3lNDxmlmF9bfvKmBUjU
	s388hTtZOZhAtaEWlotfy4n50o4OhG/Pn/CgbSAOyK33T4szc8emGsW9Oz6Z/ZmxF/r6OqsNxk2
	fvzQoatqxdN49UrCaj9q80GbgUbAcbpYNO5IE4Q3sBq2Cic0OdhyD9WkGdy5DxAG2UABXU4Y8sm
	5Z2F+uZ3ZeN+X/zd2G8p7uZuzB5Oih/El8wqtucBf5dbWFP9/+XROfwumCJxUYOKVyJwLSkd0v8
	nLEaVqTJMyP6lEaUov6nyt5FU6OFRIaachhg5KNwcBKtTwNeDRPcLKTn+0Wb58U5YSX6mGSUcHK
	7ZgqTE/ym03vlKDKGnw4GVayxZZZEFO2dMVC9SYMunxlTqivQseaKXKBGm9ZFjOkAlE5/0Gr7Rd
	dA0XjtVzoizeg==
X-Received: by 2002:a05:6512:6819:b0:5b0:15b1:3d5d with SMTP id 2adb3069b0e04-5b15d783560mr562863e87.22.1784119844729;
        Wed, 15 Jul 2026 05:50:44 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:44 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 37/61] staging: rtl8723bs: replace halbtc8723b1ant_SwMechanism with direct call
Date: Wed, 15 Jul 2026 19:48:05 +0700
Message-ID: <20260715124829.90290-38-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant halbtc8723b1ant_SwMechanism() wrapper function
from the Bluetooth coexistence code.

The helper provides no extra logic, serving only to pass the arguments
along with a fixed NORMAL_EXEC state flag to the underlying function
halbtc8723b1ant_LowPenaltyRa(). Removing it simplifies the driver's
coexistence mechanism path and eliminates unnecessary indirection.

Clean up the function definition, remove its prototype from the header
file, and update all call sites to invoke halbtc8723b1ant_LowPenaltyRa
directly.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 0613beaa3..522e4dd4c 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -755,12 +755,6 @@ static void halbtc8723b1ant_LpsRpwm(
 	pCoexDm->preRpwm = pCoexDm->curRpwm;
 }
 
-static void halbtc8723b1ant_SwMechanism(
-	struct btc_coexist *pBtCoexist, bool bLowPenaltyRA
-)
-{
-	halbtc8723b1ant_LowPenaltyRa(pBtCoexist, NORMAL_EXEC, bLowPenaltyRA);
-}
 
 static void halbtc8723b1ant_SetAntPath(
 	struct btc_coexist *pBtCoexist, u8 antPosType, bool bInitHwCfg, bool bWifiOff
@@ -1271,35 +1265,32 @@ static bool halbtc8723b1ant_IsCommonAction(struct btc_coexist *pBtCoexist)
 		!bWifiConnected &&
 		pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		bWifiConnected &&
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		!bWifiConnected &&
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
 
 		bCommon = true;
 	} else if (
 		bWifiConnected &&
 		(pCoexDm->btStatus == BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+
 
 		bCommon = true;
 	} else if (
 		!bWifiConnected &&
 		(pCoexDm->btStatus != BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE)
 	) {
-		/* halbtc8723b1ant_SwMechanism(pBtCoexist, false); */
+
 
 		bCommon = true;
 	} else {
@@ -1975,14 +1966,14 @@ static void halbtc8723b1ant_RunCoexistMechanism(struct btc_coexist *pBtCoexist)
 		else
 			halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, true, 0x8);
 
-		halbtc8723b1ant_SwMechanism(pBtCoexist, true);
+		halbtc8723b1ant_LowPenaltyRa(pBtCoexist, NORMAL_EXEC, true);
 		halbtc8723b1ant_RunSwCoexistMechanism(pBtCoexist);  /* just print debug message */
 	} else {
 		halbtc8723b1ant_LimitedTx(pBtCoexist, NORMAL_EXEC, 0, 0, 0, 0);
 
 		halbtc8723b1ant_LimitedRx(pBtCoexist, NORMAL_EXEC, false, false, 0x5);
 
-		halbtc8723b1ant_SwMechanism(pBtCoexist, false);
+		halbtc8723b1ant_LowPenaltyRa(pBtCoexist, NORMAL_EXEC, false);
 		halbtc8723b1ant_RunSwCoexistMechanism(pBtCoexist); /* just print debug message */
 	}
 
@@ -2019,7 +2010,7 @@ static void halbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist)
 	/*  force to reset coex mechanism */
 
 	/*  sw all off */
-	halbtc8723b1ant_SwMechanism(pBtCoexist, false);
+	halbtc8723b1ant_LowPenaltyRa(pBtCoexist, NORMAL_EXEC, false);
 
 	/* halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8); */
 	halbtc8723b1ant_CoexTableWithType(pBtCoexist, FORCE_EXEC, 0);
-- 
2.55.0

