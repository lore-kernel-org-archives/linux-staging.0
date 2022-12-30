Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96CA4C96
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:25 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmr-0004rR-91; Fri, 30 Dec 2022 19:07:21 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 19/20] staging: r8188eu: rtw_init_hwxmits is not needed
Date: Fri, 30 Dec 2022 19:06:45 +0100
Message-Id: <20221230180646.91008-20-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230180646.91008-1-martin@kaiser.cx>
References: <20221230180646.91008-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _rtw_init_xmit_priv function calls rtw_alloc_hwxmits to allocate
memory for pxmitpriv->hwxmits (this is an array of struct hw_xmit). This
allocation uses kzalloc, the allocated memory is initialised with 0.

After the allocation, _rtw_init_xmit_priv calls rtw_init_hwxmits to set an
element of each hw_xmit to 0. This is not necessary, we can remove the
rtw_init_hwxmits call and the now unused function rtw_init_hwxmits.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 10 ----------
 drivers/staging/r8188eu/include/rtw_xmit.h |  1 -
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 347f06f48a37..76b0839ca19d 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -189,8 +189,6 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	if (rtw_alloc_hwxmits(padapter))
 		goto free_xmit_extbuf;
 
-	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
-
 	for (i = 0; i < 4; i++)
 		pxmitpriv->wmm_para_seq[i] = i;
 
@@ -1570,14 +1568,6 @@ void rtw_free_hwxmits(struct adapter *padapter)
 	kfree(hwxmits);
 }
 
-void rtw_init_hwxmits(struct hw_xmit *phwxmit, int entry)
-{
-	int i;
-
-	for (i = 0; i < entry; i++, phwxmit++)
-		phwxmit->accnt = 0;
-}
-
 static int rtw_br_client_tx(struct adapter *padapter, struct sk_buff **pskb)
 {
 	struct sk_buff *skb = *pskb;
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 719424dd8a49..eafa693efc2f 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -345,7 +345,6 @@ void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv);
 s32 rtw_txframes_pending(struct adapter *padapter);
 s32 rtw_txframes_sta_ac_pending(struct adapter *padapter,
 				struct pkt_attrib *pattrib);
-void rtw_init_hwxmits(struct hw_xmit *phwxmit, int entry);
 int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter);
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv);
 int rtw_alloc_hwxmits(struct adapter *padapter);
-- 
2.30.2

