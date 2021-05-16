Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C30870
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 16:07:38 +0000 (UTC)
Received: from dslb-094-219-038-078.094.219.pools.vodafone-ip.de ([94.219.38.78] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1liJIk-0003Vl-3b; Sun, 16 May 2021 18:07:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/6] staging: rtl8188eu: use safe iterator in rtw_free_xmitframe_queue
Date: Sun, 16 May 2021 18:06:13 +0200
Message-Id: <20210516160613.30489-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210516160613.30489-1-martin@kaiser.cx>
References: <20210516160613.30489-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use list_for_each_safe, we may delete list items while iterating over
the list.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
compile-tested only

 drivers/staging/rtl8188eu/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index 3763d188b892..62b8f178280e 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -1329,13 +1329,13 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 
 void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue)
 {
-	struct list_head *plist, *phead;
+	struct list_head *plist, *phead, *temp;
 	struct	xmit_frame	*pxmitframe;
 
 	spin_lock_bh(&pframequeue->lock);
 
 	phead = get_list_head(pframequeue);
-	list_for_each(plist, phead) {
+	list_for_each_safe(plist, temp, phead) {
 		pxmitframe = list_entry(plist, struct xmit_frame, list);
 
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
-- 
2.20.1

