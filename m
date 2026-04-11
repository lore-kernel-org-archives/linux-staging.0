Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0E2D46CE
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 05:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775885319; cv=none; b=ehIZ5IO3IMs7q5RFAiMjfpVyfTM0/UIDWj8U2dFWXUDJ3Q/NTcSg/RhdYIz+UwT2k6pFEfWImKc5mT/aYgLCidbtshVXuRUm9krq2PEiCc/IfDgujYV7vSH8HS+j9RcTLKvB4YaqtXcbmGfHYUI4IIxDBxT2R6fISRv7MIjxWvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775885319; c=relaxed/simple;
	bh=cHlezQzNTFhHadbHMdW3KF+YwpmykR5v11PUP9pfbeA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bjmqTDbPO3w9gPI8MUcr3jP7oEoWv0C9zSSgpUcFljQlR895p0RWecf6N6vIRy5LX7wDP5Enpx3F0EU4IaaamSEEq3XOHchlwJcY/iIp7pgQZG52pZPr/LOEPfE4YFwObdqQEZLAgEzfdcDnWjm4idi+v0+2IWqDFXX1ezrkxVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmN0p1Jd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmN0p1Jd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab46931cf1so15658905ad.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 22:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775885317; x=1776490117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0kdtgv3kF42uEcqXb+PXCIP+Ad+2Y3zNeT/97wbW9NI=;
        b=OmN0p1JdpdQjqIkCgxdHpLXAr9BVKmSsMfBjMdu7saJXd8GLAG86anLbRKdlC1rNU1
         3oiy7c3PcMUEDlWr1bliaL2HJsoo0GM7gUvZSs3XoXooeSQrLf/aN7aupomHFyuauzCv
         XozmPAwfMPPkuptdqZ0uRFN4O2E43YKeB2fssbpZnJqf9oh3FipwHDrPNV6YRda1YKlf
         xRgPqrtCYyvIDxFrkOdM6mbke1hjkBce8fb05FPpSDYUpYBWw39nLQKL3nfLTvV+C4ZU
         jaaQJrdE0sae4eadWRkP8eUg7dzliC5v7D9D5QvkaBI0tpBEfcznFlOJmLGWTlmgfZNa
         zbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775885317; x=1776490117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kdtgv3kF42uEcqXb+PXCIP+Ad+2Y3zNeT/97wbW9NI=;
        b=F0VD8mpOay/8ggZKpGDXe+MBy/xah+eRwGJS9wgZ52JA0TJsCnfuCoc8AQ6wT+jznj
         kXV3nLqTlA3J1aX8mjJL2o+CRCcfZg7U6DexWptjX+FGXhHH+ey+7uHyHWylycEf3qcR
         e08MaBwtnKS+NF9NZN6QsVJjjlemM0BCCoumZgXFY6GjRNqmyn4bZtC6/Fn65024fEKj
         73z0m5mEMMdMCCBGoDTKya296Ya5jesPFMFZDZKmNWFhnv/x+Phnt7YrPjc2RLgmNUUl
         UjmTpdLN0wUJyf9Tp7qAr8g7JEVnbCbt+/ZRZITqGi2dRWpswcWMm2BUCGfWa2dGJVq4
         Ygug==
X-Gm-Message-State: AOJu0Ywv0LUvguQGOot9Mfv2006dSZZXXLVG38WRFmwmi91GRQu2Je2N
	aY4vE/O+/DowcAOL2NR3QIcA5HXA9Yjcfo/UwLOCMYQC2hKIHfqGH9G2
X-Gm-Gg: AeBDievUJZ7+9gPec1dNWpwa8KyFneH1N7/eMIhwACvMX0+1nhAblPRIyO+IAolrPh3
	DzzCGsthgAeDY5NTMyhJvWN81IfmWet3c5n7CcnbxJq8O/BxYqun48DuE66F7obLPhOA+ui47cC
	OoLkJmDmqvwt6Y636F8tERS3yTfFsH4ASyLyE95mZ5y585Icd2wsGAKBLJ50wI1pa882PbIlgDz
	zBHxmHBmufSU5IItd3TOKYgQTw++dIK3FffN1KVvrf2tn/KjeBcYMgF8Osdfvz2Ai1AvfcEnY5v
	h/L0U0Lg8jBlTZK7ignrT3giZdLaXWxRQKcHMQVBMkAiaZgivjqyg44tOi8TKcQQB0kp1jHSUVp
	LrR9O2WrHqoFq715oFk01Mc+1jNib2xCoBHPuvcluScbgMNGvJKs1lzf7qwcpKu4oyvHOrEyQBg
	8T854IBc3thQl04ziL/jAH7h7hFRt0P9GzjQY=
X-Received: by 2002:a17:902:ed4c:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2b2c722f15emr68659285ad.5.1775885317377;
        Fri, 10 Apr 2026 22:28:37 -0700 (PDT)
Received: from C6-AF-E1-B8-1C-91 ([223.188.110.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f09e85sm51939565ad.47.2026.04.10.22.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 22:28:36 -0700 (PDT)
From: Adith-Joshua <adithalex29@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Adith-Joshua <adithalex29@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace magic numbers with named constants
Date: Sat, 11 Apr 2026 10:58:17 +0530
Message-ID: <20260411052817.354594-1-adithalex29@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded magic numbers in rtl8723b_InitBeaconParameters()
with descriptive macros to improve readability and maintainability.

No functional changes.

Signed-off-by: Adith-Joshua <adithalex29@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c   | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 8d259820f103..41f561120af5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -864,6 +864,18 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
+#define TBTT_PROHIBIT_HOLD_TIME_MS   0x64
+#define TBTT_PROHIBIT_SETUP_TIME_MS  0x04
+
+#define TBTT_PROHIBIT_VALUE \
+	((TBTT_PROHIBIT_HOLD_TIME_MS << 8) | TBTT_PROHIBIT_SETUP_TIME_MS)
+
+#define BCNTCFG_AIFS 0x66
+#define BCNTCFG_CW   0x0F
+
+#define BCNTCFG_VALUE \
+	((BCNTCFG_AIFS << 8) | BCNTCFG_CW)
+
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
@@ -878,8 +890,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_VALUE);/*  ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -888,7 +899,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_VALUE);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-- 
2.53.0

