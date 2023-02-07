Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7867485
	for <linux-staging@lists.linux.dev>; Tue,  7 Feb 2023 19:23:33 +0000 (UTC)
Received: from dslb-178-004-202-208.178.004.pools.vodafone-ip.de ([178.4.202.208] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pPTYu-0002XK-MJ; Tue, 07 Feb 2023 20:23:29 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/7] staging: r8188eu: simplify rtw_alloc_xmitframe
Date: Tue,  7 Feb 2023 20:23:14 +0100
Message-Id: <20230207192319.294203-3-martin@kaiser.cx>
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

Make the rtw_alloc_xmitframe function a bit simpler.

The container_of() call never returns NULL. The if (pxframe) check is
false only if pfree_xmit_queue is empty. Handle this special case
explicitly and save one level of indentation.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 40 +++++++++++--------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 4d6210d89533..6ec342b726f9 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1256,38 +1256,32 @@ struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv)/* _queue *pf
 
 	spin_lock_bh(&pfree_xmit_queue->lock);
 
-	if (list_empty(&pfree_xmit_queue->queue)) {
-		pxframe =  NULL;
-	} else {
-		phead = get_list_head(pfree_xmit_queue);
-
-		plist = phead->next;
+	if (list_empty(&pfree_xmit_queue->queue))
+		goto out;
 
-		pxframe = container_of(plist, struct xmit_frame, list);
-
-		list_del_init(&pxframe->list);
-	}
+	phead = get_list_head(pfree_xmit_queue);
+	plist = phead->next;
+	pxframe = container_of(plist, struct xmit_frame, list);
+	list_del_init(&pxframe->list);
 
-	if (pxframe) { /* default value setting */
-		pxmitpriv->free_xmitframe_cnt--;
+	pxmitpriv->free_xmitframe_cnt--;
 
-		pxframe->buf_addr = NULL;
-		pxframe->pxmitbuf = NULL;
+	pxframe->buf_addr = NULL;
+	pxframe->pxmitbuf = NULL;
 
-		memset(&pxframe->attrib, 0, sizeof(struct pkt_attrib));
-		/* pxframe->attrib.psta = NULL; */
+	memset(&pxframe->attrib, 0, sizeof(struct pkt_attrib));
+	/* pxframe->attrib.psta = NULL; */
 
-		pxframe->frame_tag = DATA_FRAMETAG;
+	pxframe->frame_tag = DATA_FRAMETAG;
 
-		pxframe->pkt = NULL;
-		pxframe->pkt_offset = 1;/* default use pkt_offset to fill tx desc */
+	pxframe->pkt = NULL;
+	pxframe->pkt_offset = 1;/* default use pkt_offset to fill tx desc */
 
-		pxframe->agg_num = 1;
-		pxframe->ack_report = 0;
-	}
+	pxframe->agg_num = 1;
+	pxframe->ack_report = 0;
 
+out:
 	spin_unlock_bh(&pfree_xmit_queue->lock);
-
 	return pxframe;
 }
 
-- 
2.30.2

