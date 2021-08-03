Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28BC2FAD
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 23:05:44 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so143604wms.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2N73B/DihbJFYmxQPqgbLioVgD2n7Pce+ipSSMRqdQc=;
        b=iSgB9D3ObYd/uv8DpDxLbLpkpCGEs/ALkm8LR2ghQD7KXQcTgV+rbkyJYxXZEW7r+J
         +oGi3AIqtcp1AVEBenHKziAjJcDzKXEgdHSI374bxqdJ61F9ANTAwJiQXWuwF/T0Pflc
         tApz5IL+mpUWIrIOdwSbN9bwILVBEyscXX2www5POVYMIJgA5OWQ01XYsHzfIOwPg9Qw
         rh4cYVl0Ks3+7B/woF8NElo5HtusBwzADmvTVrRRP4zi74zkjTxfckgNVvEvKBD8y2gB
         XDbliezbZZFt8iJs4pyO+syDGKEYF4cNbkTJ9OdAmNoiwQ5yo7lweXAcAgE5wfI+M1Qw
         NkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2N73B/DihbJFYmxQPqgbLioVgD2n7Pce+ipSSMRqdQc=;
        b=CBlw2cKudJQzojrWMrWLP6Zfv2SY+/lYp/hioHzkNw1o1i0/UfTGNyc/kKxPZSsiyP
         1NGx6PLSXvMVCBuiLUogDSCSRqbbf+Hf5mFAljwbAu2YCyqHJzrxtGCa+J5l6ngVqJBO
         rJzK3n4sdk6S7gAZgPpOYLtyGFm0C86wEvyjz4+q9hnsKFbFylgKTEu2dJ2xxnVvV6Fm
         bYRwcNSm9Hymh24/Pc8ZTvcneghQ2cHvKPWktMLPQjbHrEMsJ1q2ixF4puwzd2AJ7PCu
         sW2slHo3x70WvsWbplkf0MmSRPvF4OB4vPIlsuDna9hNBkgy+yCMmrCq3wl1prTDatbs
         NgJw==
X-Gm-Message-State: AOAM532jcHZ5ofJC9/kFlMZx19okx8ix4oq00q6K11kx/1a7eYEOhTuz
	9SJvmf4qdFZ/ystt9PBmqkzR2g==
X-Google-Smtp-Source: ABdhPJylIdAeFcP4jL7sArW7I9UGFKwc2x8XXpvMl12kjM4HwiOqH5ENokveSE9cXhakrzjnTw0Qag==
X-Received: by 2002:a1c:980e:: with SMTP id a14mr24276807wme.123.1628031943288;
        Tue, 03 Aug 2021 16:05:43 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id i29sm330045wmb.20.2021.08.03.16.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:05:42 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: r8188eu: remove RT_TRACE calls from hal/usb_halinit.c
Date: Wed,  4 Aug 2021 00:05:34 +0100
Message-Id: <20210803230535.74254-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803230535.74254-1-phil@philpotter.co.uk>
References: <20210803230535.74254-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from hal/usb_halinit.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/hal/usb_halinit.c | 27 ++---------------------
 1 file changed, 2 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d985894c0f30..a94d1351f944 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -712,10 +712,8 @@ static u32 rtl8188eu_hal_init(struct adapter *Adapter)
 
 	HAL_INIT_PROFILE_TAG(HAL_INIT_STAGES_INIT_PW_ON);
 	status = rtl8188eu_InitPowerOn(Adapter);
-	if (status == _FAIL) {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_err_, ("Failed to init power on!\n"));
+	if (status == _FAIL)
 		goto exit;
-	}
 
 	/*  Save target channel */
 	haldata->CurrentChannel = 6;/* default set to 6 */
@@ -757,7 +755,6 @@ static u32 rtl8188eu_hal_init(struct adapter *Adapter)
 			haldata->fw_ractrl = false;
 			return status;
 		} else {
-			RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("Initializeadapt8192CSdio(): Download Firmware Success!!\n"));
 			Adapter->bFWReady = true;
 			haldata->fw_ractrl = false;
 		}
@@ -805,10 +802,8 @@ static u32 rtl8188eu_hal_init(struct adapter *Adapter)
 
 	HAL_INIT_PROFILE_TAG(HAL_INIT_STAGES_INIT_LLTT);
 	status =  InitLLTTable(Adapter, txpktbuf_bndy);
-	if (status == _FAIL) {
-		RT_TRACE(_module_hci_hal_init_c_, _drv_err_, ("Failed to init LLT table\n"));
+	if (status == _FAIL)
 		goto exit;
-	}
 
 	HAL_INIT_PROFILE_TAG(HAL_INIT_STAGES_MISC02);
 	/*  Get Rx PHY status in order to report RSSI and others. */
@@ -968,8 +963,6 @@ static void CardDisableRTL8188EU(struct adapter *Adapter)
 	u8 val8;
 	struct hal_data_8188e	*haldata	= GET_HAL_DATA(Adapter);
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("CardDisableRTL8188EU\n"));
-
 	/* Stop Tx Report Timer. 0x4EC[Bit1]=b'0 */
 	val8 = rtw_read8(Adapter, REG_TX_RPT_CTRL);
 	rtw_write8(Adapter, REG_TX_RPT_CTRL, val8&(~BIT1));
@@ -1067,16 +1060,12 @@ static unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 
 	status = _SUCCESS;
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_,
-		 ("===> usb_inirp_init\n"));
-
 	precvpriv->ff_hwaddr = RECV_BULK_IN_ADDR;
 
 	/* issue Rx irp to receive data */
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;
 	for (i = 0; i < NR_RECVBUFF; i++) {
 		if (_read_port(pintfhdl, precvpriv->ff_hwaddr, 0, (unsigned char *)precvbuf) == false) {
-			RT_TRACE(_module_hci_hal_init_c_, _drv_err_, ("usb_rx_init: usb_read_port error\n"));
 			status = _FAIL;
 			goto exit;
 		}
@@ -1086,20 +1075,13 @@ static unsigned int rtl8188eu_inirp_init(struct adapter *Adapter)
 	}
 
 exit:
-
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("<=== usb_inirp_init\n"));
-
 	return status;
 }
 
 static unsigned int rtl8188eu_inirp_deinit(struct adapter *Adapter)
 {
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("\n ===> usb_rx_deinit\n"));
-
 	rtw_read_port_cancel(Adapter);
 
-	RT_TRACE(_module_hci_hal_init_c_, _drv_info_, ("\n <=== usb_rx_deinit\n"));
-
 	return _SUCCESS;
 }
 
@@ -1156,11 +1138,6 @@ static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 		/* Read Permanent MAC address */
 		memcpy(eeprom->mac_addr, &hwinfo[EEPROM_MAC_ADDR_88EU], ETH_ALEN);
 	}
-	RT_TRACE(_module_hci_hal_init_c_, _drv_notice_,
-		 ("Hal_EfuseParseMACAddr_8188EU: Permanent Address = %02x-%02x-%02x-%02x-%02x-%02x\n",
-		 eeprom->mac_addr[0], eeprom->mac_addr[1],
-		 eeprom->mac_addr[2], eeprom->mac_addr[3],
-		 eeprom->mac_addr[4], eeprom->mac_addr[5]));
 }
 
 static void Hal_CustomizeByCustomerID_8188EU(struct adapter *adapt)
-- 
2.31.1

