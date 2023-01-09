Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4D5231
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 21:29:10 +0000 (UTC)
Received: from dslb-188-096-147-178.188.096.pools.vodafone-ip.de ([188.96.147.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEzhZ-0007iD-HN; Mon, 09 Jan 2023 22:29:05 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 02/12] staging: r8188eu: bkq_cnt is write-only
Date: Mon,  9 Jan 2023 22:28:42 +0100
Message-Id: <20230109212852.75612-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109212852.75612-1-martin@kaiser.cx>
References: <20230108185738.597105-1-martin@kaiser.cx>
 <20230109212852.75612-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bkq_cnt in struct xmit_priv is initialised, incremented and decremented
but never read. Remove bkq_cnt and resulting dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c        | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h     | 1 -
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 4 ----
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index e5ac49441337..875675656d11 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -195,7 +195,6 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->txirp_cnt = 1;
 
 	/* per AC pending irp */
-	pxmitpriv->bkq_cnt = 0;
 	pxmitpriv->viq_cnt = 0;
 	pxmitpriv->voq_cnt = 0;
 
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index c84f73f2cc59..3d56c3afaf7d 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -282,7 +282,6 @@ struct	xmit_priv {
 	u8		txirp_cnt;/*  */
 	struct tasklet_struct xmit_tasklet;
 	/* per AC pending irp */
-	int bkq_cnt;
 	int viq_cnt;
 	int voq_cnt;
 	struct __queue free_xmitbuf_queue;
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 067b7def2bde..5ae09edf9174 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -48,9 +48,6 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 	case VI_QUEUE_INX:
 		pxmitpriv->viq_cnt--;
 		break;
-	case BK_QUEUE_INX:
-		pxmitpriv->bkq_cnt--;
-		break;
 	case HIGH_QUEUE_INX:
 		rtw_chk_hi_queue_cmd(padapter);
 		break;
@@ -123,7 +120,6 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 		pxmitbuf->flags = BE_QUEUE_INX;
 		break;
 	case BK_QUEUE_INX:
-		pxmitpriv->bkq_cnt++;
 		pxmitbuf->flags = BK_QUEUE_INX;
 		break;
 	case HIGH_QUEUE_INX:
-- 
2.30.2

