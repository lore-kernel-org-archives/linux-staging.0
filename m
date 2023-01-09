Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA715221
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 21:29:09 +0000 (UTC)
Received: from dslb-188-096-147-178.188.096.pools.vodafone-ip.de ([188.96.147.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pEzhY-0007iD-Lx; Mon, 09 Jan 2023 22:29:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 01/12] staging: r8188eu: beq_cnt is write-only
Date: Mon,  9 Jan 2023 22:28:41 +0100
Message-Id: <20230109212852.75612-2-martin@kaiser.cx>
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

beq_cnt in struct xmit_priv is initialised, incremented and decremented
but never read. Remove beq_cnt and resulting dead code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c        | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h     | 1 -
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 4 ----
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index d224785a747b..e5ac49441337 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -195,7 +195,6 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	pxmitpriv->txirp_cnt = 1;
 
 	/* per AC pending irp */
-	pxmitpriv->beq_cnt = 0;
 	pxmitpriv->bkq_cnt = 0;
 	pxmitpriv->viq_cnt = 0;
 	pxmitpriv->voq_cnt = 0;
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index f8f10c67b764..c84f73f2cc59 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -282,7 +282,6 @@ struct	xmit_priv {
 	u8		txirp_cnt;/*  */
 	struct tasklet_struct xmit_tasklet;
 	/* per AC pending irp */
-	int beq_cnt;
 	int bkq_cnt;
 	int viq_cnt;
 	int voq_cnt;
diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 220e592b757c..067b7def2bde 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -48,9 +48,6 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 	case VI_QUEUE_INX:
 		pxmitpriv->viq_cnt--;
 		break;
-	case BE_QUEUE_INX:
-		pxmitpriv->beq_cnt--;
-		break;
 	case BK_QUEUE_INX:
 		pxmitpriv->bkq_cnt--;
 		break;
@@ -123,7 +120,6 @@ u32 rtw_write_port(struct adapter *padapter, u32 addr, u32 cnt, u8 *wmem)
 		pxmitbuf->flags = VI_QUEUE_INX;
 		break;
 	case BE_QUEUE_INX:
-		pxmitpriv->beq_cnt++;
 		pxmitbuf->flags = BE_QUEUE_INX;
 		break;
 	case BK_QUEUE_INX:
-- 
2.30.2

