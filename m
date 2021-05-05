Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B6472
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 20:27:00 +0000 (UTC)
Received: from dslb-188-104-057-152.188.104.pools.vodafone-ip.de ([188.104.57.152] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1leO6k-0003aS-DI; Wed, 05 May 2021 22:26:58 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/6] staging: rtl8188eu: remove nic_hdl from struct mlme_priv
Date: Wed,  5 May 2021 22:26:21 +0200
Message-Id: <20210505202622.11087-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505202622.11087-1-martin@kaiser.cx>
References: <20210505202622.11087-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct mlme_priv is an element of struct adapter. Use container_of
to get a pointer to the enclosing struct.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/core/rtw_mlme.c    | 5 +----
 drivers/staging/rtl8188eu/include/rtw_mlme.h | 2 --
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index b6ac5b8915b1..e19091a2a4b8 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -32,8 +32,6 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 
 	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
 
-	pmlmepriv->nic_hdl = (u8 *)padapter;
-
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = 0;
 	pmlmepriv->cur_network.network.InfrastructureMode = Ndis802_11AutoUnknown;
@@ -1456,7 +1454,7 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
 	int ret;
 	struct list_head *phead;
-	struct adapter *adapter;
+	struct adapter *adapter = container_of(pmlmepriv, struct adapter, mlmepriv);
 	struct __queue *queue = &pmlmepriv->scanned_queue;
 	struct wlan_network *pnetwork = NULL;
 	struct wlan_network *candidate = NULL;
@@ -1464,7 +1462,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 
 	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 	phead = get_list_head(queue);
-	adapter = (struct adapter *)pmlmepriv->nic_hdl;
 	pmlmepriv->pscanned = phead->next;
 	while (phead != pmlmepriv->pscanned) {
 		pnetwork = container_of(pmlmepriv->pscanned, struct wlan_network, list);
diff --git a/drivers/staging/rtl8188eu/include/rtw_mlme.h b/drivers/staging/rtl8188eu/include/rtw_mlme.h
index 1b74b32b8a81..f5e805c13442 100644
--- a/drivers/staging/rtl8188eu/include/rtw_mlme.h
+++ b/drivers/staging/rtl8188eu/include/rtw_mlme.h
@@ -111,8 +111,6 @@ struct mlme_priv {
 	u8 to_join; /* flag */
 	u8 to_roaming; /*  roaming trying times */
 
-	u8 *nic_hdl;
-
 	struct list_head *pscanned;
 	struct __queue free_bss_pool;
 	struct __queue scanned_queue;
-- 
2.20.1

