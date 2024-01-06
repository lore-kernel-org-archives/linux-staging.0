Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72B0E575
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="BdtFCM2Z"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ce2170b716so193324a12.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520579; x=1705125379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVzWH1kTIs3O+aFZdU9/JNQTpKc+IEiawn+wHaJsvIU=;
        b=BdtFCM2ZR0I1wGY/0D2bRaYkJY7sF2/krpnPyd/VxTdCOJ+fuoKAZ4ZmQb973BCk7m
         8kV7bhDCKoze/EueoNr3QHHrxKJisRqvWpP5YzkNDvdHclG1UoW25YArspLpl/0agM0q
         T3wJ9QCsNsSCbBnbXBHSva1EG0cebC9ucnTTxxh4n9+bINMV0ksoGH72a67G/Q8pHFV/
         6SL7OmEP9wu2g6Pcj6Pq0RzTbxRYzcd/g3YyEZhov2SEsfb0o4yYxQxNDQV7wfe/2sv3
         30pcdVyT4qDSgHLmxR3+kUvg+Rpd72S7CXOsqSToi6TBhbztb0ZXKmCXIZsHTRsdxpyC
         0k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520579; x=1705125379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVzWH1kTIs3O+aFZdU9/JNQTpKc+IEiawn+wHaJsvIU=;
        b=C3PDYPtPHnPGfPhnWf36VHZnML0eaWyx2U2SQz9eX+dSVcUtpJfd8IGhBePVIX5so5
         Vr5f9fx9uE4MVKqbc28BthpcCerRvsEzcGw3+Hzjv2fol8gZl4o8jATFIJcmToI1Ve+o
         YXQzRtsCsCad7Y6UnOxC46U/Qz/QeL0x2e6plnaxswbSoCEqiV9qj/Z+4yhvzSJcBXdK
         x3kuzugp703ukApxKxJCYb9VRzu57U1Dt60qo5Hw1VaInMlvXsVe716URLRdFOUlC48b
         KIzjr9QTm85qD9c9wzC6nqGuAqT7xv/Kyc7+ADCgCOoCLl8JYd1jsXfcnbWCRWqEThLD
         tpmQ==
X-Gm-Message-State: AOJu0Yzx3dBSoUtAIh909gzNlQxLC97zK9Gkyss/xTC2Ghws08nvf3mI
	mzTm9G913Orgu8zEYiNVCvjyv+CzxpV07w==
X-Google-Smtp-Source: AGHT+IGCyk5AExPvdo1CxuYOSK/ddtSEBK7+OX4zn6mMDV0yv9ueqB/tE95aHpZ2veaorXuUdGP0qg==
X-Received: by 2002:a05:6a20:811a:b0:196:5861:6242 with SMTP id g26-20020a056a20811a00b0019658616242mr443386pza.125.1704520579291;
        Fri, 05 Jan 2024 21:56:19 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:18 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 13/21] Staging: rtl8192e: Rename variable SlotNum
Date: Fri,  5 Jan 2024 21:55:48 -0800
Message-Id: <20240106055556.430948-14-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable SlotNum to slot_num to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 34e30b03c545..f4e48b4a122d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -922,12 +922,12 @@ static void _rtl92e_update_rxcounts(struct r8192_priv *priv, u32 *TotalRxBcnNum,
 	*TotalRxDataNum = 0;
 
 	slot_index = (priv->rtllib->link_detect_info.slot_index++) %
-			(priv->rtllib->link_detect_info.SlotNum);
+			(priv->rtllib->link_detect_info.slot_num);
 	priv->rtllib->link_detect_info.RxBcnNum[slot_index] =
 			priv->rtllib->link_detect_info.NumRecvBcnInPeriod;
 	priv->rtllib->link_detect_info.RxDataNum[slot_index] =
 			priv->rtllib->link_detect_info.NumRecvDataInPeriod;
-	for (i = 0; i < priv->rtllib->link_detect_info.SlotNum; i++) {
+	for (i = 0; i < priv->rtllib->link_detect_info.slot_num; i++) {
 		*TotalRxBcnNum += priv->rtllib->link_detect_info.RxBcnNum[i];
 		*TotalRxDataNum += priv->rtllib->link_detect_info.RxDataNum[i];
 	}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5cab1aa6455a..26ceb579afeb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1115,7 +1115,7 @@ struct rt_link_detect {
 
 	u32				RxBcnNum[RT_MAX_LD_SLOT_NUM];
 	u32				RxDataNum[RT_MAX_LD_SLOT_NUM];
-	u16				SlotNum;
+	u16				slot_num;
 	u16				slot_index;
 
 	u32				num_tx_ok_in_period;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9a9b8f63218b..d7edfa1dca65 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1072,7 +1072,7 @@ static void rtllib_associate_complete_wq(void *data)
 			    ieee->ht_info->enable_ht);
 		memset(ieee->dot11ht_oper_rate_set, 0, 16);
 	}
-	ieee->link_detect_info.SlotNum = 2 * (1 +
+	ieee->link_detect_info.slot_num = 2 * (1 +
 				       ieee->current_network.beacon_interval /
 				       500);
 	if (ieee->link_detect_info.NumRecvBcnInPeriod == 0 ||
@@ -2073,7 +2073,7 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 		ieee->seq_ctrl[i] = 0;
 
 	ieee->link_detect_info.slot_index = 0;
-	ieee->link_detect_info.SlotNum = 2;
+	ieee->link_detect_info.slot_num = 2;
 	ieee->link_detect_info.NumRecvBcnInPeriod = 0;
 	ieee->link_detect_info.NumRecvDataInPeriod = 0;
 	ieee->link_detect_info.num_tx_ok_in_period = 0;
-- 
2.39.2

