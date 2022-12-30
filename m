Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386464C96
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:17 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmh-0004rR-H7; Fri, 30 Dec 2022 19:07:11 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/20] staging: r8188eu: remove rtl8188eu_init_xmit_priv
Date: Fri, 30 Dec 2022 19:06:33 +0100
Message-Id: <20221230180646.91008-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230180646.91008-1-martin@kaiser.cx>
References: <20221230180646.91008-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8188eu_init_xmit_priv's only jobs is to initialise the xmit tasklet.

Remove rtl8188eu_init_xmit_priv and initialise the xmit tasklet in
_rtw_init_xmit_priv. Yet again, this makes the code a tiny bit smaller.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c         |  2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 10 ----------
 drivers/staging/r8188eu/include/rtl8188e_xmit.h |  1 -
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 35d291d78c60..62b66a205a06 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -211,7 +211,7 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	mutex_init(&pxmitpriv->ack_tx_mutex);
 	rtw_sctx_init(&pxmitpriv->ack_tx_ops, 0);
 
-	rtl8188eu_init_xmit_priv(padapter);
+	tasklet_init(&pxmitpriv->xmit_tasklet, rtl8188eu_xmit_tasklet, (unsigned long)padapter);
 
 	return 0;
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index cca74cf28915..cf9779b86b9c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -9,16 +9,6 @@
 #include "../include/usb_ops.h"
 #include "../include/rtl8188e_hal.h"
 
-s32	rtl8188eu_init_xmit_priv(struct adapter *adapt)
-{
-	struct xmit_priv	*pxmitpriv = &adapt->xmitpriv;
-
-	tasklet_init(&pxmitpriv->xmit_tasklet,
-		     rtl8188eu_xmit_tasklet,
-		     (unsigned long)adapt);
-	return _SUCCESS;
-}
-
 static void rtl8188eu_cal_txdesc_chksum(struct tx_desc	*ptxdesc)
 {
 	u16	*usptr = (u16 *)ptxdesc;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_xmit.h b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
index 865468d6b922..82439f52b0c8 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_xmit.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_xmit.h
@@ -131,7 +131,6 @@ struct txrpt_ccx_88e {
 
 void rtl8188e_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc,
 			       u32 BufferLen, u8 IsPsPoll, u8 IsBTQosNull);
-s32 rtl8188eu_init_xmit_priv(struct adapter *padapter);
 s32 rtl8188eu_hal_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_mgnt_xmit(struct adapter *padapter, struct xmit_frame *frame);
 s32 rtl8188eu_xmit_buf_handler(struct adapter *padapter);
-- 
2.30.2

