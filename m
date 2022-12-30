Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDA64C96
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:21 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmn-0004rR-6j; Fri, 30 Dec 2022 19:07:17 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 14/20] staging: r8188eu: bm_pending is not used
Date: Fri, 30 Dec 2022 19:06:40 +0100
Message-Id: <20221230180646.91008-15-martin@kaiser.cx>
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

The bm_pending queue in struct xmit_priv is initialised but not used. It
can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 1 -
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index bf4bb1e66985..a3dccfa4d843 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -81,7 +81,6 @@ int _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	rtw_init_queue(&pxmitpriv->bk_pending);
 	rtw_init_queue(&pxmitpriv->vi_pending);
 	rtw_init_queue(&pxmitpriv->vo_pending);
-	rtw_init_queue(&pxmitpriv->bm_pending);
 
 	rtw_init_queue(&pxmitpriv->free_xmit_queue);
 
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 1c4fbdf97a12..83638dede6e7 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -262,7 +262,6 @@ struct	xmit_priv {
 	struct __queue bk_pending;
 	struct __queue vi_pending;
 	struct __queue vo_pending;
-	struct __queue bm_pending;
 	u8 *pallocated_frame_buf;
 	u8 *pxmit_frame_buf;
 	uint free_xmitframe_cnt;
-- 
2.30.2

