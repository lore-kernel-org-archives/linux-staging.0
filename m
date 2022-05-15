Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E544A57
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 15:54:15 +0000 (UTC)
Received: from dslb-188-096-141-066.188.096.pools.vodafone-ip.de ([188.96.141.66] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nqGZO-0006NT-V4; Sun, 15 May 2022 17:54:11 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: assoc_rsp and assoc_rsp_len are not used
Date: Sun, 15 May 2022 17:54:01 +0200
Message-Id: <20220515155401.352742-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220515155401.352742-1-martin@kaiser.cx>
References: <20220515155401.352742-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The assoc_rsp buffer in struct mlme_priv is not used. There's no need to
store an incoming association response after receiving an processing it.

Remove the buffer pointer and its length from struct mlme_priv.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme.c     | 1 -
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ------
 drivers/staging/r8188eu/include/rtw_mlme.h  | 2 --
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index c44e636d2c05..5a815642c3f6 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -40,7 +40,6 @@ static void rtw_free_mlme_ie_data(u8 **ppie, u32 *plen)
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 {
 	kfree(pmlmepriv->assoc_req);
-	kfree(pmlmepriv->assoc_rsp);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_beacon_ie, &pmlmepriv->wps_beacon_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_req_ie, &pmlmepriv->wps_probe_req_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->wps_probe_resp_ie, &pmlmepriv->wps_probe_resp_ie_len);
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 65330baa5a73..faf23fc950c5 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1272,7 +1272,6 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	int res;
 	unsigned short	status;
 	struct ndis_802_11_var_ie *pIE;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	/* struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network); */
@@ -1343,11 +1342,6 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	UpdateBrateTbl(padapter, pmlmeinfo->network.SupportedRates);
 
 report_assoc_result:
-	if (res > 0)
-		rtw_buf_update(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len, pframe, pkt_len);
-	else
-		kfree(pmlmepriv->assoc_rsp);
-
 	report_join_res(padapter, res);
 
 	return _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 95c23bf1139d..d81668498e46 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -363,8 +363,6 @@ struct mlme_priv {
 
 	u8 *assoc_req;
 	u32 assoc_req_len;
-	u8 *assoc_rsp;
-	u32 assoc_rsp_len;
 
 	/* Number of associated Non-ERP stations (i.e., stations using 802.11b
 	 * in 802.11g BSS) */
-- 
2.30.2

