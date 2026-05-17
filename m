Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7F01F418F
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 04:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778993016; cv=none; b=ZjS4nK3gUzyFPSuCd37Ml3cm4C35CY4Ep1p5zJ5Gaqj53OGYN5ll+zEkhUWmCA0MbTFlkiM41Gapmare70QSXZINzmDAm8x5gm2YJ9Ezd+Mlv/2yyvoTHTPc/lOS1+BaG43Pzlwivcb6CNGgPVk+hEvB8KlqtoyXIf4iZpVtxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778993016; c=relaxed/simple;
	bh=Kx9TYbQ6PRrVJTx4hgZG+fNh3y2yqxTZI3R3CDcwJ8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eEI5LO9B1cukhVtOAdA+hbs0LjqZkzib2MBQ6Li3kkVm/7rsPxn3XqcKMSU+/COVCQMD9yxxZLXxbxVVBOsZBiKSj5FwCS4oJtnthd2AkGhaOFcactir+ofzRABFkhbmIhkyClkZpXgpFj4toHCbZy5wdrpRa2o/yuvwDf+lVUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeWasqAu; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeWasqAu"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1382360eec.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 21:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778993015; x=1779597815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/u1TcQ6jYwEX1DfUWm7Q8riWY7IYuJNetUr05N5veo=;
        b=aeWasqAuxyFfAMNAWpjekIFzm8tTcvBm5hNPvviEjZcmE3eKpD2OAEJj0LHMQUXjMY
         qOvIHILcjXNUWvghacYRaUhqVKgw8tBRT0paPenWK9pP4dzjvCWoPGSrNUgxsxR6Nmuy
         JbC8MuleLgDVo6gn5k87RbSB+3KoiKBww4IkPGSx3lHBwohLn/NXHGTY5mCEtWyS44Og
         G89Y2hUQSd7Q934A3zrmqascctigOkT+mQIwSo3sK6lAtFXnfM2DvJtdbp4c0WISuExK
         y0uDrVCastAqHXKpP2/7ML6dz0xyIHasvq0cYE2k6dnKKg4z+/diuam0wCHDMaurtna5
         wdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778993015; x=1779597815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/u1TcQ6jYwEX1DfUWm7Q8riWY7IYuJNetUr05N5veo=;
        b=V98yd0TEo0gD+QZMg5lElb5/4jW8wAfIoT1VsaiaxN75rbxrwL6dHYzft4JtpdGfbs
         l86H7RsRBtinn/df05+o3DQ4LAU/WkbYtHU/ORpHPuDix/Ud8TGjvx0ndkBA+NpMTG78
         di58C7+vhcKCeN/rg/TGbrPx0IzMToE1s1r/+dizLjcMsgq8+VXL8iO7NClurWWtjjVC
         DdZ466k8jv+iCedlyj0jSbXgWKXpR5X9eZRNFHu7qtjoOU3VXW/vWhVBToRWg2WT4Wd0
         zh3ka/kHBuVF1rnpcHjp7yAWVZKksqSRrFzzyE10LeU+mDV0NNeG4x6sN6lkjdWLgBzF
         q35A==
X-Gm-Message-State: AOJu0Yx1Nch+vYd9XxadknXOSY+J03Zi9d4t66QWo6OuwME+9fZsfjX+
	IGQ819ibqKvEMA9y+jzRccvN7JIwPA7l1YIHirPRx87vFledRyZxwnqO41pt4w==
X-Gm-Gg: Acq92OE/dFPPLWWxyWWKdPDu2ZV2iSPrgtq8VktOTMoZycZGWMW5UaG6t1xHn2J+GjS
	MrEnBfbwcdZJCap+yp58mkFO1OkytXhZn4vd740GUPL1U8W4QPm8lmQWOFqPjp3d/Qu64aN3V/V
	kU2eg6iZ1sndhVzNJpJsDNovFZ7jQvylDfxrnlop6cfiWz2orJwCiJxAK98YNE1OCjg+jGpzFaz
	vN8cl1+sl3J6e2l3GamrUYPHRRdwFHrpl6VrnCcdVfTIoE8E67HEqDKvJzoyLa1VzxjJZDJ5Q46
	ra6lH9zW8tbvnzpLPYydqpqTxesfSmIBpQnaKws/+m1UqUZxuG1QKSAhZeVRot1sO2pneTl1Fob
	SQFsJWSXn0xRfnwpyl0m8l4M+4y6eIRXFrD8fmM0TTLy7Nx76t9jJQO9GQYIiM8gc8q4p8EzRbm
	ZwXBXyLgmKubFNJgUCaHU86jATWz2LjDO7xExba7LtLMM=
X-Received: by 2002:a05:7300:641b:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-30398652478mr4736368eec.26.1778993014589;
        Sat, 16 May 2026 21:43:34 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30294500a97sm12701644eec.9.2026.05.16.21.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 21:43:34 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: delete superfluous switch statement
Date: Sat, 16 May 2026 21:43:30 -0700
Message-Id: <20260517044330.8517-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This switch statement doesn't do anything in all of its branches. As
such we can clean it up, and only keep the assignment in the else block.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   | 34 -------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index f855df776a07..3ee88afe7403 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1918,40 +1918,6 @@ static void halbtc8723b1ant_RunSwCoexistMechanism(struct btc_coexist *pBtCoexist
 	if (halbtc8723b1ant_IsCommonAction(pBtCoexist)) {
 
 	} else {
-		switch (pCoexDm->curAlgorithm) {
-		case BT_8723B_1ANT_COEX_ALGO_SCO:
-			/* halbtc8723b1ant_ActionSco(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_HID:
-			/* halbtc8723b1ant_ActionHid(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_A2DP:
-			/* halbtc8723b1ant_ActionA2dp(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_A2DP_PANHS:
-			/* halbtc8723b1ant_ActionA2dpPanHs(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_PANEDR:
-			/* halbtc8723b1ant_ActionPanEdr(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_PANHS:
-			/* halbtc8723b1ant_ActionPanHs(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_PANEDR_A2DP:
-			/* halbtc8723b1ant_ActionPanEdrA2dp(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_PANEDR_HID:
-			/* halbtc8723b1ant_ActionPanEdrHid(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_HID_A2DP_PANEDR:
-			/* halbtc8723b1ant_ActionHidA2dpPanEdr(pBtCoexist); */
-			break;
-		case BT_8723B_1ANT_COEX_ALGO_HID_A2DP:
-			/* halbtc8723b1ant_ActionHidA2dp(pBtCoexist); */
-			break;
-		default:
-			break;
-		}
 		pCoexDm->preAlgorithm = pCoexDm->curAlgorithm;
 	}
 }
-- 
2.34.1

