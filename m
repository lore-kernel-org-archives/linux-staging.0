Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3013FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t8so10537022wri.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fTMycjhf7bQ4/iwIBGKReOWRba8a40NSGVgfRFeXVyw=;
        b=U/JK16CULZzzTiRpUJyKHh7JkIFkM/fpi6DYhONrevIT534u/XPjhNvx00eyMYoIEP
         DMVVx22NA/RbHXWbja+s3Ro4d7gdnMWyvhTvJjdPRWtkbOO8lG+bNhI9BRHZx9vM7ZFb
         36NmqpWLbDvB5DO/zPumenq72QQ/Uzz3rj8fgL0cIlyYnG615y161tPdgrHHh3lDJwWt
         hHKUPcfbEd/YBFAfmwdK/u5N8tujp3PxQ3SeLj0vBESwsd5SyDlAc74w/4co/VHHbF2l
         lcKXtAtFy3at9P7k8EsBUYtdkhwOd6ci13NbfjZj91IRxuqMzq7UJvO3Q4g0Ne0CGK3v
         7n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTMycjhf7bQ4/iwIBGKReOWRba8a40NSGVgfRFeXVyw=;
        b=sz443772OvbRJrkBDyud9mx65ZG0eJInvjHZ0iI7uGdX7a05BMHvsY4lX6nGBpmkuy
         Zp+onySrhMUzLid4ZxXDj/chGx+ULvSE5eu0DYleJpVa0rZVzXfJ7hvZEI5OFY7KKg1f
         /zAsbceZF3/DBaQw6OSOHaxmU2YeXlKlypBc5xfrRFXzfEl4wLU4gZ5XNCOnGkyohKNN
         5NurQJpQBb0kp5OqJamF1XhdyChLwy9IR13mJFnteBR/o0p32K0XZIZ+rC3pg5kDqq69
         TOTgNBZeWIg7+shZN9zEOmlIvWRIQrmBR/3iVDmI27/rqMlf1xzHKnObK8praaQ9SW6o
         Ke0w==
X-Gm-Message-State: AOAM530845VX2LLcYR0bkC9rjw2plxwBub5qfxTHZQVKtgSzozYfSzJ0
	FwW3LGYB8aOy7VkCNEAwsS4=
X-Google-Smtp-Source: ABdhPJxgvGDUDdGRfxeZvRkGVW9QHcJFLmxkoRsRhGFBTGRbkRf2wnUZzhdOw9hNwz6s6HYPf8oN1A==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr841175wmb.125.1632341140849;
        Wed, 22 Sep 2021 13:05:40 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/47] staging: r8188eu: remove sreset_get_wifi_status()
Date: Wed, 22 Sep 2021 22:03:48 +0200
Message-Id: <20210922200420.9693-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function sreset_get_wifi_status() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sreset.c    | 30 --------------------
 drivers/staging/r8188eu/include/rtw_sreset.h |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sreset.c b/drivers/staging/r8188eu/core/rtw_sreset.c
index 1787c2d7ea5f..baa2a080a46e 100644
--- a/drivers/staging/r8188eu/core/rtw_sreset.c
+++ b/drivers/staging/r8188eu/core/rtw_sreset.c
@@ -25,36 +25,6 @@ void sreset_reset_value(struct adapter *padapter)
 	psrtpriv->last_tx_complete_time = 0;
 }
 
-u8 sreset_get_wifi_status(struct adapter *padapter)
-{
-	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
-	struct sreset_priv *psrtpriv = &pHalData->srestpriv;
-
-	u8 status = WIFI_STATUS_SUCCESS;
-	u32 val32 = 0;
-
-	if (psrtpriv->silent_reset_inprogress)
-		return status;
-	val32 = rtw_read32(padapter, REG_TXDMA_STATUS);
-	if (val32 == 0xeaeaeaea) {
-		psrtpriv->wifi_error_status = WIFI_IF_NOT_EXIST;
-	} else if (val32 != 0) {
-		DBG_88E("txdmastatu(%x)\n", val32);
-		psrtpriv->wifi_error_status = WIFI_MAC_TXDMA_ERROR;
-	}
-
-	if (WIFI_STATUS_SUCCESS != psrtpriv->wifi_error_status) {
-		DBG_88E("==>%s error_status(0x%x)\n", __func__, psrtpriv->wifi_error_status);
-		status = (psrtpriv->wifi_error_status & (~(USB_READ_PORT_FAIL | USB_WRITE_PORT_FAIL)));
-	}
-	DBG_88E("==> %s wifi_status(0x%x)\n", __func__, status);
-
-	/* status restore */
-	psrtpriv->wifi_error_status = WIFI_STATUS_SUCCESS;
-
-	return status;
-}
-
 void sreset_set_wifi_error_status(struct adapter *padapter, u32 status)
 {
 	struct hal_data_8188e	*pHalData = GET_HAL_DATA(padapter);
diff --git a/drivers/staging/r8188eu/include/rtw_sreset.h b/drivers/staging/r8188eu/include/rtw_sreset.h
index 4e97997c305b..47ad185c755f 100644
--- a/drivers/staging/r8188eu/include/rtw_sreset.h
+++ b/drivers/staging/r8188eu/include/rtw_sreset.h
@@ -28,7 +28,6 @@ struct sreset_priv {
 
 void sreset_init_value(struct adapter *padapter);
 void sreset_reset_value(struct adapter *padapter);
-u8 sreset_get_wifi_status(struct adapter *padapter);
 void sreset_set_wifi_error_status(struct adapter *padapter, u32 status);
 
 #endif
-- 
2.33.0

