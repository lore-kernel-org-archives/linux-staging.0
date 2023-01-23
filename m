Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CCD8818
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:13 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pP-0000Lk-NC; Mon, 23 Jan 2023 21:54:07 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 16/23] staging: r8188eu: use list_head for xmitframe list
Date: Mon, 23 Jan 2023 21:53:35 +0100
Message-Id: <20230123205342.229589-17-martin@kaiser.cx>
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

The r8188eu driver defines a struct __queue that contains a list_head and
a spinlock.

struct tx_servq describes a station for which we have pending tx packets.
This struct contains a __queue for the pending packets (a __queue of
struct xmit_frame entries). In this particular case, the queue's spinlock
is not used, we need only the list_head.

rtw_dequeue_xframe uses a local variable for such an xmit_frame queue.
This patch replaces this variable with a list_head.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 79a1999ca809..6060a1832431 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1355,15 +1355,14 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-static struct xmit_frame *dequeue_one_xmitframe(struct __queue *pframe_queue)
+static struct xmit_frame *dequeue_one_xmitframe(struct list_head *xframe_list)
 {
-	struct list_head *xmitframe_phead = get_list_head(pframe_queue);
 	struct xmit_frame *pxmitframe;
 
-	if (list_empty(xmitframe_phead))
+	if (list_empty(xframe_list))
 		return NULL;
 
-	pxmitframe = container_of(xmitframe_phead->next, struct xmit_frame, list);
+	pxmitframe = container_of(xframe_list->next, struct xmit_frame, list);
 	list_del_init(&pxmitframe->list);
 	return pxmitframe;
 }
@@ -1373,7 +1372,7 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 	struct list_head *sta_phead;
 	struct hw_xmit *phwxmit;
 	struct tx_servq *ptxservq, *tmp_txservq;
-	struct __queue *pframe_queue = NULL;
+	struct list_head *xframe_list;
 	struct xmit_frame *pxmitframe = NULL;
 	struct adapter *padapter = pxmitpriv->adapter;
 	struct registry_priv	*pregpriv = &padapter->registrypriv;
@@ -1393,16 +1392,15 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 
 		list_for_each_entry_safe(ptxservq, tmp_txservq, sta_phead, tx_pending) {
 
-			pframe_queue = &ptxservq->sta_pending;
-
-			pxmitframe = dequeue_one_xmitframe(pframe_queue);
+			xframe_list = get_list_head(&ptxservq->sta_pending);
+			pxmitframe = dequeue_one_xmitframe(xframe_list);
 
 			if (pxmitframe) {
 				phwxmit->accnt--;
 				ptxservq->qcnt--;
 
 				/* Remove sta node when there are no pending packets. */
-				if (list_empty(&pframe_queue->queue))
+				if (list_empty(xframe_list))
 					list_del_init(&ptxservq->tx_pending);
 				goto exit;
 			}
-- 
2.30.2

