Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCD570
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 16:59:25 +0000 (UTC)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lpZdr-0002hw-UQ; Sat, 05 Jun 2021 18:59:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/9] staging: rtl8188eu: make rtw_free_recvframe return void
Date: Sat,  5 Jun 2021 18:58:53 +0200
Message-Id: <20210605165858.3175-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

None of the callers checks the return value of rtw_free_recvframe.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_recv.c    | 8 +++-----
 drivers/staging/rtl8188eu/include/rtw_recv.h | 3 +--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_recv.c b/drivers/staging/rtl8188eu/core/rtw_recv.c
index e79cfdd4bf90..c20141638b73 100644
--- a/drivers/staging/rtl8188eu/core/rtw_recv.c
+++ b/drivers/staging/rtl8188eu/core/rtw_recv.c
@@ -114,11 +114,11 @@ struct recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 	return precvframe;
 }
 
-int rtw_free_recvframe(struct recv_frame *precvframe,
-		       struct __queue *pfree_recv_queue)
+void rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv_queue)
 {
 	if (!precvframe)
-		return _FAIL;
+		return;
+
 	if (precvframe->pkt) {
 		dev_kfree_skb_any(precvframe->pkt);/* free skb by driver */
 		precvframe->pkt = NULL;
@@ -131,8 +131,6 @@ int rtw_free_recvframe(struct recv_frame *precvframe,
 	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
 
 	spin_unlock_bh(&pfree_recv_queue->lock);
-
-	return _SUCCESS;
 }
 
 int _rtw_enqueue_recvframe(struct recv_frame *precvframe, struct __queue *queue)
diff --git a/drivers/staging/rtl8188eu/include/rtw_recv.h b/drivers/staging/rtl8188eu/include/rtw_recv.h
index e20bab41708a..8c906b666b62 100644
--- a/drivers/staging/rtl8188eu/include/rtw_recv.h
+++ b/drivers/staging/rtl8188eu/include/rtw_recv.h
@@ -231,8 +231,7 @@ struct recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);
 struct recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);
 void rtw_init_recvframe(struct recv_frame *precvframe,
 			struct recv_priv *precvpriv);
-int  rtw_free_recvframe(struct recv_frame *precvframe,
-			struct __queue *pfree_recv_queue);
+void rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv_queue);
 #define rtw_dequeue_recvframe(queue) rtw_alloc_recvframe(queue)
 int _rtw_enqueue_recvframe(struct recv_frame *precvframe,
 			   struct __queue *queue);
-- 
2.20.1

