Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677E74C96
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:19 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmk-0004rR-Po; Fri, 30 Dec 2022 19:07:14 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 11/20] staging: r8188eu: clean up qos_option setting
Date: Fri, 30 Dec 2022 19:06:37 +0100
Message-Id: <20221230180646.91008-12-martin@kaiser.cx>
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

The qos_option variable in function rtw_make_wlanhdr should be a boolean
as it's set to true or false. We can directly set it to
pqospriv->qos_option instead of using a default value and if statements.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6e3b5649b84c..0fef508408a7 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -791,7 +791,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	struct ieee80211_hdr *pwlanhdr = (struct ieee80211_hdr *)hdr;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
-	u8 qos_option = false;
+	bool qos_option;
 	__le16 *fctrl = &pwlanhdr->frame_control;
 
 	struct sta_info *psta;
@@ -817,26 +817,20 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 		memcpy(pwlanhdr->addr1, get_bssid(pmlmepriv), ETH_ALEN);
 		memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 		memcpy(pwlanhdr->addr3, pattrib->dst, ETH_ALEN);
-
-		if (pqospriv->qos_option)
-			qos_option = true;
+		qos_option = pqospriv->qos_option;
 	} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 		/* to_ds = 0, fr_ds = 1; */
 		SetFrDs(fctrl);
 		memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 		memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
 		memcpy(pwlanhdr->addr3, pattrib->src, ETH_ALEN);
-
-		if (psta->qos_option)
-			qos_option = true;
+		qos_option = psta->qos_option;
 	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
 		   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 		memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 		memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
-
-		if (psta->qos_option)
-			qos_option = true;
+		qos_option = psta->qos_option;
 	} else {
 		return _FAIL;
 	}
-- 
2.30.2

