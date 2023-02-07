Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91225747F
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:23:42 +0000 (UTC)
Received: from dslb-178-004-202-208.178.004.pools.vodafone-ip.de ([178.4.202.208] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pPTZ3-0002XK-08; Tue, 07 Feb 2023 20:23:37 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/7] staging: r8188eu: simplify xmit_buf flags
Date: Tue,  7 Feb 2023 20:23:17 +0100
Message-Id: <20230207192319.294203-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230207192319.294203-1-martin@kaiser.cx>
References: <20230207192319.294203-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_write_port stores a queue index in pxmitbuf->flags before submitting
an urb. The urb completion function reads the flags. All it needs is the
info if the high queue was used or not.

We can replace the flags with a boolean high_queue variable.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c       |  2 +-
 drivers/staging/r8188eu/include/rtw_xmit.h    |  2 +-
 .../staging/r8188eu/os_dep/usb_ops_linux.c    | 25 ++-----------------
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6ec342b726f9..df88b3e29e77 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -148,7 +148,7 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 				goto free_xmitbuf;
 		}
 
-		pxmitbuf->flags = XMIT_VO_QUEUE;
+		pxmitbuf->high_queue = false;
 
 		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmitbuf_queue.queue);
 		pxmitbuf++;
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 9a001fbf45a0..feeac85aedb0 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -189,7 +189,7 @@ struct xmit_buf {
 	u8 *pbuf;
 	void *priv_data;
 	u16 ext_tag; /*  0: Normal xmitbuf, 1: extension xmitbuf. */
-	u16 flags;
+	bool high_queue;
 	u32 alloc_sz;
 	u32  len;
 	struct submit_ctx *sctx;
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 48c96f731ce1..ca09f7ed7e4d 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -39,7 +39,7 @@ static void usb_write_port_complete(struct urb *purb)
 	struct adapter *padapter = pxmitbuf->padapter;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	if (pxmitbuf->flags == HIGH_QUEUE_INX)
+	if (pxmitbuf->high_queue)
 		rtw_chk_hi_queue_cmd(padapter);
 
 	switch (purb->status) {
@@ -83,28 +83,7 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 	}
 
 	spin_lock_irqsave(&pxmitpriv->lock, irqL);
-
-	switch (addr) {
-	case VO_QUEUE_INX:
-		pxmitbuf->flags = VO_QUEUE_INX;
-		break;
-	case VI_QUEUE_INX:
-		pxmitbuf->flags = VI_QUEUE_INX;
-		break;
-	case BE_QUEUE_INX:
-		pxmitbuf->flags = BE_QUEUE_INX;
-		break;
-	case BK_QUEUE_INX:
-		pxmitbuf->flags = BK_QUEUE_INX;
-		break;
-	case HIGH_QUEUE_INX:
-		pxmitbuf->flags = HIGH_QUEUE_INX;
-		break;
-	default:
-		pxmitbuf->flags = MGT_QUEUE_INX;
-		break;
-	}
-
+	pxmitbuf->high_queue = (addr == HIGH_QUEUE_INX);
 	spin_unlock_irqrestore(&pxmitpriv->lock, irqL);
 
 	purb	= pxmitbuf->pxmit_urb;
-- 
2.30.2

