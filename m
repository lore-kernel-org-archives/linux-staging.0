Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B3F880A
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:13 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pQ-0000Lk-HU; Mon, 23 Jan 2023 21:54:08 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 17/23] staging: r8188eu: merge dequeue_one_xmitframe into its caller
Date: Mon, 23 Jan 2023 21:53:36 +0100
Message-Id: <20230123205342.229589-18-martin@kaiser.cx>
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

dequeue_one_xmitframe is a small function that is called only from
rtw_dequeue_xframe. Merge the two functions.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 34 +++++++++----------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6060a1832431..cb0d8346ac10 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1355,18 +1355,6 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-static struct xmit_frame *dequeue_one_xmitframe(struct list_head *xframe_list)
-{
-	struct xmit_frame *pxmitframe;
-
-	if (list_empty(xframe_list))
-		return NULL;
-
-	pxmitframe = container_of(xframe_list->next, struct xmit_frame, list);
-	list_del_init(&pxmitframe->list);
-	return pxmitframe;
-}
-
 struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmit *phwxmit_i)
 {
 	struct list_head *sta_phead;
@@ -1391,19 +1379,21 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 		sta_phead = get_list_head(phwxmit->sta_queue);
 
 		list_for_each_entry_safe(ptxservq, tmp_txservq, sta_phead, tx_pending) {
-
 			xframe_list = get_list_head(&ptxservq->sta_pending);
-			pxmitframe = dequeue_one_xmitframe(xframe_list);
+			if (list_empty(xframe_list))
+				continue;
 
-			if (pxmitframe) {
-				phwxmit->accnt--;
-				ptxservq->qcnt--;
+			pxmitframe = container_of(xframe_list->next, struct xmit_frame, list);
+			list_del_init(&pxmitframe->list);
 
-				/* Remove sta node when there are no pending packets. */
-				if (list_empty(xframe_list))
-					list_del_init(&ptxservq->tx_pending);
-				goto exit;
-			}
+			phwxmit->accnt--;
+			ptxservq->qcnt--;
+
+			/* Remove sta node when there are no pending packets. */
+			if (list_empty(xframe_list))
+				list_del_init(&ptxservq->tx_pending);
+
+			goto exit;
 		}
 	}
 exit:
-- 
2.30.2

