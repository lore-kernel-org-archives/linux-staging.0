Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C6A71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id a11so23599275wrt.13
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bE0/IBysZYE/ZXL1p5rQU1Kbefc1vevyehuv3S/iCqk=;
        b=oo9lKeSUVhzeBIPGsND2eC8dOSh830K09wN2TXSzxjvAxJjpOzbKOvnDnRhXd+h5Gq
         +5Sv2KlehOIHRbaUPc9AE0bdXtUt04KEV5F1JINzsnM79Wk2ijuKh80vBGB0m0m2y6Oo
         JGAKpG4cj6EWXbn+pfmvZre0xIzck2c7DHRmVSGX4V5Ql5NlxJDlyuDp3e1xOU/nEjMm
         9fMGMKVMk8mPrU2pK55z/c2Hy9p1Gt38H0qIuR1IAzgk7y1PRQ7r3j1ai6YihsR2Owh5
         /Gq0u8rtKwqeO5mkNgk1tMTehMeuF3nN/CAT6vEHmpJV1VjxGwJMsmdl5PHPHdSsBsx7
         VKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bE0/IBysZYE/ZXL1p5rQU1Kbefc1vevyehuv3S/iCqk=;
        b=oHhZcxZwmQSyxstnR8buos7xMTrsf5Rrr37zCZVXB19ATqemTUlnJ62qeo3R7Wi4Xy
         kwbbqzJMhD2Gx8u9O62xj98+U+aiPRdiuHoUuJdEGGp5q8uxZM0ZForhHFtiPbc1x//j
         DhGnHmY/VX/7fZJksWHQTpacWm2MoP66ZrJBnFM3nIRw4T6kCmWfSFAid0xMiLRuZSRW
         YNZKmbjLXsEpdCVsSts9wITWIi62aLPNv5+DQtZkiU1iSnChRR+X0zogXpRe3iRlU35n
         mp8r9yDgV7mKAjwVDOGZZjC3lNfZVvpGaq91sMItDC+8oNfYrpxGUt979vFozgrvIW80
         7Vxg==
X-Gm-Message-State: AOAM5312YQMyFMVAwgJN90b5EteGWUYAs0uHnSd7S12em+WBb/Vufxer
	RO6ottfpARSTx3uxrCN0orW8WNbiYXMYvQ==
X-Google-Smtp-Source: ABdhPJy1u1sI2Qacd1ZeB1ioRSKxcoY0B5srbxrxOqLaDc7uoqs6S/o5nqluqGMGr6HaeSiqSlZ+Gg==
X-Received: by 2002:a05:6000:1365:: with SMTP id q5mr4780375wrz.53.1624367409543;
        Tue, 22 Jun 2021 06:10:09 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id 197sm2683862wmb.20.2021.06.22.06.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:09 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/17] staging: rtl8723bs: rename enum items related to channel bonding
Date: Tue, 22 Jun 2021 15:09:48 +0200
Message-Id: <a4172419996bdcaf96f0d9b5438b3b2372ff69b7.1624367071.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

since rtl8723bs card allows only 20Mhz and 40Mhz channels,
rename enum items related to channel bonding accordingly to
the only composite channel bandwidth allowed in 2.4Ghz
(i.e. 40Mhz) in a HT context (since VHT isn't supported)

Example:

VHT_DATA_SC_20_LOWER_OF_80MHZ ->
	HT_DATA_SC_LOWER_OF_40MHZ

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 +++++-----
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 ++--
 drivers/staging/rtl8723bs/include/rtw_rf.h        |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 3ecd034342ec..059d3050acc6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2530,18 +2530,18 @@ u8 SCMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 
 	if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
 		if (pattrib->bwmode == CHANNEL_WIDTH_40) {
-			SCSettingOfDesc = VHT_DATA_SC_DONOT_CARE;
+			SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
 		} else if (pattrib->bwmode == CHANNEL_WIDTH_20) {
 			if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER) {
-				SCSettingOfDesc = VHT_DATA_SC_20_UPPER_OF_80MHZ;
+				SCSettingOfDesc = HT_DATA_SC_20_UPPER_OF_40MHZ;
 			} else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) {
-				SCSettingOfDesc = VHT_DATA_SC_20_LOWER_OF_80MHZ;
+				SCSettingOfDesc = HT_DATA_SC_20_LOWER_OF_40MHZ;
 			} else {
-				SCSettingOfDesc = VHT_DATA_SC_DONOT_CARE;
+				SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
 			}
 		}
 	} else {
-		SCSettingOfDesc = VHT_DATA_SC_DONOT_CARE;
+		SCSettingOfDesc = HT_DATA_SC_DONOT_CARE;
 	}
 
 	return SCSettingOfDesc;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 275460865719..23435dcc5537 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -621,9 +621,9 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 
 	if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
 		if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
-			SCSettingOf20 = VHT_DATA_SC_20_UPPER_OF_80MHZ;
+			SCSettingOf20 = HT_DATA_SC_20_UPPER_OF_40MHZ;
 		else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
-			SCSettingOf20 = VHT_DATA_SC_20_LOWER_OF_80MHZ;
+			SCSettingOf20 = HT_DATA_SC_20_LOWER_OF_40MHZ;
 	}
 
 	return  (SCSettingOf40 << 4) | SCSettingOf20;
diff --git a/drivers/staging/rtl8723bs/include/rtw_rf.h b/drivers/staging/rtl8723bs/include/rtw_rf.h
index 550471637315..48ff15a38bb0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_rf.h
+++ b/drivers/staging/rtl8723bs/include/rtw_rf.h
@@ -95,9 +95,9 @@ enum extchnl_offset {
 };
 
 enum {
-	VHT_DATA_SC_DONOT_CARE = 0,
-	VHT_DATA_SC_20_UPPER_OF_80MHZ = 1,
-	VHT_DATA_SC_20_LOWER_OF_80MHZ = 2,
+	HT_DATA_SC_DONOT_CARE = 0,
+	HT_DATA_SC_20_UPPER_OF_40MHZ = 1,
+	HT_DATA_SC_20_LOWER_OF_40MHZ = 2,
 };
 
 /* 2007/11/15 MH Define different RF type. */
-- 
2.20.1

