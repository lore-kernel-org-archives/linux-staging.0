Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CAE8816
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:54:05 +0000 (UTC)
Received: from ipservice-092-217-089-134.092.217.pools.vodafone-ip.de ([92.217.89.134] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pK3pI-0000Lk-Pl; Mon, 23 Jan 2023 21:54:00 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/23] staging: r8188eu: remove an obsolete comment
Date: Mon, 23 Jan 2023 21:53:26 +0100
Message-Id: <20230123205342.229589-8-martin@kaiser.cx>
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

Remove an obsolete comment in rtw_dequeue_xframe. There is no break
statement any more.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 30bc9405356d..a431bffbccf2 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1408,7 +1408,7 @@ struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmi
 				phwxmit->accnt--;
 
 				/* Remove sta node when there are no pending packets. */
-				if (list_empty(&pframe_queue->queue)) /* must be done after get_next and before break */
+				if (list_empty(&pframe_queue->queue))
 					list_del_init(&ptxservq->tx_pending);
 				goto exit;
 			}
-- 
2.30.2

