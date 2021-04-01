Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1D71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:22:14 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id jy13so1864142ejc.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/KAqN7OiukR9pBEx+MKuFI87FFsRG2Q+q0C2pJM29M=;
        b=loAVXciDRZdkPztNwIQ+ey82oQ8OSHqjHdoqboHEC2X0pV8y6yiZOJsQEImqX8w9Y8
         VnjHQONh/ZVw58U+Cg3zHoGXDGG6uu1QeQ2HXcIaYRKtz5Wtqgp6Y8O+WIZgxbqXTahy
         52J0iUCGMfUxx0S/rMxjXt0eLGQ8KXAsDE8sKIV9yLyYFu3cdapvr8Ig+1OuNmhV+gaP
         uc0NfWH5+T2rm7vjQ4cqTqbz60tkoDbD+Y5wM2Tv9KWyMC9T1j2PNirGaaFX5fOx+Rln
         76zdeszStIO3TFzCXYRPi6FiZ7RLJj55ddDdfTHhyG5lEuj6uJvyGPfIZ0P2iv2MsHkW
         OJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/KAqN7OiukR9pBEx+MKuFI87FFsRG2Q+q0C2pJM29M=;
        b=m5EFCHBNYk1c2OIAz03R8cfLxbM7ekCE8k2NICykMl7gp2YLnjyjv9k5c3JXzKDjwN
         cvlmXskRi+BvNkSoSmkLEbsXnBg0W5VZWtk87HKn/VdcYLvmgNT5owQq55r/9vZp0kvF
         Pof3VNwKrhew1N0U1kVwxGDbS/QXV8i028fWKCSApoivKiXW9DAswjZtBDH1x49PtTGS
         Z9/R4UlCljo9YdZ68iqljL27gx5MAibJhVnvju0l+AQ6nAkbc8rocxYg12HYEx886NRs
         NpNo2uQl2GT77G0RfDAimMdk38ZYLB8D46NCauQhjulQ7qLvggrgu0BwjIgV+Po85qaw
         WfgA==
X-Gm-Message-State: AOAM530zksZ7Rn16FnLUW+77FRrkXimuq+lqWUjuGJpNytw1P9K7Dgps
	qNRfdF3GXyURAlgdUVluQWw=
X-Google-Smtp-Source: ABdhPJzsf8yfWIT88QUZaZCb9RdM8YCBPVq1FcTLqxxaFzTrGsj7nW9aBdWRanfU9kw2ocsRfQXvaA==
X-Received: by 2002:a17:906:ecaa:: with SMTP id qh10mr8106448ejb.425.1617268932981;
        Thu, 01 Apr 2021 02:22:12 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id i11sm2480604ejc.101.2021.04.01.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:22:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 30/49] staging: rtl8723bs: remove RT_TRACE logs in hal/sdio_ops.c
Date: Thu,  1 Apr 2021 11:21:00 +0200
Message-Id: <b5a21d803030584597a264c8554b64297eec3542.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove all RT_TRACE logs

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 31 ------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index a24a39e70454..4777793e752d 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -777,30 +777,10 @@ void EnableInterrupt8723BSdio(struct adapter *adapter)
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
-
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
-
 	/*  */
 	/*  <Roger_Notes> There are some C2H CMDs have been sent before system interrupt is enabled, e.g., C2H, CPWM. */
 	/*  So we need to clear all C2H events that FW has notified, otherwise FW won't schedule any commands anymore. */
@@ -894,7 +874,6 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 	readbuf = recvbuf->pskb->data;
 	ret = sdio_read_port(&adapter->iopriv.intf, WLAN_RX0FF_DEVICE_ID, readsize, readbuf);
 	if (ret == _FAIL) {
-		RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("%s: read port FAIL!\n", __func__));
 		return NULL;
 	}
 
@@ -1062,9 +1041,6 @@ void sd_int_hdl(struct adapter *adapter)
 
 		sd_int_dpc(adapter);
 	} else {
-		RT_TRACE(_module_hci_ops_c_, _drv_err_,
-				("%s: HISR(0x%08x) and HIMR(0x%08x) not match!\n",
-				__func__, hal->sdio_hisr, hal->sdio_himr));
 	}
 }
 
@@ -1088,13 +1064,6 @@ u8 HalQueryTxBufferStatus8723BSdio(struct adapter *adapter)
 	numof_free_page = SdioLocalCmd53Read4Byte(adapter, SDIO_REG_FREE_TXPG);
 
 	memcpy(hal->SdioTxFIFOFreePage, &numof_free_page, 4);
-	RT_TRACE(_module_hci_ops_c_, _drv_notice_,
-			("%s: Free page for HIQ(%#x), MIDQ(%#x), LOWQ(%#x), PUBQ(%#x)\n",
-			__func__,
-			hal->SdioTxFIFOFreePage[HI_QUEUE_IDX],
-			hal->SdioTxFIFOFreePage[MID_QUEUE_IDX],
-			hal->SdioTxFIFOFreePage[LOW_QUEUE_IDX],
-			hal->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]));
 
 	return true;
 }
-- 
2.20.1

