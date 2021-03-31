Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C135D6F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:53 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id w3so29113200ejc.4
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+qjP3rPq6GRvudxmPUC4N1/IMA281UmIav1b4KbVRkI=;
        b=bUm98LScnGWacVl0SAvhYVeOMyhRNv/Zq/KDJnqAhoNDZd0JLdxMu0dUIBsDA//O3v
         939BArGYZM+PJa03351QuA2AtmV5Be0bIOT1JzKKdgzqmrABrI1zoy4sjPehBzAyFMj8
         kjkBlyRBsEAFtkSlVot/CQIY4b0qQ0THCWcya3Cy7X0MDPmt0RprTowUmN9EdckWxep3
         V8dg4/5vWYJVVZczpMp3l/53FsxzrVRFbKaI8B8dH1iZhxipPYl6xDP4ze3795Gg2dQG
         /LiD6T+vrxEXTmmV2BTjXIJtGshkVdEnVmDfj3neNUhxzpaPmw6mzrIYiQyC2O4HewcM
         AIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+qjP3rPq6GRvudxmPUC4N1/IMA281UmIav1b4KbVRkI=;
        b=cSmMa/rPwBQ1F7ZqpY+jaBREJpSSmWHSeL8ZB3sCKx417jkNiuqqxpouxsSdY9NFrm
         rkDYomna+6//SLaTCN7KxAk0whgCMZWRGVep9YL0viTK13BTkz1SyFH/tU9f+cTFzX8L
         hIRM7KNChiqXpVc+3YPJQatP5/Hu+U6j3RnowaRw6kwrqgdoeMIxw3O7y8njP6Hqk48v
         erzfm1sOgELlX6HiFiAgVeRpVBYP/wEe8runod8KbdgP5wZ4UiBwchkiOkMFmk3VunWS
         5zK4slnasn46bENMQM+ciBp34w/HZtfEwDFdNr8M13bB9zBhqn0k+UtuuIV+Grqdipcy
         9+lQ==
X-Gm-Message-State: AOAM533CgeLhn8gyKELSSAHkpEwKIVt62XIeuNu6Uvzf7e7cG9sYXBHT
	Ue5Gt0q4mT5JqNTHTL0/eds=
X-Google-Smtp-Source: ABdhPJziRlAxm0ldTsyuh1V3luwNdWHu3hej7np0LbqVOVLp1S14bX73PYDM00k8gJTVKz1km6U5hw==
X-Received: by 2002:a17:906:3ac3:: with SMTP id z3mr2651828ejd.106.1617183652335;
        Wed, 31 Mar 2021 02:40:52 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id t15sm1115832edw.84.2021.03.31.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:52 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 21/40] staging: rtl8723bs: replace RT_TRACE with public printk wrappers in hal/sdio_ops.c
Date: Wed, 31 Mar 2021 11:39:49 +0200
Message-Id: <c6d2784da5b281d71600b1d1b9f5bf369b2cdb67.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private macro RT_TRACE for tracing with in-kernel
pr_* printk wrappers

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 42 ++++++++----------------
 1 file changed, 13 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index a24a39e70454..34531d6a6810 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -777,29 +777,15 @@ void EnableInterrupt8723BSdio(struct adapter *adapter)
 	himr = cpu_to_le32(haldata->sdio_himr);
 	sdio_local_write(adapter, SDIO_REG_HIMR, 4, (u8 *)&himr);
 
-	RT_TRACE(
-		_module_hci_ops_c_,
-		_drv_notice_,
-		(
-			"%s: enable SDIO HIMR = 0x%08X\n",
-			__func__,
-			haldata->sdio_himr
-		)
-	);
+	pr_notice("%s %s: enable SDIO HIMR = 0x%08X\n",
+		  DRIVER_PREFIX, __func__, haldata->sdio_himr);
 
 	/*  Update current system IMR settings */
 	tmp = rtw_read32(adapter, REG_HSIMR);
 	rtw_write32(adapter, REG_HSIMR, tmp | haldata->SysIntrMask);
 
-	RT_TRACE(
-		_module_hci_ops_c_,
-		_drv_notice_,
-		(
-			"%s: enable HSIMR = 0x%08X\n",
-			__func__,
-			haldata->SysIntrMask
-		)
-	);
+	pr_notice("%s %s: enable HSIMR = 0x%08X\n",
+		  DRIVER_PREFIX, __func__, haldata->SysIntrMask);
 
 	/*  */
 	/*  <Roger_Notes> There are some C2H CMDs have been sent before system interrupt is enabled, e.g., C2H, CPWM. */
@@ -894,7 +880,7 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 	readbuf = recvbuf->pskb->data;
 	ret = sdio_read_port(&adapter->iopriv.intf, WLAN_RX0FF_DEVICE_ID, readsize, readbuf);
 	if (ret == _FAIL) {
-		RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("%s: read port FAIL!\n", __func__));
+		pr_err("%s %s: read port FAIL!\n", DRIVER_PREFIX, __func__);
 		return NULL;
 	}
 
@@ -1062,9 +1048,8 @@ void sd_int_hdl(struct adapter *adapter)
 
 		sd_int_dpc(adapter);
 	} else {
-		RT_TRACE(_module_hci_ops_c_, _drv_err_,
-				("%s: HISR(0x%08x) and HIMR(0x%08x) not match!\n",
-				__func__, hal->sdio_hisr, hal->sdio_himr));
+		pr_err("%s %s: HISR(0x%08x) and HIMR(0x%08x) not match!\n",
+		       DRIVER_PREFIX, __func__, hal->sdio_hisr, hal->sdio_himr);
 	}
 }
 
@@ -1088,13 +1073,12 @@ u8 HalQueryTxBufferStatus8723BSdio(struct adapter *adapter)
 	numof_free_page = SdioLocalCmd53Read4Byte(adapter, SDIO_REG_FREE_TXPG);
 
 	memcpy(hal->SdioTxFIFOFreePage, &numof_free_page, 4);
-	RT_TRACE(_module_hci_ops_c_, _drv_notice_,
-			("%s: Free page for HIQ(%#x), MIDQ(%#x), LOWQ(%#x), PUBQ(%#x)\n",
-			__func__,
-			hal->SdioTxFIFOFreePage[HI_QUEUE_IDX],
-			hal->SdioTxFIFOFreePage[MID_QUEUE_IDX],
-			hal->SdioTxFIFOFreePage[LOW_QUEUE_IDX],
-			hal->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]));
+	pr_notice("%s %s: Free page for HIQ(%#x), MIDQ(%#x), LOWQ(%#x), PUBQ(%#x)\n",
+		  DRIVER_PREFIX, __func__,
+		  hal->SdioTxFIFOFreePage[HI_QUEUE_IDX],
+		  hal->SdioTxFIFOFreePage[MID_QUEUE_IDX],
+		  hal->SdioTxFIFOFreePage[LOW_QUEUE_IDX],
+		  hal->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]);
 
 	return true;
 }
-- 
2.20.1

