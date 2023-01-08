Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5089728F9
	for <linux-staging@lists.linux.dev>; Sun,  8 Jan 2023 18:59:54 +0000 (UTC)
Received: from dslb-188-096-147-053.188.096.pools.vodafone-ip.de ([188.96.147.53] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEarh-0003b8-Bx; Sun, 08 Jan 2023 19:57:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/13] staging: r8188eu: voq_cnt is write-only
Date: Sun,  8 Jan 2023 19:57:29 +0100
Message-Id: <20230108185738.597105-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230108185738.597105-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

voq_cnt in struct xmit_priv is initialised, incremented and decremented
but never read. Remove voq_cnt and resulting dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c        | 3 ---
 drivers/staging/r8188eu/include/rtw_xmit.h     | 2 --
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 4 ----
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 1319a7fce8b3..8211b858573f 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -194,9 +194,6 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 	pxmitpriv->txirp_cnt = 1;
 
-	/* per AC pending irp */
-	pxmitpriv->voq_cnt = 0;
-
 	pxmitpriv->ack_tx = false;
 	mutex_init(&pxmitpriv->ack_tx_mutex);
 	rtw_sctx_init(&pxmitpriv->ack_tx_ops, 0);
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 71a7fb33b0d0..7e6cf745d913 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -281,8 +281,6 @@ struct	xmit_priv {
 				 * 1->vi, 2->be, 3->bk. */
 	u8		txirp_cnt;/*  */
 	struct tasklet_struct xmit_tasklet;
-	/* per AC pending irp */
-	int voq_cnt;
 	struct __queue free_xmitbuf_queue;
 	struct __queue pending_xmitbuf_queue;
 	u8 *pallocated_xmitbuf;
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 7929b7d5e89e..6fe5a4230291 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -42,9 +42,6 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 	struct xmit_priv	*pxmitpriv = &padapter->xmitpriv;
 
 	switch (pxmitbuf->flags) {
-	case VO_QUEUE_INX:
-		pxmitpriv->voq_cnt--;
-		break;
 	case HIGH_QUEUE_INX:
 		rtw_chk_hi_queue_cmd(padapter);
 		break;
@@ -106,7 +103,6 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 
 	switch (addr) {
 	case VO_QUEUE_INX:
-		pxmitpriv->voq_cnt++;
 		pxmitbuf->flags = VO_QUEUE_INX;
 		break;
 	case VI_QUEUE_INX:
-- 
2.30.2

