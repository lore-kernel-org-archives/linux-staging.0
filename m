Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB77F
	for <linux-staging@lists.linux.dev>; Sun,  6 Nov 2022 12:49:17 +0000 (UTC)
Received: from ipservice-092-217-068-220.092.217.pools.vodafone-ip.de ([92.217.68.220] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1orf5O-0008Dj-AB; Sun, 06 Nov 2022 13:49:14 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 8/9] staging: r8188eu: merge two rtw_free_network_nolock functions
Date: Sun,  6 Nov 2022 13:49:00 +0100
Message-Id: <20221106124901.720785-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221106124901.720785-1-martin@kaiser.cx>
References: <20221106124901.720785-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the _rtw_free_network_nolock function and merge it into
rtw_free_network_nolock, which is its only caller.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 23 ++++++++--------------
 drivers/staging/r8188eu/include/rtw_mlme.h |  2 --
 2 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index a47ae33454b3..b272123626ac 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -76,19 +76,6 @@ void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 	spin_unlock_bh(&free_queue->lock);
 }
 
-void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
-{
-	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
-
-	if (!pnetwork)
-		return;
-	if (pnetwork->fixed)
-		return;
-	list_del_init(&pnetwork->list);
-	list_add_tail(&pnetwork->list, get_list_head(free_queue));
-	pmlmepriv->num_of_scanned--;
-}
-
 /*
 	return the wlan_network with the matching addr
 
@@ -307,9 +294,15 @@ struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv)
 static void rtw_free_network_nolock(struct mlme_priv *pmlmepriv,
 				    struct wlan_network *pnetwork)
 {
+	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 
-	_rtw_free_network_nolock(pmlmepriv, pnetwork);
-
+	if (!pnetwork)
+		return;
+	if (pnetwork->fixed)
+		return;
+	list_del_init(&pnetwork->list);
+	list_add_tail(&pnetwork->list, get_list_head(free_queue));
+	pmlmepriv->num_of_scanned--;
 }
 
 void rtw_free_network_queue(struct adapter *dev, u8 isfreeall)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 268f898b151b..3ff653ff1d81 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -539,8 +539,6 @@ struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv);
 
 void _rtw_free_network(struct mlme_priv *pmlmepriv,
 		       struct wlan_network *pnetwork, u8 isfreeall);
-void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv,
-			      struct wlan_network *pnetwork);
 
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr);
 
-- 
2.30.2

