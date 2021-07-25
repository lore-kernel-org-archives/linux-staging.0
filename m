Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931CE6D00
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:36 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXO-0000SM-Vf; Sun, 25 Jul 2021 17:59:35 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/18] staging: rtl8188eu: remove write-only HwRxPageSize
Date: Sun, 25 Jul 2021 17:58:57 +0200
Message-Id: <20210725155902.32433-13-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210725155902.32433-1-martin@kaiser.cx>
References: <20210725155902.32433-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HwRxPageSize from struct hal_data_8188e is set but never read. Remove the
component and the code to initialise it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c   | 20 -------------------
 .../staging/rtl8188eu/include/rtl8188e_hal.h  |  1 -
 .../staging/rtl8188eu/include/rtl8188e_spec.h |  4 ----
 3 files changed, 25 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index aaa68356d211..b2dd648aecd7 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -515,26 +515,6 @@ static void usb_AggSettingRxUpdate(struct adapter *Adapter)
 		/*  TODO: */
 		break;
 	}
-
-	switch (PBP_128) {
-	case PBP_128:
-		haldata->HwRxPageSize = 128;
-		break;
-	case PBP_64:
-		haldata->HwRxPageSize = 64;
-		break;
-	case PBP_256:
-		haldata->HwRxPageSize = 256;
-		break;
-	case PBP_512:
-		haldata->HwRxPageSize = 512;
-		break;
-	case PBP_1024:
-		haldata->HwRxPageSize = 1024;
-		break;
-	default:
-		break;
-	}
 }	/*  usb_AggSettingRxUpdate */
 
 static void InitUsbAggregationSetting(struct adapter *Adapter)
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 7d95943fc05e..3e697a3321e1 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -265,7 +265,6 @@ struct hal_data_8188e {
 	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
-	u16	HwRxPageSize;		/*  Hardware setting */
 
 	enum usb_rx_agg_mode UsbRxAggMode;
 	u8	UsbRxAggBlockCount;	/*  USB Block count. Block size is
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_spec.h b/drivers/staging/rtl8188eu/include/rtl8188e_spec.h
index fe0871bbb95f..c7be0a1d70b9 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_spec.h
@@ -803,11 +803,7 @@ So the following defines for 92C is not entire!!!!!!
 #define _PSRX(x)			(x)
 #define _PSTX(x)			((x) << 4)
 
-#define PBP_64				0x0
 #define PBP_128				0x1
-#define PBP_256				0x2
-#define PBP_512				0x3
-#define PBP_1024			0x4
 
 /* 2 TX/RXDMA */
 #define RXDMA_ARBBW_EN			BIT(0)
-- 
2.20.1

