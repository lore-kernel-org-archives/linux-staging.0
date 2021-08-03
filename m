Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4B2FB3
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 20:15:28 +0000 (UTC)
Received: from dslb-188-104-062-095.188.104.pools.vodafone-ip.de ([188.104.62.95] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mB0ov-0007wl-Vw; Tue, 03 Aug 2021 22:15:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/6] staging: r8188eu: remove RT_TRACE prints from recv_linux.c
Date: Tue,  3 Aug 2021 22:15:09 +0200
Message-Id: <20210803201511.29000-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803201511.29000-1-martin@kaiser.cx>
References: <20210803201511.29000-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should use the standard mechanism for debug prints. Remove the prints
that use driver-specific macros.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/recv_linux.c | 23 +--------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index 1fd3f1bf1fe5..8dfabdb02494 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -118,21 +118,8 @@ int rtw_recv_indicatepkt(struct adapter *padapter,
 	pfree_recv_queue = &(precvpriv->free_recv_queue);
 
 	skb = precv_frame->pkt;
-	if (!skb) {
-		RT_TRACE(_module_recv_osdep_c_, _drv_err_,
-			 ("rtw_recv_indicatepkt():skb == NULL something wrong!!!!\n"));
+	if (!skb)
 		goto _recv_indicatepkt_drop;
-	}
-
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_,
-		 ("rtw_recv_indicatepkt():skb != NULL !!!\n"));
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_,
-		 ("rtw_recv_indicatepkt():precv_frame->rx_head =%p  precv_frame->hdr.rx_data =%p\n",
-		 precv_frame->rx_head, precv_frame->rx_data));
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_,
-		 ("precv_frame->hdr.rx_tail =%p precv_frame->rx_end =%p precv_frame->hdr.len =%d\n",
-		 precv_frame->rx_tail, precv_frame->rx_end,
-		 precv_frame->len));
 
 	skb->data = precv_frame->rx_data;
 
@@ -140,11 +127,6 @@ int rtw_recv_indicatepkt(struct adapter *padapter,
 
 	skb->len = precv_frame->len;
 
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_,
-		 ("skb->head =%p skb->data =%p skb->tail =%p skb->end =%p skb->len =%d\n",
-		 skb->head, skb->data, skb_tail_pointer(skb),
-		 skb_end_pointer(skb), skb->len));
-
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		struct sk_buff *pskb2 = NULL;
 		struct sta_info *psta = NULL;
@@ -195,9 +177,6 @@ int rtw_recv_indicatepkt(struct adapter *padapter,
 
 	rtw_free_recvframe(precv_frame, pfree_recv_queue);
 
-	RT_TRACE(_module_recv_osdep_c_, _drv_info_,
-		 ("\n rtw_recv_indicatepkt :after netif_rx!!!!\n"));
-
 	return _SUCCESS;
 
 _recv_indicatepkt_drop:
-- 
2.20.1

