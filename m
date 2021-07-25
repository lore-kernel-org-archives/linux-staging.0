Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBB96D00
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 15:59:35 +0000 (UTC)
Received: from dslb-188-096-139-014.188.096.pools.vodafone-ip.de ([188.96.139.14] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1m7gXO-0000SM-32; Sun, 25 Jul 2021 17:59:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 12/18] staging: rtl8188eu: remove unused IntrMask
Date: Sun, 25 Jul 2021 17:58:56 +0200
Message-Id: <20210725155902.32433-12-martin@kaiser.cx>
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

The IntrMask array is set but never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/hal/usb_halinit.c      | 2 --
 drivers/staging/rtl8188eu/include/rtl8188e_hal.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/usb_halinit.c b/drivers/staging/rtl8188eu/hal/usb_halinit.c
index 62013999c569..aaa68356d211 100644
--- a/drivers/staging/rtl8188eu/hal/usb_halinit.c
+++ b/drivers/staging/rtl8188eu/hal/usb_halinit.c
@@ -118,11 +118,9 @@ static void _InitInterrupt(struct adapter *Adapter)
 	/*  HIMR - */
 	imr = IMR_PSTIMEOUT_88E | IMR_TBDER_88E | IMR_CPWM_88E | IMR_CPWM2_88E;
 	usb_write32(Adapter, REG_HIMR_88E, imr);
-	Adapter->HalData->IntrMask[0] = imr;
 
 	imr_ex = IMR_TXERR_88E | IMR_RXERR_88E | IMR_TXFOVW_88E | IMR_RXFOVW_88E;
 	usb_write32(Adapter, REG_HIMRE_88E, imr_ex);
-	Adapter->HalData->IntrMask[1] = imr_ex;
 
 	/*  REG_USB_SPECIAL_OPTION - BIT(4) */
 	/*  0; Use interrupt endpoint to upload interrupt pkt */
diff --git a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
index 9aba67233c24..7d95943fc05e 100644
--- a/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/rtl8188eu/include/rtl8188e_hal.h
@@ -262,7 +262,6 @@ struct hal_data_8188e {
 
 	/*  Interrupt relatd register information. */
 	u32	IntArray[3];/* HISR0,HISR1,HSISR */
-	u32	IntrMask[3];
 	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
-- 
2.20.1

