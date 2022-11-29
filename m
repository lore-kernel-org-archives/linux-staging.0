Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB684BA45
	for <linux-staging@lists.linux.dev>; Tue, 29 Nov 2022 20:52:23 +0000 (UTC)
Received: from dslb-188-104-061-001.188.104.pools.vodafone-ip.de ([188.104.61.1] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p07aU-0001pO-QO; Tue, 29 Nov 2022 21:52:18 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: simplify err handling for unknown station
Date: Tue, 29 Nov 2022 21:51:52 +0100
Message-Id: <20221129205152.128172-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221129205152.128172-1-martin@kaiser.cx>
References: <20221129205152.128172-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we receive a disassoc message from an unknown station, we can drop this
message immediately. Reorder the code to make this clearer.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index d5c9eb52fb0e..49e0b50b1243 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1435,6 +1435,7 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 	struct sta_info *psta;
 	struct sta_priv *pstapriv = &padapter->stapriv;
+	u8 updated = 0;
 
 	if (memcmp(mgmt->bssid, get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
 		return;
@@ -1453,19 +1454,18 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 	}
 
 	psta = rtw_get_stainfo(pstapriv, mgmt->sa);
-	if (psta) {
-		u8 updated = 0;
-
-		spin_lock_bh(&pstapriv->asoc_list_lock);
-		if (!list_empty(&psta->asoc_list)) {
-			list_del_init(&psta->asoc_list);
-			pstapriv->asoc_list_cnt--;
-			updated = ap_free_sta(padapter, psta, false, reason);
-		}
-		spin_unlock_bh(&pstapriv->asoc_list_lock);
+	if (!psta)
+		return;
 
-		associated_clients_update(padapter, updated);
+	spin_lock_bh(&pstapriv->asoc_list_lock);
+	if (!list_empty(&psta->asoc_list)) {
+		list_del_init(&psta->asoc_list);
+		pstapriv->asoc_list_cnt--;
+		updated = ap_free_sta(padapter, psta, false, reason);
 	}
+	spin_unlock_bh(&pstapriv->asoc_list_lock);
+
+	associated_clients_update(padapter, updated);
 }
 
 static void OnAction_back(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.30.2

