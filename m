Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DB6880A
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:57:35 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pS-0000Lk-Rp; Mon, 23 Jan 2023 21:54:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 20/23] staging: r8188eu: remove rtw_xmitframe_enqueue
Date: Mon, 23 Jan 2023 21:53:39 +0100
Message-Id: <20230123205342.229589-21-martin@kaiser.cx>
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

The rtw_xmitframe_enqueue function is only one line. We can remove it and
call rtw_xmit_classifier directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c      | 5 -----
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 2 +-
 drivers/staging/r8188eu/include/rtw_xmit.h   | 2 --
 3 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 4f9defdbe257..3752d4fddd11 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1345,11 +1345,6 @@ void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pfram
 	spin_unlock_bh(&pframequeue->lock);
 }
 
-s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe)
-{
-	return rtw_xmit_classifier(padapter, pxmitframe);
-}
-
 struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmit *phwxmit_i)
 {
 	struct hw_xmit *phwxmit;
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index e067cc271686..18557738dbad 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -596,7 +596,7 @@ static s32 pre_xmitframe(struct adapter *adapt, struct xmit_frame *pxmitframe)
 	return true;
 
 enqueue:
-	res = rtw_xmitframe_enqueue(adapt, pxmitframe);
+	res = rtw_xmit_classifier(adapt, pxmitframe);
 	spin_unlock_bh(&pxmitpriv->lock);
 
 	if (res != _SUCCESS) {
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 30f8000120b2..4aa7833487c8 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -320,8 +320,6 @@ void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv,
 			      struct __queue *pframequeue);
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter,
 				     struct sta_info *psta, int up, u8 *ac);
-s32 rtw_xmitframe_enqueue(struct adapter *padapter,
-			  struct xmit_frame *pxmitframe);
 struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv,
 				      struct hw_xmit *phwxmit_i);
 
-- 
2.30.2

