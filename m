Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3876A20E0
	for <linux-staging@lists.linux.dev>; Sat, 15 Oct 2022 15:24:57 +0000 (UTC)
Received: from ipservice-092-217-066-135.092.217.pools.vodafone-ip.de ([92.217.66.135] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ojj1x-000722-Ra; Sat, 15 Oct 2022 17:24:53 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/9] staging: r8188eu: exit for deauth from unknown station
Date: Sat, 15 Oct 2022 17:24:37 +0200
Message-Id: <20221015152440.232281-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221015152440.232281-1-martin@kaiser.cx>
References: <20221015152440.232281-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we receive a deauth message from an unknown station, we can drop this
message and exit immediately. Reorder the code to make this clearer, don't
wrap everything in an if statement.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 22 ++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 742976c38cd5..40df0f9982f4 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1477,21 +1477,21 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
+		u8 updated = 0;
 
 		psta = rtw_get_stainfo(pstapriv, mgmt->sa);
-		if (psta) {
-			u8 updated = 0;
-
-			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (!list_empty(&psta->asoc_list)) {
-				list_del_init(&psta->asoc_list);
-				pstapriv->asoc_list_cnt--;
-				updated = ap_free_sta(padapter, psta, false, reason);
-			}
-			spin_unlock_bh(&pstapriv->asoc_list_lock);
+		if (!psta)
+			return _SUCCESS;
 
-			associated_clients_update(padapter, updated);
+		spin_lock_bh(&pstapriv->asoc_list_lock);
+		if (!list_empty(&psta->asoc_list)) {
+			list_del_init(&psta->asoc_list);
+			pstapriv->asoc_list_cnt--;
+			updated = ap_free_sta(padapter, psta, false, reason);
 		}
+		spin_unlock_bh(&pstapriv->asoc_list_lock);
+
+		associated_clients_update(padapter, updated);
 
 		return _SUCCESS;
 	} else {
-- 
2.30.2

