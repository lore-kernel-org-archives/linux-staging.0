Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA9CA92F
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 19:57:08 +0000 (UTC)
Received: from dslb-188-096-145-172.188.096.pools.vodafone-ip.de ([188.96.145.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pFhDc-0005F2-5s; Wed, 11 Jan 2023 20:57:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 14/20] staging: r8188eu: remove IO defines
Date: Wed, 11 Jan 2023 20:56:34 +0100
Message-Id: <20230111195640.306748-15-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111195640.306748-1-martin@kaiser.cx>
References: <20230111195640.306748-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a couple of IO related defines which are not used in the r8188eu
driver.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/rtw_io.h | 58 ------------------------
 1 file changed, 58 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 95dd66c0be82..749bb1d0eeed 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -22,64 +22,6 @@
 #define rtw_usb_buffer_free(dev, size, addr, dma)			\
 	usb_free_coherent((dev), (size), (addr), (dma))
 
-#define NUM_IOREQ		8
-
-#define MAX_PROT_SZ	(64-16)
-
-#define _IOREADY		0
-#define _IO_WAIT_COMPLETE	1
-#define _IO_WAIT_RSP		2
-
-/*  IO COMMAND TYPE */
-#define _IOSZ_MASK_		(0x7F)
-#define _IO_WRITE_		BIT(7)
-#define _IO_FIXED_		BIT(8)
-#define _IO_BURST_		BIT(9)
-#define _IO_BYTE_		BIT(10)
-#define _IO_HW_			BIT(11)
-#define _IO_WORD_		BIT(12)
-#define _IO_SYNC_		BIT(13)
-#define _IO_CMDMASK_		(0x1F80)
-
-/*
-	For prompt mode accessing, caller shall free io_req
-	Otherwise, io_handler will free io_req
-*/
-
-/*  IO STATUS TYPE */
-#define _IO_ERR_		BIT(2)
-#define _IO_SUCCESS_		BIT(1)
-#define _IO_DONE_		BIT(0)
-
-#define IO_RD32			(_IO_SYNC_ | _IO_WORD_)
-#define IO_RD16			(_IO_SYNC_ | _IO_HW_)
-#define IO_RD8			(_IO_SYNC_ | _IO_BYTE_)
-
-#define IO_RD32_ASYNC		(_IO_WORD_)
-#define IO_RD16_ASYNC		(_IO_HW_)
-#define IO_RD8_ASYNC		(_IO_BYTE_)
-
-#define IO_WR32			(_IO_WRITE_ | _IO_SYNC_ | _IO_WORD_)
-#define IO_WR16			(_IO_WRITE_ | _IO_SYNC_ | _IO_HW_)
-#define IO_WR8			(_IO_WRITE_ | _IO_SYNC_ | _IO_BYTE_)
-
-#define IO_WR32_ASYNC		(_IO_WRITE_ | _IO_WORD_)
-#define IO_WR16_ASYNC		(_IO_WRITE_ | _IO_HW_)
-#define IO_WR8_ASYNC		(_IO_WRITE_ | _IO_BYTE_)
-
-/*
-	Only Sync. burst accessing is provided.
-*/
-
-#define IO_WR_BURST(x)						\
-	(_IO_WRITE_ | _IO_SYNC_ | _IO_BURST_ | ((x) & _IOSZ_MASK_))
-#define IO_RD_BURST(x)						\
-	(_IO_SYNC_ | _IO_BURST_ | ((x) & _IOSZ_MASK_))
-
-/* below is for the intf_option bit defition... */
-
-#define _INTF_ASYNC_	BIT(0)	/* support async io */
-
 struct intf_priv;
 struct intf_hdl;
 
-- 
2.30.2

