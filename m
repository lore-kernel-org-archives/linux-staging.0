Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031FD3FDC
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:15 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id ka4so51650051ejc.11
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OcUGeKeL0EKOInXkDi+QcgFMbDvuAB8kSfpOxKij6ak=;
        b=PR7yHOYioAX2deO8cix58412+wwLYYrBAbbOC2m9XN1KykCipNLjrMwXjL8nvG6IRb
         LpC77SDbXZCv3G/CcC/Ofkynkm4Ef0omIscGoEWUsZVhocfvNv8YolFzsWxCQA12qwEN
         M+R2eaA4FlPMK/KSp8lk6XMZ1fU2IybweshCjuuovVHRCtBIR6tpVvy2JnXGM0qSIdxS
         KLug+UsctjnbtAhvmEVsPV1dH6mOaB96JaHf66ZsuR93wgPJwjrJTuzjVJXly5PZC9XT
         +R02ZXoJ8TVd1VVVmu7lb6LYbNv7Y8fuqk7LXzmM4c6gfXJsWQsydt48T7kEDRy0Jq8H
         NNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OcUGeKeL0EKOInXkDi+QcgFMbDvuAB8kSfpOxKij6ak=;
        b=PMo7t4xTqAtaPDOb5IdxJyfeycY8Cq9z7bj0PU9Py08b3fpYTcusKtgdZ6slBYFIux
         SK2LNj+yXY1tGSefJEGLmTsyticZqQZGvH+Q0Nh4oo3xVMHEGUmT/7hvwagTO7oQYppI
         5m/JkM9W4tvKgiB4T0nasQm93LMeb7T+tANTvTkA0wn0vxxXArNsDFX2RpnWggk846Rw
         z5WLDzyqNp6LZ4uMeXiZQwfCC2oLLk4+sLQq8UMseolnnEmbEa+3+f+EKBAn9xnD/LYV
         774E5bcaVyLWFz3/c2N2NUZDZWCbwVH++FlMCkM0U6JCuAC9tNMi+qt/hUrcZSDJ/nb3
         58bg==
X-Gm-Message-State: AOAM530jRRerLL/efxcpPHwPK4uZXgO0xoOBHarlvaEHhYQC16QX+zI4
	LlgGWBjum/SmlBudF57UGfCDtpHzKNg=
X-Google-Smtp-Source: ABdhPJzUgp2XxgqLgCIJm0f9UXHF21ZR6+g2nDatAa8NidWaOKFPmVjYOGPhPE1uTppAue1yGH/WXA==
X-Received: by 2002:a17:907:7289:: with SMTP id dt9mr21039217ejc.62.1643704994382;
        Tue, 01 Feb 2022 00:43:14 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:14 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/9] staging: r8188eu: remove UsbTxAggDescNum from struct hal_data_8188e
Date: Tue,  1 Feb 2022 09:42:55 +0100
Message-Id: <20220201084259.7497-6-straube.linux@gmail.com>
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

UsbTxAggDescNum in struct hal_data_8188e is set to 0x6 and never
changed. Define this constant and remove UsbTxAggDescNum from the
hal_data_8188e structure.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c       | 3 +--
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 2 ++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 293541db597d..94dafc7c1ad0 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -518,7 +518,7 @@ s32 rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmitp
 
 		if (pbuf < bulkptr) {
 			desc_cnt++;
-			if (desc_cnt == haldata->UsbTxAggDescNum)
+			if (desc_cnt == USB_TXAGG_DESC_NUM)
 				break;
 		} else {
 			desc_cnt = 0;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index e6c253122e9c..f33586a740af 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -54,7 +54,6 @@ void rtl8188eu_interface_configure(struct adapter *adapt)
 		haldata->UsbBulkOutSize = USB_FULL_SPEED_BULK_SIZE;/* 64 bytes */
 
 	haldata->UsbTxAggMode		= 1;
-	haldata->UsbTxAggDescNum	= 0x6;	/*  only 4 bits */
 
 	haldata->UsbRxAggMode		= USB_RX_AGG_DMA;/*  USB_RX_AGG_DMA; */
 	haldata->UsbRxAggBlockCount	= 8; /* unit : 512b */
@@ -416,7 +415,7 @@ static void usb_AggSettingTxUpdate(struct adapter *Adapter)
 	if (haldata->UsbTxAggMode) {
 		value32 = rtw_read32(Adapter, REG_TDECTRL);
 		value32 = value32 & ~(BLK_DESC_NUM_MASK << BLK_DESC_NUM_SHIFT);
-		value32 |= ((haldata->UsbTxAggDescNum & BLK_DESC_NUM_MASK) << BLK_DESC_NUM_SHIFT);
+		value32 |= ((USB_TXAGG_DESC_NUM & BLK_DESC_NUM_MASK) << BLK_DESC_NUM_SHIFT);
 
 		rtw_write32(Adapter, REG_TDECTRL, value32);
 	}
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 7a72b564400d..9f4d42c1d24e 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -214,7 +214,6 @@ struct hal_data_8188e {
 	u32	UsbBulkOutSize;
 
 	u8	UsbTxAggMode;
-	u8	UsbTxAggDescNum;
 
 	enum usb_rx_agg_mode UsbRxAggMode;
 	u8	UsbRxAggBlockCount;	/*  USB Block count. Block size is
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index f1f2ccfc765e..85eb0aad80d6 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -93,6 +93,8 @@ enum TXDESC_SC {
 #define SGI			BIT(6)
 #define USB_TXAGG_NUM_SHT	24
 
+#define USB_TXAGG_DESC_NUM	0x6
+
 #define txdesc_set_ccx_sw_88e(txdesc, value) \
 	do { \
 		((struct txdesc_88e *)(txdesc))->sw1 = (((value)>>8) & 0x0f); \
-- 
2.34.1

