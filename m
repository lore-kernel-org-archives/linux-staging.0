Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241798817
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:04 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pH-0000Lk-7J; Mon, 23 Jan 2023 21:53:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/23] staging: r8188eu: simplify the sta loop in rtw_dequeue_xframe
Date: Mon, 23 Jan 2023 21:53:24 +0100
Message-Id: <20230123205342.229589-6-martin@kaiser.cx>
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

Use list_for_each_entry_safe to iterate over the station entries in
function rtw_dequeue_xframe instead of coding the loop manually.

We have to use the safe version, the loop body may remove a station from
the list over which we iterate.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 5f2426be6c11..b07a1ce21a38 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1377,9 +1377,9 @@ static struct xmit_frame *dequeue_one_xmitframe(struct xmit_priv *pxmitpriv, str
 
 struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmit *phwxmit_i)
 {
-	struct list_head *sta_plist, *sta_phead;
+	struct list_head *sta_phead;
 	struct hw_xmit *phwxmit;
-	struct tx_servq *ptxservq = NULL;
+	struct tx_servq *ptxservq, *tmp_txservq;
 	struct __queue *pframe_queue = NULL;
 	struct xmit_frame *pxmitframe = NULL;
 	struct adapter *padapter = pxmitpriv->adapter;
@@ -1401,10 +1401,8 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 		phwxmit = phwxmit_i + inx[i];
 
 		sta_phead = get_list_head(phwxmit->sta_queue);
-		sta_plist = sta_phead->next;
 
-		while (sta_phead != sta_plist) {
-			ptxservq = container_of(sta_plist, struct tx_servq, tx_pending);
+		list_for_each_entry_safe(ptxservq, tmp_txservq, sta_phead, tx_pending) {
 
 			pframe_queue = &ptxservq->sta_pending;
 
@@ -1418,8 +1416,6 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 					list_del_init(&ptxservq->tx_pending);
 				goto exit;
 			}
-
-			sta_plist = sta_plist->next;
 		}
 	}
 exit:
-- 
2.30.2

