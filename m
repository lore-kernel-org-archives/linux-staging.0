Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF70C2C81
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 20:08:49 +0000 (UTC)
Received: from ipservice-092-217-085-112.092.217.pools.vodafone-ip.de ([92.217.85.112] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mXqk2-000847-5R; Tue, 05 Oct 2021 22:08:46 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/9] staging: r8188eu: remove write-only HwRxPageSize
Date: Tue,  5 Oct 2021 22:08:15 +0200
Message-Id: <20211005200821.19783-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211005200821.19783-1-martin@kaiser.cx>
References: <20211005200821.19783-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HwRxPageSize from struct hal_data_8188e is set but never read. Remove
the component and the code to initialise it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c     | 20 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
 .../staging/r8188eu/include/rtl8188e_spec.h   |  4 ----
 3 files changed, 25 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index ab7b80144403..f71f25e234ab 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -524,26 +524,6 @@ usb_AggSettingRxUpdate(
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
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 08dedf4c91b8..fc6acbba17e7 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -360,7 +360,6 @@ struct hal_data_8188e {
 	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
-	u16	HwRxPageSize;		/*  Hardware setting */
 	u32	MaxUsbRxAggBlock;
 
 	enum usb_rx_agg_mode UsbRxAggMode;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index 1c96f7b81245..01aeaa4ac605 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -893,11 +893,7 @@ Current IOREG MAP
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

