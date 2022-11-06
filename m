Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431C7F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 13:18:17 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l6so8317646pjj.0
        for <linux-staging@lists.linux.dev>; Sun, 06 Nov 2022 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wIjgNU88aVc2+sFYCEelT5KhuJ8SvI5h9ckpOpuCAw=;
        b=cLWYtVzcHUtnpfMsI2JPuan2DjSbptj21Zx5CkyiQCczT8+hkJ+LsIrHLdIoiphGvl
         WGVF/69phwq3w7xsDDnZkaE9RFgBsa4gdXsoVL7VwrA+aDOXRaca22oozlnDYJCS5FCD
         GCM2IZOF2XbB65knjTDgyAD25a7hxx7aajJiAvduVJyVitxJYEjE/TKJk1MNB7scsHk4
         LZP41KG5Z7mEefbzZPh3vJDvnabxbrb6jIopUQkrxDy1vFfd45O1s0rs8rnBFg+jFQsy
         N2RIKkuIEkdEaQoVkSms3R+fh/kBb2XWMkZaq7kFpGxATdV+FSG92TUJffime1JSjO88
         m98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wIjgNU88aVc2+sFYCEelT5KhuJ8SvI5h9ckpOpuCAw=;
        b=WD8blo7hM4S05ahwNtLkmppoZRGDkZ6v7A2q7EbeBNbPS3dQPwvt0wYhKXl/Ze/WTM
         IQcEtx1DGj9GlLE+9kSqENRdAx3/Pg03/gu0BVt/ygGrqSnaDyQICr/NlAKBSGQo8cGX
         CWpLZgMMV01lSv342jooyvGJ8Qq6H3u/3c/OR9KUHZxNlYLWKaWHubTRVnEvpjEiBR4O
         rHd1EZiK2877mV5HJeRUzFVcHaX5n3HC6iquwf8rl0fufQgFZKJI6JKT6JXUdAjAFD1N
         Dmi+AzyrYzp+RpX5DWTh9eCtoabCJkRMaeMZK5CvR/69TxePM0YshxlzG+FCvT19e6aD
         rrZw==
X-Gm-Message-State: ACrzQf2JXU6lh7axwm/LBEef14DhLEAPJNG9uKLwJuB/vmx+ldJ9tMK0
	S+Wkf6+O9qSN2xCL1GjwaiU=
X-Google-Smtp-Source: AMsMyM5SZU8IK6OonUxj9BXiRHmLPbjt9Sv7BYUURuiD9z3/Q8ZHBDilsoqvmk8+aCHNrqXx4tE9kw==
X-Received: by 2002:a17:90a:590a:b0:20a:e93e:2022 with SMTP id k10-20020a17090a590a00b0020ae93e2022mr45021261pji.141.1667740696609;
        Sun, 06 Nov 2022 05:18:16 -0800 (PST)
Received: from zephyrus ([103.251.210.204])
        by smtp.gmail.com with ESMTPSA id i4-20020a63cd04000000b0045751ef6423sm2537049pgg.87.2022.11.06.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 05:18:16 -0800 (PST)
Date: Sun, 6 Nov 2022 18:48:11 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com, dragan.m.cvetic@gmail.com,
	wjsota@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Rename variables TM_Trigger and
 TxPowerCheckCnt to avoid CamelCase
Message-ID: <20221106131811.GA50668@zephyrus>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables
* TM_trigger to tm_trigger
* TxPowerCheckCnt to txpower_check_count
to avoid CamelCase which is not accepted by checkpatch.pl .

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 767c746fc73d..0652940eecc5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -919,32 +919,32 @@ static void _rtl92e_dm_check_tx_power_tracking_tssi(struct net_device *dev)
 static void _rtl92e_dm_check_tx_power_tracking_thermal(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	static u8	TM_Trigger;
-	u8		TxPowerCheckCnt = 0;
+	static u8 tm_trigger;
+	u8 txpower_check_count = 0;
 
 	if (IS_HARDWARE_TYPE_8192SE(dev))
-		TxPowerCheckCnt = 5;
+		txpower_check_count = 5;
 	else
-		TxPowerCheckCnt = 2;
+		txpower_check_count = 2;
 	if (!priv->btxpower_tracking)
 		return;
 
-	if (priv->txpower_count  <= TxPowerCheckCnt) {
+	if (priv->txpower_count  <= txpower_check_count) {
 		priv->txpower_count++;
 		return;
 	}
 
-	if (!TM_Trigger) {
+	if (!tm_trigger) {
 		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4d);
 		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4f);
 		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4d);
 		rtl92e_set_rf_reg(dev, RF90_PATH_A, 0x02, bMask12Bits, 0x4f);
-		TM_Trigger = 1;
+		tm_trigger = 1;
 		return;
 	}
 	netdev_info(dev, "===============>Schedule TxPowerTrackingWorkItem\n");
 	schedule_delayed_work(&priv->txpower_tracking_wq, 0);
-	TM_Trigger = 0;
+	tm_trigger = 0;
 
 }
 
-- 
2.25.1

