Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D37880A
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:57:18 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pV-0000Lk-Kt; Mon, 23 Jan 2023 21:54:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 23/23] staging: r8188eu: merge rtw_free_hwxmits into its only caller
Date: Mon, 23 Jan 2023 21:53:42 +0100
Message-Id: <20230123205342.229589-24-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123205342.229589-1-martin@kaiser.cx>
References: <20230123205342.229589-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_free_hwxmits is called only by _rtw_free_xmit_priv. We can merge the
two functions and make the code a bit shorter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 11 +----------
 drivers/staging/r8188eu/include/rtw_xmit.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 3752d4fddd11..f50e10f0d51f 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -281,7 +281,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 
 	vfree(pxmitpriv->pallocated_xmit_extbuf);
 
-	rtw_free_hwxmits(padapter);
+	kfree(pxmitpriv->hwxmits);
 
 	mutex_destroy(&pxmitpriv->ack_tx_mutex);
 }
@@ -1475,15 +1475,6 @@ int rtw_alloc_hwxmits(struct adapter *padapter)
 	return 0;
 }
 
-void rtw_free_hwxmits(struct adapter *padapter)
-{
-	struct hw_xmit *hwxmits;
-	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-
-	hwxmits = pxmitpriv->hwxmits;
-	kfree(hwxmits);
-}
-
 static int rtw_br_client_tx(struct adapter *padapter, struct sk_buff **pskb)
 {
 	struct sk_buff *skb = *pskb;
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 33c3031de2c4..d8808e68f778 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -328,7 +328,6 @@ s32 rtw_txframes_sta_ac_pending(struct adapter *padapter,
 int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter);
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv);
 int rtw_alloc_hwxmits(struct adapter *padapter);
-void rtw_free_hwxmits(struct adapter *padapter);
 s32 rtw_xmit(struct adapter *padapter, struct sk_buff **pkt);
 
 int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe);
-- 
2.30.2

