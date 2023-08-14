Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340299476
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 10:57:01 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RPWVF2LmZz2BdNj;
	Mon, 14 Aug 2023 18:53:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 14 Aug
 2023 18:56:52 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <linux-staging@lists.linux.dev>, <gregkh@linuxfoundation.org>,
	<hdegoede@redhat.com>, <eperi1024@gmail.com>, <zeming@nfschina.com>,
	<yangyingliang@huawei.com>, <tegongkang@gmail.com>, <namcaov@gmail.com>,
	<straube.linux@gmail.com>, <hi@atinb.me>, <anupnewsmail@gmail.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] staging: rtl8723bs: Use helpers to check broadcast and multicast Ether addresses
Date: Mon, 14 Aug 2023 18:56:22 +0800
Message-ID: <20230814105623.292541-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

Use is_multicast_ether_addr() and is_broadcast_ether_addr()
instead of custom macro IS_MCAST() and MacAddr_isBcst(), the buffer
is properly aligned.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 24 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_security.c |  8 +++----
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 12 +++++-----
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  2 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  4 ++--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 +-
 drivers/staging/rtl8723bs/include/wifi.h      | 15 ------------
 drivers/staging/rtl8723bs/os_dep/recv_linux.c |  2 +-
 10 files changed, 29 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b59d510956b0..b221913733fb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2512,7 +2512,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct sta_info *psta;
 	struct ht_priv *phtpriv;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
