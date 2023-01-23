Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD168816
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:11 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pO-0000Lk-80; Mon, 23 Jan 2023 21:54:06 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 14/23] staging: r8188eu: decrement qcnt in rtw_dequeue_xframe
Date: Mon, 23 Jan 2023 21:53:33 +0100
Message-Id: <20230123205342.229589-15-martin@kaiser.cx>
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

rtw_dequeue_xframe calls dequeue_one_xmitframe and passes a struct
tx_servq. The only use for this parameter is to decrement its qcnt if an
xmit_frame could be extracted.

It makes more sense to remove the struct tx_servq parameter from
dequeue_one_xmitframe and decrement qcnt in the calling function when
dequeue_one_xmitframe returns success, i.e. when an xmit_frame was
extracted.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 96079d9a6c42..7802a34ebcfd 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1355,7 +1355,7 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-static struct xmit_frame *dequeue_one_xmitframe(struct tx_servq *ptxservq, struct __queue *pframe_queue)
+static struct xmit_frame *dequeue_one_xmitframe(struct __queue *pframe_queue)
 {
 	struct list_head *xmitframe_plist, *xmitframe_phead;
 	struct xmit_frame *pxmitframe;
@@ -1367,7 +1367,6 @@ static struct xmit_frame *dequeue_one_xmitframe(struct tx_servq *ptxservq, struc
 	xmitframe_plist = xmitframe_phead->next;
 	pxmitframe = container_of(xmitframe_plist, struct xmit_frame, list);
 	list_del_init(&pxmitframe->list);
-	ptxservq->qcnt--;
 	return pxmitframe;
 }
 
@@ -1398,10 +1397,11 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 
 			pframe_queue = &ptxservq->sta_pending;
 
-			pxmitframe = dequeue_one_xmitframe(ptxservq, pframe_queue);
+			pxmitframe = dequeue_one_xmitframe(pframe_queue);
 
 			if (pxmitframe) {
 				phwxmit->accnt--;
+				ptxservq->qcnt--;
 
 				/* Remove sta node when there are no pending packets. */
 				if (list_empty(&pframe_queue->queue))
-- 
2.30.2

