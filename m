Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8C33E0;
	Wed,  6 Apr 2022 15:49:27 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q19so3876096wrc.6;
        Wed, 06 Apr 2022 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pJRePmaoHF8y9FcZ88YD095N9pjI+K9p1C7d1voMNQA=;
        b=UFnMBRRFAUq1tdwAQKRJaM+eU87Z4OIegSIOZnkvB4DjllOHIR5VnrGYdqcX+pR1ZK
         dp3gLQR390O9+4ea1Ze/CqHSjkSnroqWL1B+k4eAapO/p9o82Elcy0deHnBT+Xh53pYG
         4RZ0yRGwAhCiii5qMrpf1hy9zws2ct/H5Z8XIGx5C5DrH+9PTeA0lFG9ji8CQjbjKdBx
         vJDc6d9MsfKeyq8ZNUkrWgk54MEkKLMEnIG/2UI1q87zK8jKM7ilkAvAioRTqaNTMaG2
         Vvc2QDm94TLnmOfxnQGOn6m6LPY2qsKnLxAnrZD/kMHD530f0qwwR54v7HvBDePEQRVn
         xcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pJRePmaoHF8y9FcZ88YD095N9pjI+K9p1C7d1voMNQA=;
        b=srgxMuTjDEErhezobFGsYcmGB6yOfSoA6oA5l0AXwOl7VCUMBAVUT6VQOPs5kQabeK
         HnQxL8vd1HZKn4slMzKCDyvG+H9gKVh8zj6GsdoINRnWgZyp5sMMaMIAKo9TsioowlK0
         W1uzl1sZeeqVcII4RNQ+Q1GWgWXQQkD2PDgAccWXKYx5MivfhhxiXY9inn9u2dkm8pvK
         g7UAvDGuKhVSnqZd//M1/pq42J62/H9gHpVjswAWoo5acBUBK13EITHe2kdVWIEez0wy
         P78f1eI99cDErUSaz/pY93cxXp96pUqtJRqsU4t0RYWTIg2ZVOwVlk1UYmSY7XnzM1yH
         ZVpg==
X-Gm-Message-State: AOAM532BLyR1Ax7xbl8A5nEjbi80cy3fGIBsM4CSpkEVisIFpyXrw37d
	r7FfE/Xffr5lWgx21HIvhiE=
X-Google-Smtp-Source: ABdhPJzQm9bjq8yLnVVnEajucrpLRFaujEv+Fn79oRJYooXadcAXYaqU3o9yLXxhp4haoMeNnzBtsg==
X-Received: by 2002:adf:ce06:0:b0:206:fd5:6644 with SMTP id p6-20020adfce06000000b002060fd56644mr7434505wrn.624.1649260165196;
        Wed, 06 Apr 2022 08:49:25 -0700 (PDT)
Received: from alaa-emad ([197.57.159.73])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm7577725wmq.23.2022.04.06.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 08:49:24 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] staging: rtl8192e: remove multiple blank lines
Date: Wed,  6 Apr 2022 17:49:21 +0200
Message-Id: <20220406154921.15532-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:

CHECK: Please don't use multiple blank lines

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 97afea4c3511..b0b1c839e770 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -343,7 +343,6 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		goto OnADDBARsp_Reject;
 	}
 
-
 	if (!GetTs(ieee, (struct ts_common_info **)(&pTS), dst,
 		   (u8)(pBaParamSet->field.tid), TX_DIR, false)) {
 		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
@@ -355,7 +354,6 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 	pPendingBA = &pTS->TxPendingBARecord;
 	pAdmittedBA = &pTS->TxAdmittedBARecord;
 
-
 	if (pAdmittedBA->b_valid) {
 		netdev_dbg(ieee->dev, "%s(): ADDBA response already admitted\n",
 			   __func__);
@@ -374,7 +372,6 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		DeActivateBAEntry(ieee, pPendingBA);
 	}
 
-
 	if (*pStatusCode == ADDBA_STATUS_SUCCESS) {
 		if (pBaParamSet->field.ba_policy == BA_POLICY_DELAYED) {
 			pTS->bAddBaReqDelayed = true;
-- 
2.35.1

