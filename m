Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8693FE0
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id j23so32550934edp.5
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=08thSjsgd1AJJVXbNNLuNDEbPWt749B6BX7mkpr4V3o=;
        b=kSKHoRyVchCr9vi0DKFilMcjnyIIfwONZLBn9uxTfv1ggMfpgtyvHl5LgNCmsrqLLm
         U2G3IdDO2Sroe6/gbvyCjV8j8ZWttXZZ39avQ2ZpyY/V3Dvhv8CSjW9SNoIMfkY/0Nhf
         ehwElTrXFdTVtZwOLvR+JvBsp/i5JMb2KKGuSo9I/VjGrVbnutrUUbKSEMP0pMi7DW5P
         u204ZBFZdLOG/pyAD3Bcb5aKhXerl0a0sdAYcSLKaDa4XGVlV781LVt/+LwRLjRlNd5C
         4IXLx9uiUikUgSh9FMPcgwmz3aentygoo1+oRldykPZ46K4ViSCBfeiPLZ/HPCbPDQTd
         PeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=08thSjsgd1AJJVXbNNLuNDEbPWt749B6BX7mkpr4V3o=;
        b=lbeh4fRLnIVCQ8OvZ2xD4HSePvq8coZ1Uxx2uU4QiiamBOLL0nSK41AhBEk527CcCN
         Oecs3NguM4R77cAvNG9X6Yxb2KLrAETuTuJRwhEoV2rfprrT1z4n1RkctjwPScG0zcFV
         gpDKXqc+nau+I7OC9p3uZZVMx7JWPZM7LCptP/imeEPNN3sRFaAZbkfpgPcnCpUZRp9I
         iNW/HXeg7OObwE2zpIkNh34+4nMVuqHzxW+FC+D15czafjj5K6eAOvjZU0vk6xm0rwoy
         mCDNCSNHfOK600aYwKID/XbESxhJBnGAO6pWjbP6HF8MlrxU/qKdqDIxi7Ozepch9VTx
         pGfw==
X-Gm-Message-State: AOAM53312mztRqO26mbjJciDUShzNyz2QKtnQGeIN1AT2BlWw6T5zgzf
	w7a63wBaM6xWfuuBLZw/YOE=
X-Google-Smtp-Source: ABdhPJw06DCVkCUqXomP7kIF/fgeasEVzVcSC+tzC6zr42aD2TnRVzeMXMx0vZwyDvIK18ko3l8xVA==
X-Received: by 2002:a05:6402:34c7:: with SMTP id w7mr24203551edc.397.1643704992264;
        Tue, 01 Feb 2022 00:43:12 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:11 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/9] staging: r8188eu: remove PGMaxGroup from struct hal_data_8188e
Date: Tue,  1 Feb 2022 09:42:52 +0100
Message-Id: <20220201084259.7497-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201084259.7497-1-straube.linux@gmail.com>
References: <20220201084259.7497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the variable PGMaxGroup in struct hal_data_8188e is set to 13 and
never changed. We can use the already defined constant MAX_PG_GROUP,
which is 13, and remove PGMaxGroup from struct hal_data_8188e.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c  | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c      | 1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 9b06a23df2ac..ea847ec39e13 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -200,7 +200,7 @@ static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
 			/*  increase power diff defined by Realtek for regulatory */
 			if (pHalData->pwrGroupCnt == 1)
 				chnlGroup = 0;
-			if (pHalData->pwrGroupCnt >= pHalData->PGMaxGroup) {
+			if (pHalData->pwrGroupCnt >= MAX_PG_GROUP) {
 				if (Channel < 3)			/*  Channel 1-2 */
 					chnlGroup = 0;
 				else if (Channel < 6)		/*  Channel 3-5 */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0fdade585d25..91b854c7b9a1 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1738,7 +1738,6 @@ void rtl8188eu_init_default_value(struct adapter *adapt)
 	haldata->odmpriv.RFCalibrateInfo.bIQKInitialized = false;
 	haldata->odmpriv.RFCalibrateInfo.TM_Trigger = 0;/* for IQK */
 	haldata->pwrGroupCnt = 0;
-	haldata->PGMaxGroup = 13;
 	haldata->odmpriv.RFCalibrateInfo.ThermalValue_HP_index = 0;
 	for (i = 0; i < HP_THERMAL_NUM; i++)
 		haldata->odmpriv.RFCalibrateInfo.ThermalValue_HP[i] = 0;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 2de7c0464411..661c447a0453 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -150,7 +150,6 @@ struct txpowerinfo24g {
 
 struct hal_data_8188e {
 	struct HAL_VERSION	VersionID;
-	u8	PGMaxGroup;
 	/* current WIFI_PHY values */
 	u32	ReceiveConfig;
 	enum ht_channel_width CurrentChannelBW;
-- 
2.34.1

