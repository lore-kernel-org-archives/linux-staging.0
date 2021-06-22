Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B10071
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:29:51 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id y7so23338826wrh.7
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bE0/IBysZYE/ZXL1p5rQU1Kbefc1vevyehuv3S/iCqk=;
        b=GhVEq7rhPl7NjI+2W1YMuWsjVTJhGJd+P9Xp73VRCGVQhVo/fSfBTTWdMdyEXnWo7C
         fDNKav1Rnmyw/l1KGCq8yjJueArymVAt7NzwzSj+6PLialdVAPLFxau2Uo9WNNqoaXQ6
         DT7CJCcv7ET4LGl/wKzLTm5v9YePLM5ME/UPaVbcuYC/wCmDhWoFl9Y2krsDHUl4uhz2
         iTQwSX7YIfi3aya+BW/YuV021S0wIjOceYhmdur5kCzSzgBj7AaVXNCJWPjHb75Mmnz8
         i3EZQ2w/GmQrC2yihna+v56UsWvNjMtYNwc/Gy+FqmGYQUJ1nYl3+UsjTkE9GPTZg8Ed
         ZGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bE0/IBysZYE/ZXL1p5rQU1Kbefc1vevyehuv3S/iCqk=;
        b=JqvyR8Ixtynqd+U/4iE46FO5hsiTk2uh/B3vCCuiIAzANDcFSvZL7ax1fULvvAhEGQ
         F8oJYHm2h4Q1HRFlTY8zFY21gr0Mlw1uNqV2E0rqEUnTK8ckx1Rwma7k1D/ix7hOhKGB
         mThTr1RiXIz/prlgsgRlhWbil8ZB2sm2FYOwZSGIW6KzTY2LdV5Kby8BnD/EMA9xg85j
         UQnz3VgMqDuGBYjHUo7SVUqvt9OlF9Ku3MVxIekBjsM7FgkopT1l0pJnV1JK8aamHU9l
         ZUbXUm8DdJrQeoyjmt17lVmXzYgCjRdH7v9rqFXo7ZdHzWTFD/NKA6GQHEx9o8BsrbRm
         EFjw==
X-Gm-Message-State: AOAM531cbmyl7YBoUTgISmWusRCJtzXRfOS4V4Rj1SHToHRfMwwV9MFO
	0PsefhSAz0EzaV1/HONSOyE=
X-Google-Smtp-Source: ABdhPJw6KLak52fEqxH6DvIZoJvkV+Tx+34ktmurYsivL6rlY5peuGqX7gFkMJ4BdsGhY7FgdUh0OA==
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr4505623wrt.254.1624364990265;
        Tue, 22 Jun 2021 05:29:50 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id c12sm2665385wmr.27.2021.06.22.05.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:29:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/17] staging: rtl8723bs: rename enum items related to channel bonding
Date: Tue, 22 Jun 2021 14:29:29 +0200
Message-Id: <b8a0d7f41583de6574889a3cd05e3d58a0723417.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
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

