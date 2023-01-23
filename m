Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896A38817
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:08 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pM-0000Lk-1E; Mon, 23 Jan 2023 21:54:04 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/23] staging: r8188eu: simplify dequeue_one_xmitframe
Date: Mon, 23 Jan 2023 21:53:30 +0100
Message-Id: <20230123205342.229589-12-martin@kaiser.cx>
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

Revert the if condition and exit immediately if the list of xmitframes
is empty. Hopefully, this makes the code a little bit simpler.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 334d75214011..96079d9a6c42 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1358,16 +1358,16 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 static struct xmit_frame *dequeue_one_xmitframe(struct tx_servq *ptxservq, struct __queue *pframe_queue)
 {
 	struct list_head *xmitframe_plist, *xmitframe_phead;
-	struct	xmit_frame	*pxmitframe = NULL;
+	struct xmit_frame *pxmitframe;
 
 	xmitframe_phead = get_list_head(pframe_queue);
-	xmitframe_plist = xmitframe_phead->next;
+	if (list_empty(xmitframe_phead))
+		return NULL;
 
-	if (!list_empty(xmitframe_phead)) {
-		pxmitframe = container_of(xmitframe_plist, struct xmit_frame, list);
-		list_del_init(&pxmitframe->list);
-		ptxservq->qcnt--;
-	}
+	xmitframe_plist = xmitframe_phead->next;
+	pxmitframe = container_of(xmitframe_plist, struct xmit_frame, list);
+	list_del_init(&pxmitframe->list);
+	ptxservq->qcnt--;
 	return pxmitframe;
 }
 
-- 
2.30.2

