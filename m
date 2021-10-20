Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1C72
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 19:54:36 +0000 (UTC)
Received: from dslb-188-096-142-022.188.096.pools.vodafone-ip.de ([188.96.142.22] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mdHfV-0007Cd-Ih; Wed, 20 Oct 2021 21:54:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/5] staging: r8188eu: use helper to check for broadcast address
Date: Wed, 20 Oct 2021 21:53:59 +0200
Message-Id: <20211020195401.12931-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020195401.12931-1-martin@kaiser.cx>
References: <20211020195401.12931-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the is_broadcast_ether_addr function to check for a
broadcast address.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ++----
 drivers/staging/r8188eu/hal/odm.c           | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 995a0248c26f..b0dfafe526f7 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -392,13 +392,12 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 
 static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, struct recv_frame *precv_frame)
 {
-	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	u8 *pframe = precv_frame->rx_data;
 
 	if (ptable->func) {
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
 		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    memcmp(GetAddr1Ptr(pframe), bc_addr, ETH_ALEN))
+		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
 			return;
 		ptable->func(padapter, precv_frame);
 	}
@@ -409,7 +408,6 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 	int index;
 	struct mlme_handler *ptable;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	u8 *pframe = precv_frame->rx_data;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
 
@@ -418,7 +416,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
 	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-	    memcmp(GetAddr1Ptr(pframe), bc_addr, ETH_ALEN))
+	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
 		return;
 
 	ptable = mlme_sta_tbl;
diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 67cf8f7baba5..21f115194df8 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -829,7 +829,6 @@ void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
 	u8	sta_cnt = 0;
 	u32 PWDB_rssi[NUM_STA] = {0};/* 0~15]:MACID, [16~31]:PWDB_rssi */
 	struct sta_info *psta;
-	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
 		return;
@@ -841,7 +840,7 @@ void odm_RSSIMonitorCheck(struct odm_dm_struct *pDM_Odm)
 		psta = pDM_Odm->pODM_StaInfo[i];
 		if (IS_STA_VALID(psta) &&
 		    (psta->state & WIFI_ASOC_STATE) &&
-		    memcmp(psta->hwaddr, bcast_addr, ETH_ALEN) &&
+		    !is_broadcast_ether_addr(psta->hwaddr) &&
 		    memcmp(psta->hwaddr, myid(&Adapter->eeprompriv), ETH_ALEN)) {
 			if (psta->rssi_stat.UndecoratedSmoothedPWDB < tmpEntryMinPWDB)
 				tmpEntryMinPWDB = psta->rssi_stat.UndecoratedSmoothedPWDB;
-- 
2.20.1

