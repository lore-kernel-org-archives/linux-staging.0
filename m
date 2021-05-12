Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9CE70
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 07:38:57 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id c22so5415809ejd.12
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N9lhNSkhlyUhXIO2O+gz6kztxq/n6XYJjAIx1T19amQ=;
        b=NCVUjbwJyi4J8KMUagQgUhYcUdm/bOEs57Z4W8zkTyVfrMs81FmSAoTxTqCedjKOse
         cglM0y0DP2muX3kEQzaZAYs98P5m7EslPZPYgFbnnfLnpKx8AYSvEXu9yxj0U3yA1wqI
         biPBYqP2gD6g6OhfMiwpPQWBbe69T8GawEJU++3Mpu0YlYPsVP/7tkhb88HAPlFyvwwy
         N2QhQx1BNP/e7IGjUpT3ZGcdnq2ecU1ipnHepX1BwabKagSSYabYNq0uLJAnbOfWv4Et
         JdwFr1G0/GH73uZQ0GosBDDO9SuJpSaCgnicVXgyrROX9DFKkrb0WMzXazK3Z8v4lNva
         jP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N9lhNSkhlyUhXIO2O+gz6kztxq/n6XYJjAIx1T19amQ=;
        b=tzjNQwVLVmmCOPrG4W2RW9oSgVMnGmzJ3uuROaGq7JnpXXQtfFEI42wxLrs5aNUCfO
         FsK0i7buRfwZD7zcKA41Ni8UQcblCHyS4lDupmZnClJqbXIvC7ZVvceFIbAoL5jEYQPq
         CA45nQhiP2A/leciLvmrSvaSTVpCl7WhwkqtdXXCQZvps3kNrK20jMvJgsE7RYtIf71o
         8iwOOJfynzRUVSht7iRdJK2sR9pmsTWlYbeiuJibT0uR4cVeEqVujjWb060IV92WPPL4
         K84tziw2G589m1qakuS+KlNVk5dWF8IcTMv2On73Aj85fQBRTkFvkyNTMCn2Mcsil7bT
         QJcQ==
X-Gm-Message-State: AOAM530TDfdPCQQHhc8GKc/x47aVMtpu4jt7ZDKmXaZp8cQd22klTte4
	EpqTsa99csP2f+fGoCvNJ5c=
X-Google-Smtp-Source: ABdhPJwjfxUxccgq1TPii8sjiTaDSYEYfOYqvpyT74mqGOvwHpwD90ju0JkbubJNS1684x8GT9gsaw==
X-Received: by 2002:a17:906:268c:: with SMTP id t12mr5761291ejc.441.1620805136528;
        Wed, 12 May 2021 00:38:56 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id g16sm5691854ejw.42.2021.05.12.00.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 00:38:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH] staging: rtl8723bs: hal: Remove set but unused variable
Date: Wed, 12 May 2021 09:38:52 +0200
Message-Id: <20210512073852.14085-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed "delta_IQK" and its occurrences in comments
and code because the variable is set but not used.
Issue detected by GCC.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index b8e385fdda89..365e1195b5e5 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -76,7 +76,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 	struct dm_odm_t *pDM_Odm = &pHalData->odmpriv;
 
-	u8 ThermalValue = 0, delta, delta_LCK, delta_IQK, p = 0, i = 0;
+	u8 ThermalValue = 0, delta, delta_LCK, p = 0, i = 0;
 	u8 ThermalValue_AVG_count = 0;
 	u32 ThermalValue_AVG = 0;
 
@@ -137,7 +137,7 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		ThermalValue = (u8)(ThermalValue_AVG / ThermalValue_AVG_count);
 	}
 
-	/* 4 5. Calculate delta, delta_LCK, delta_IQK. */
+	/* 4 5. Calculate delta, delta_LCK */
 	/* delta" here is used to determine whether thermal value changes or not. */
 	delta =
 		(ThermalValue > pDM_Odm->RFCalibrateInfo.ThermalValue) ?
@@ -147,10 +147,6 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 		(ThermalValue > pDM_Odm->RFCalibrateInfo.ThermalValue_LCK) ?
 		(ThermalValue - pDM_Odm->RFCalibrateInfo.ThermalValue_LCK) :
 		(pDM_Odm->RFCalibrateInfo.ThermalValue_LCK - ThermalValue);
-	delta_IQK =
-		(ThermalValue > pDM_Odm->RFCalibrateInfo.ThermalValue_IQK) ?
-		(ThermalValue - pDM_Odm->RFCalibrateInfo.ThermalValue_IQK) :
-		(pDM_Odm->RFCalibrateInfo.ThermalValue_IQK - ThermalValue);
 
 	/* 4 6. If necessary, do LCK. */
 	/*  Delta temperature is equal to or larger than 20 centigrade. */
-- 
2.31.1