-	s32 bmcst = IS_MCAST(pattrib->ra);
+	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
 	/* if (bmcst || (padapter->mlmepriv.LinkDetectInfo.bTxBusyTraffic == false)) */
 	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7be11dc3d725..0eadc23a7d54 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -317,7 +317,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 	if (prxattrib->encrypt == _TKIP_) {
 		/* calculate mic code */
 		if (stainfo) {
-			if (IS_MCAST(prxattrib->ra)) {
+			if (is_multicast_ether_addr(prxattrib->ra)) {
 				/* mickey =&psecuritypriv->dot118021XGrprxmickey.skey[0]; */
 				/* iv = precvframe->u.hdr.rx_data+prxattrib->hdrlen; */
 				/* rxdata_key_idx =(((iv[3])>>6)&0x3) ; */
@@ -352,18 +352,18 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			if (bmic_err == true) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((IS_MCAST(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
-					rtw_handle_tkip_mic_err(adapter, (u8)IS_MCAST(prxattrib->ra));
+					rtw_handle_tkip_mic_err(adapter, (u8)is_multicast_ether_addr(prxattrib->ra));
 
 				res = _FAIL;
 
 			} else {
 				/* mic checked ok */
 				if (!psecuritypriv->bcheck_grpkey &&
-				    IS_MCAST(prxattrib->ra))
+				    is_multicast_ether_addr(prxattrib->ra))
 					psecuritypriv->bcheck_grpkey = true;
 			}
 		}
@@ -625,7 +625,7 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 
 	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
 
-	if ((!MacAddr_isBcst(pattrib->dst)) && (!IS_MCAST(pattrib->dst)))
+	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
 		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
 
 	if (sta)
@@ -654,7 +654,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	u8 *mybssid  = get_bssid(pmlmepriv);
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	u8 *sta_addr = NULL;
-	signed int bmcast = IS_MCAST(pattrib->dst);
+	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
 		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
@@ -690,7 +690,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
 		if (bmcast) {
 			/*  For AP mode, if DA == MCAST, then BSSID should be also MCAST */
-			if (!IS_MCAST(pattrib->bssid)) {
+			if (!is_multicast_ether_addr(pattrib->bssid)) {
 				ret = _FAIL;
 				goto exit;
 			}
@@ -741,7 +741,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	u8 *mybssid  = get_bssid(pmlmepriv);
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
-	signed int bmcast = IS_MCAST(pattrib->dst);
+	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
 	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) &&
 	    (check_fwstate(pmlmepriv, _FW_LINKED) == true ||
@@ -1329,7 +1329,7 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	}
 
 	if (pattrib->privacy) {
-		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, IS_MCAST(pattrib->ra));
+		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, is_multicast_ether_addr(pattrib->ra));
 
 		SET_ICE_IV_LEN(pattrib->iv_len, pattrib->icv_len, pattrib->encrypt);
 	} else {
@@ -1354,7 +1354,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    adapter->securitypriv.binstallBIPkey == true) {
 		/* unicast management frame decrypt */
-		if (pattrib->privacy && !(IS_MCAST(GetAddr1Ptr(ptr))) &&
+		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
 			u8 *mgmt_DATA;
 			u32 data_len = 0;
@@ -1381,7 +1381,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			kfree(mgmt_DATA);
 			if (!precv_frame)
 				goto validate_80211w_fail;
-		} else if (IS_MCAST(GetAddr1Ptr(ptr)) &&
+		} else if (is_multicast_ether_addr(GetAddr1Ptr(ptr)) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC)) {
 			signed int BIP_ret = _SUCCESS;
 			/* verify BIP MME IE of broadcast/multicast de-auth/disassoc packet */
@@ -2041,7 +2041,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
-			!IS_MCAST(prxattrib->ra) && prxattrib->encrypt > 0 &&
+			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
 			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ac731415f733..7ecdaa2eeaf3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -486,7 +486,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	if (pattrib->encrypt == _TKIP_) {
 
 		{
-			if (IS_MCAST(pattrib->ra))
+			if (is_multicast_ether_addr(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 			else
 				prwskey = pattrib->dot118021x_UncstKey.skey;
@@ -554,7 +554,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt == _TKIP_) {
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
 		if (stainfo) {
-			if (IS_MCAST(prxattrib->ra)) {
+			if (is_multicast_ether_addr(prxattrib->ra)) {
 				static unsigned long start;
 				static u32 no_gkey_bc_cnt;
 				static u32 no_gkey_mc_cnt;
@@ -1051,7 +1051,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _AES_) {
-		if (IS_MCAST(pattrib->ra))
+		if (is_multicast_ether_addr(pattrib->ra))
 			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 		else
 			prwskey = pattrib->dot118021x_UncstKey.skey;
@@ -1305,7 +1305,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt == _AES_) {
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
 		if (stainfo) {
-			if (IS_MCAST(prxattrib->ra)) {
+			if (is_multicast_ether_addr(prxattrib->ra)) {
 				static unsigned long start;
 				static u32 no_gkey_bc_cnt;
 				static u32 no_gkey_mc_cnt;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index c7de81f21bec..1593980d2c6a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -471,7 +471,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 	if (!hwaddr)
 		return NULL;
 
-	if (IS_MCAST(hwaddr))
+	if (is_multicast_ether_addr(hwaddr))
 		addr = bc_addr;
 	else
 		addr = hwaddr;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index a22512633d1b..b1965ec0181f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -473,7 +473,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	signed int bmcast = IS_MCAST(pattrib->ra);
+	signed int bmcast = is_multicast_ether_addr(pattrib->ra);
 
 	memset(pattrib->dot118021x_UncstKey.skey,  0, 16);
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
@@ -691,7 +691,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	else if (pattrib->dhcp_pkt == 1)
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_SPECIAL_PACKET, 1);
 
-	bmcast = IS_MCAST(pattrib->ra);
+	bmcast = is_multicast_ether_addr(pattrib->ra);
 
 	/*  get sta_info */
 	if (bmcast) {
@@ -765,7 +765,7 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
 	u8 hw_hdr_offset = 0;
-	signed int bmcst = IS_MCAST(pattrib->ra);
+	signed int bmcst = is_multicast_ether_addr(pattrib->ra);
 
 	hw_hdr_offset = TXDESC_OFFSET;
 
@@ -1035,7 +1035,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	u8 *pbuf_start;
 
-	s32 bmcst = IS_MCAST(pattrib->ra);
+	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 	s32 res = _SUCCESS;
 
 	if (!pxmitframe->buf_addr)
@@ -1143,7 +1143,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	u8 subtype;
 	struct sta_info *psta = NULL;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
-	s32 bmcst = IS_MCAST(pattrib->ra);
+	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 	u8 *BIP_AAD = NULL;
 	u8 *MGMT_body = NULL;
 
@@ -2016,7 +2016,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	signed int bmcst = IS_MCAST(pattrib->ra);
+	signed int bmcst = is_multicast_ether_addr(pattrib->ra);
 	bool update_tim = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == false)
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 6bb0ff8d7c78..7e3db8d3c910 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -217,7 +217,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
 
 	if (padapter->securitypriv.binstallBIPkey == true) {
-		if (IS_MCAST(pmgntframe->attrib.ra)) {
+		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
 			/* pmgntframe->attrib.bswenc = true; */
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 31f65d817899..ea3b4cd32360 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -429,7 +429,7 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 		PSTA_INFO_T pstat = pDM_Odm->pODM_StaInfo[i];
 
 		if (IS_STA_VALID(pstat)) {
-			if (IS_MCAST(pstat->hwaddr))  /* if (psta->mac_id == 1) */
+			if (is_multicast_ether_addr(pstat->hwaddr))  /* if (psta->mac_id == 1) */
 				continue;
 
 			if (true == ODM_RAStateCheck(pDM_Odm, pstat->rssi_stat.UndecoratedSmoothedPWDB, false, &pstat->rssi_level)) {
@@ -576,7 +576,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 		for (i = 0; i < ODM_ASSOCIATE_ENTRY_NUM; i++) {
 			psta = pDM_Odm->pODM_StaInfo[i];
 			if (IS_STA_VALID(psta)) {
-				if (IS_MCAST(psta->hwaddr))  /* if (psta->mac_id == 1) */
+				if (is_multicast_ether_addr(psta->hwaddr))  /* if (psta->mac_id == 1) */
 					continue;
 
 				if (psta->rssi_stat.UndecoratedSmoothedPWDB == (-1))
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1e9e1089032b..c5219a4a4919 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2609,7 +2609,7 @@ static void rtl8723b_fill_default_txdesc(
 	pmlmeinfo = &(pmlmeext->mlmext_info);
 
 	pattrib = &pxmitframe->attrib;
-	bmcst = IS_MCAST(pattrib->ra);
+	bmcst = is_multicast_ether_addr(pattrib->ra);
 
 	ptxdesc = (struct txdesc_8723b *)pbuf;
 
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index f03e26818d45..53f9411fcc4c 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -211,21 +211,6 @@ enum {
 
 #define GetAddr4Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 24))
 
-#define MacAddr_isBcst(addr) \
-	(\
-	((addr[0] == 0xff) && (addr[1] == 0xff) && \
-	(addr[2] == 0xff) && (addr[3] == 0xff) && \
-	(addr[4] == 0xff) && (addr[5] == 0xff))  ? true : false \
-)
-
-static inline int IS_MCAST(unsigned char *da)
-{
-	if ((*da) & 0x01)
-		return true;
-	else
-		return false;
-}
-
 static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
 	unsigned char *ra;
diff --git a/drivers/staging/rtl8723bs/os_dep/recv_linux.c b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
index 88a69c7ca8f2..4d28b300b235 100644
--- a/drivers/staging/rtl8723bs/os_dep/recv_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/recv_linux.c
@@ -101,7 +101,7 @@ void rtw_os_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt, str
 			struct sk_buff *pskb2 = NULL;
 			struct sta_info *psta = NULL;
 			struct sta_priv *pstapriv = &padapter->stapriv;
-			int bmcast = IS_MCAST(pattrib->dst);
+			int bmcast = is_multicast_ether_addr(pattrib->dst);
 
 			if (memcmp(pattrib->dst, myid(&padapter->eeprompriv), ETH_ALEN)) {
 				if (bmcast) {
-- 
2.34.1

