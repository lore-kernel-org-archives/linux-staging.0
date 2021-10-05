Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9E92C83
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 20:08:50 +0000 (UTC)
Received: from ipservice-092-217-085-112.092.217.pools.vodafone-ip.de ([92.217.85.112] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mXqk3-000847-9p; Tue, 05 Oct 2021 22:08:47 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/9] staging: r8188eu: remove unused IntrMask
Date: Tue,  5 Oct 2021 22:08:16 +0200
Message-Id: <20211005200821.19783-4-martin@kaiser.cx>
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

The IntrMask array is set but never read. Remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 3 ---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index f71f25e234ab..bd3ba6ab364f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -119,18 +119,15 @@ static void _InitInterrupt(struct adapter *Adapter)
 {
 	u32 imr, imr_ex;
 	u8  usb_opt;
-	struct hal_data_8188e	*haldata = GET_HAL_DATA(Adapter);
 
 	/* HISR write one to clear */
 	rtw_write32(Adapter, REG_HISR_88E, 0xFFFFFFFF);
 	/*  HIMR - */
 	imr = IMR_PSTIMEOUT_88E | IMR_TBDER_88E | IMR_CPWM_88E | IMR_CPWM2_88E;
 	rtw_write32(Adapter, REG_HIMR_88E, imr);
-	haldata->IntrMask[0] = imr;
 
 	imr_ex = IMR_TXERR_88E | IMR_RXERR_88E | IMR_TXFOVW_88E | IMR_RXFOVW_88E;
 	rtw_write32(Adapter, REG_HIMRE_88E, imr_ex);
-	haldata->IntrMask[1] = imr_ex;
 
 	/*  REG_USB_SPECIAL_OPTION - BIT(4) */
 	/*  0; Use interrupt endpoint to upload interrupt pkt */
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index fc6acbba17e7..bfe32864ded6 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -356,7 +356,6 @@ struct hal_data_8188e {
 
 	/*  Interrupt relatd register information. */
 	u32	IntArray[3];/* HISR0,HISR1,HSISR */
-	u32	IntrMask[3];
 	u8	C2hArray[16];
 	u8	UsbTxAggMode;
 	u8	UsbTxAggDescNum;
-- 
2.20.1

