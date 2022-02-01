Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7483FE0
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:16 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id s5so51553363ejx.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YcG31YplHrXluk87Wi1M0SWtR6vNAvMNXanCHIBbWJY=;
        b=QILaIYS0X8sPFHXxt6/0hYjYKZBrxCYFXwo+qDqOidTBHrKO1a06VLbEwwHAFUZLOR
         Z8n4OxaTfInsu9e0bEnkn8flWOU3Pxl+ZBZ+1tPIcy2u05glF1QCh4u95Z4y2yX4uqDz
         8eaxb5V95PxzJ8gCdfXT82pnaCpvu2/jec6OXWkcsSGOWdNiFVb/jt+ZeXIDzYFD1S1e
         Fo9Ogs72lhvFN4PvHfZAhU6PUrq4FO1PIy7/ClLWOQ5py5LvknNPGIitpMGkGksnPjSM
         HhP6xKJDB+crGCIXy+k037PR7GapeI1PEaNXaWRFi1m2Ne3xV+mU4tUnV7pbDvQ3SZvd
         YS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YcG31YplHrXluk87Wi1M0SWtR6vNAvMNXanCHIBbWJY=;
        b=ojlJujTPyLmE7rZ6dJwb1+iZNm1w+I7ll0RDMsJecJuOEIdbiqeSUcniQ5AdMWZzos
         kr9Ll+zOJ70yd14OQxPX51NqtWqqGdYrMPAbje3JjaSMZnUCs/HCGgTfU7bVi+UX6z2Q
         yZGFSISlXeE6uxjaFoF/kWql0jW3TMg1LWioT/EHvlXX6WaWoS888Z8KYapsncVMOdVC
         4C5gCRz6GipAsQFCSIEh1jjWuaZKTGNU+b5fx69OuPB13SiXM7ah5PGcCyz5rMQbmNKu
         zyLjEMkYs8B7AfXdrN0825EcXsMRe8sb4OopQh47kOdObZfdu3fB17s1JlZH1/vum/Aw
         c0pw==
X-Gm-Message-State: AOAM532M22zQjZzTpdkJDl3ZNBYnBAkoqw/icq6QDH0h5W2FFR/20wK4
	or/zkOToYL5ormtjgHoMu4I=
X-Google-Smtp-Source: ABdhPJyKnpEPDGGp8l+xJimzEO3EJX7CRZY5+s0KYc0f1F4FfOp9lqsDVnU4qd293aAHJ73vYHPnGw==
X-Received: by 2002:a17:907:3e27:: with SMTP id hp39mr20715393ejc.761.1643704995080;
        Tue, 01 Feb 2022 00:43:15 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:14 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/9] staging: r8188eu: remove UsbTxAggMode from struct hal_data_8188e
Date: Tue,  1 Feb 2022 09:42:56 +0100
Message-Id: <20220201084259.7497-7-straube.linux@gmail.com>
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

UsbTxAggMode in struct hal_data_r8188e is only used in a single if
statement. Remove UsbTxAggMode from the hal_data_8188e structure and
adjust the if statement.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 17 ++++++-----------
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  2 --
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f33586a740af..1c40d5065f51 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -53,8 +53,6 @@ void rtl8188eu_interface_configure(struct adapter *adapt)
 	else
 		haldata->UsbBulkOutSize = USB_FULL_SPEED_BULK_SIZE;/* 64 bytes */
 
-	haldata->UsbTxAggMode		= 1;
-
 	haldata->UsbRxAggMode		= USB_RX_AGG_DMA;/*  USB_RX_AGG_DMA; */
 	haldata->UsbRxAggBlockCount	= 8; /* unit : 512b */
 	haldata->UsbRxAggBlockTimeout	= 0x6;
@@ -406,20 +404,17 @@ static void _InitRetryFunction(struct adapter *Adapter)
  *---------------------------------------------------------------------------*/
 static void usb_AggSettingTxUpdate(struct adapter *Adapter)
 {
-	struct hal_data_8188e *haldata = &Adapter->haldata;
 	u32 value32;
 
 	if (Adapter->registrypriv.wifi_spec)
-		haldata->UsbTxAggMode = false;
+		return;
 
-	if (haldata->UsbTxAggMode) {
-		value32 = rtw_read32(Adapter, REG_TDECTRL);
-		value32 = value32 & ~(BLK_DESC_NUM_MASK << BLK_DESC_NUM_SHIFT);
-		value32 |= ((USB_TXAGG_DESC_NUM & BLK_DESC_NUM_MASK) << BLK_DESC_NUM_SHIFT);
+	value32 = rtw_read32(Adapter, REG_TDECTRL);
+	value32 = value32 & ~(BLK_DESC_NUM_MASK << BLK_DESC_NUM_SHIFT);
+	value32 |= ((USB_TXAGG_DESC_NUM & BLK_DESC_NUM_MASK) << BLK_DESC_NUM_SHIFT);
 
-		rtw_write32(Adapter, REG_TDECTRL, value32);
-	}
-}	/*  usb_AggSettingTxUpdate */
+	rtw_write32(Adapter, REG_TDECTRL, value32);
+}
 
 /*-----------------------------------------------------------------------------
  * Function:	usb_AggSettingRxUpdate()
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 9f4d42c1d24e..5dce718c0865 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -213,8 +213,6 @@ struct hal_data_8188e {
 
 	u32	UsbBulkOutSize;
 
-	u8	UsbTxAggMode;
-
 	enum usb_rx_agg_mode UsbRxAggMode;
 	u8	UsbRxAggBlockCount;	/*  USB Block count. Block size is
 					 * 512-byte in high speed and 64-byte
-- 
2.34.1

