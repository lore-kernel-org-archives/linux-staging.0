Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20B179E0
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 19:53:30 +0000 (UTC)
Received: from dslb-188-097-040-029.188.097.pools.vodafone-ip.de ([188.97.40.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pMaDP-0007S2-VE; Mon, 30 Jan 2023 20:53:20 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/9] staging: r8188eu: use kernel helper to iterate over a list
Date: Mon, 30 Jan 2023 20:52:59 +0100
Message-Id: <20230130195303.138941-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230130195303.138941-1-martin@kaiser.cx>
References: <20230130195303.138941-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_free_xmitframe_list iterates over the list of xmit_frames and frees
each entry. We can use list_for_each_entry_safe instead of coding this
manually. We need the _safe version as the current pxmitframe will be
removed from the list by rtw_free_xmitframe.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 24cf11e7b4bc..c2b1e6f1d358 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -1327,18 +1327,10 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 
 void rtw_free_xmitframe_list(struct xmit_priv *pxmitpriv, struct list_head *xframe_list)
 {
-	struct list_head *plist;
-	struct	xmit_frame	*pxmitframe;
-
-	plist = xframe_list->next;
-
-	while (xframe_list != plist) {
-		pxmitframe = container_of(plist, struct xmit_frame, list);
-
-		plist = plist->next;
+	struct	xmit_frame *pxmitframe, *tmp_xmitframe;
 
+	list_for_each_entry_safe(pxmitframe, tmp_xmitframe, xframe_list, list)
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
-	}
 }
 
 struct xmit_frame *rtw_dequeue_xframe(struct xmit_priv *pxmitpriv, struct hw_xmit *phwxmit_i)
-- 
2.30.2

