Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94A94C95
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:25 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmq-0004rR-Dq; Fri, 30 Dec 2022 19:07:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 18/20] staging: r8188eu: phwxmit parameter is unused
Date: Fri, 30 Dec 2022 19:06:44 +0100
Message-Id: <20221230180646.91008-19-martin@kaiser.cx>
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

Remove the unused function parameter phwxmit from function
dequeue_one_xmitframe.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index eb47d8276eec..347f06f48a37 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1399,7 +1399,7 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-static struct xmit_frame *dequeue_one_xmitframe(struct xmit_priv *pxmitpriv, struct hw_xmit *phwxmit, struct tx_servq *ptxservq, struct __queue *pframe_queue)
+static struct xmit_frame *dequeue_one_xmitframe(struct xmit_priv *pxmitpriv, struct tx_servq *ptxservq, struct __queue *pframe_queue)
 {
 	struct list_head *xmitframe_plist, *xmitframe_phead;
 	struct	xmit_frame	*pxmitframe = NULL;
@@ -1452,7 +1452,7 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 
 			pframe_queue = &ptxservq->sta_pending;
 
-			pxmitframe = dequeue_one_xmitframe(pxmitpriv, phwxmit, ptxservq, pframe_queue);
+			pxmitframe = dequeue_one_xmitframe(pxmitpriv, ptxservq, pframe_queue);
 
 			if (pxmitframe) {
 				phwxmit->accnt--;
-- 
2.30.2

