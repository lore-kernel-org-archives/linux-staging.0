Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366171
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:18 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id kt15so1809264ejb.12
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T/0KpG9qJzUFrcObdFWrqj3M4DpTo/B6MAsgxOwfgZw=;
        b=Mywg/Aw5tfjCqpn+8AAvs2eJ9ogyLGXlI7ivF47TcKwvkSg2Frtlnsh+2xzCEToCKV
         vZOdtCojJ4O6LBSw8MxuxacuayiG48O7Tx+lqSPyJVCWSbTL7xCS6dpmC3dKoGMrqf71
         5RgxtSdo6xncSg1Qa9MeNzqMcPKOBWF02xKslXnjZkfJG0ZyDl13VgrpE8E9jb6CbtYJ
         a6Kr8vq7bHnnHeGMPJl5yPm8Xu43WBa7/ajtvSqDxc5A4ydKWGtqdeFa69RG6A4YNHyt
         WbNFbTMz31ZnaKKJsD56UnUdbK+OOABkOHJMxgKhK/BxsOmkkFe8FW4kXvRch2IX4yb+
         51CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T/0KpG9qJzUFrcObdFWrqj3M4DpTo/B6MAsgxOwfgZw=;
        b=WPEj8nNuxoH9EOuRJPuiG41/no9zLZIYQwpoJ4QGO78gVkauXbfWQ9P8n6NouD+WON
         tyqfTfHZog0g9286L1eO+BfPNCFiAszjxW5yLOmVlTbGGOvRsrklWDdf8OCp4W9oGpX2
         IU0RniKlSA/WKtgj6lNscPU8UFhJ/S1Pe+LBUsB2653p9y5QUGTj3UJmXPh2WXJy3PeO
         jysy6702JGp37RfGH2UiuOrT5XVjBNsQlevGkgD5kEKCGhDuorW2GlIvXzO6xQDOfuqL
         nPQGH/wioL23Dj/5Su/xPtYg7ed2K1V9ku19zjymkMZjEewQPEatPoRs0AE30A2lh672
         8Q0A==
X-Gm-Message-State: AOAM531ZUQMbaemTwDaegnEZc144/dfchK2LdqG+IVc1XYWiVCHpnEOA
	8KDXQna/4HU2GPiFxmHB0OuUFyBXK5wsYQ==
X-Google-Smtp-Source: ABdhPJyev3in+h/Z/oALvSw362KMO1ejUOBui9lugELGuzO8TUIrEIVOqFh7po3uhFFhn/qZQXk6GA==
X-Received: by 2002:a17:907:2062:: with SMTP id qp2mr8063522ejb.397.1617268937616;
        Thu, 01 Apr 2021 02:22:17 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id u14sm2462629ejx.60.2021.04.01.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:17 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 33/49] staging: rtl8723bs: remove empty else-blocks in hal/rtl8723b_phycfg.c
Date: Thu,  1 Apr 2021 11:21:03 +0200
Message-Id: <fd56a8d2c033988a9713113c8e7077c751da82ef.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty else-blocks

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 2b9254000526..89d3c2fc0926 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -550,7 +550,6 @@ void PHY_SetTxPowerIndex(
 			DBG_871X("Invalid Rate!!\n");
 			break;
 		}
-	} else {
 	}
 }
 
@@ -649,8 +648,7 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 			SCSettingOf40 = VHT_DATA_SC_40_LOWER_OF_80MHZ;
 		else if (pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 			SCSettingOf40 = VHT_DATA_SC_40_UPPER_OF_80MHZ;
-		else
-			;
+
 		if (
 			(pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER) &&
 			(pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
@@ -671,15 +669,12 @@ static u8 phy_GetSecondaryChnl_8723B(struct adapter *Adapter)
 			(pHalData->nCur80MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 		)
 			SCSettingOf20 = VHT_DATA_SC_20_UPPERST_OF_80MHZ;
-		else
-			;
+
 	} else if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_40) {
 		if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_UPPER)
 			SCSettingOf20 = VHT_DATA_SC_20_UPPER_OF_80MHZ;
 		else if (pHalData->nCur40MhzPrimeSC == HAL_PRIME_CHNL_OFFSET_LOWER)
 			SCSettingOf20 = VHT_DATA_SC_20_LOWER_OF_80MHZ;
-		else
-			;
 	}
 
 	return  (SCSettingOf40 << 4) | SCSettingOf20;
-- 
2.20.1

