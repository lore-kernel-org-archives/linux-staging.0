Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A16199252
	for <linux-staging@lists.linux.dev>; Mon,  4 Aug 2025 01:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754271686; cv=none; b=HInloghE4ez52FxJTQpxmTGfYB6A2h+/Kvgb8pKvXHjtjDoG51fw/MnDzTblJW3rrdbeMfTdGFyAuQCQTRv/7gNcCaoaAWneXnFdSHaOpzVjdpNvPk4NWG2elGYqPL60tFYmB4LWVPhJTB0a90BwOrqII2S7DRugl2xfVy1o+YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754271686; c=relaxed/simple;
	bh=VSDT3TqhF1Ww6YDYtNaEBddMniIMc7rPHgEt4oH4VLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pQKE/PH9/Pfdta/drERPx3MDSFW6zT3TlLr8bPoOMdxdCbTlK5Jcmj9KuO1vWIVBa1eGLwOuyruCeTrhxXvmgJtL6aqnrU1xDwy1SwKTGbznFxiF9kMUHzo7eumg8PD9EFayhDalXPR9/MQKULGjdbwgyNULzPgyU/wx/7kZYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=forfebx6; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="forfebx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=QTuvy1dX80BDyPo0YU6yPdrxcU2QxNz26HJ9MbmK0WU=;
	b=forfebx609MTXPiU3aux+EL5BlVH9qhuQblnRblTRxAwf4gPAsjdx9Q+aR5uXs
	VWnO7MGfEA7Ke9DtHedBwaMSWnNi1ok6GI0fdZjCSVt41wwl9hkY8A2ZHjV4LGZU
	K7fG4iQCdO5M7HQtWq0rnVNEvGf3kax5ncFlFxt5yHQv0=
Received: from lizhuoheng-virtual-machine.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCnnqmAD5Bo2e5eJg--.34348S2;
	Mon, 04 Aug 2025 09:40:17 +0800 (CST)
From: 15620332615@163.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	samuel.ogbuji@linux.dev,
	hansg@kernel.org,
	pkshih@realtek.com,
	rperis@google.com,
	andy@kernel.org,
	vivk.balachandran@gmail.com,
	dan.carpenter@linaro.org,
	=?UTF-8?q?=E6=9D=8E=E5=8D=93=E7=8F=A9?= <lizhuoheng@kylinos.cn>
Subject: [PATCH] staging: rtl8723bs: fix 'no space before tabs' coding style issues
Date: Mon,  4 Aug 2025 09:40:13 +0800
Message-Id: <20250804014013.12899-1-15620332615@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnnqmAD5Bo2e5eJg--.34348S2
X-Coremail-Antispam: 1Uf129KBjvAXoWkWF1xWF1DXw1rKr4xZrWfuFg_yoWDGr43Go
	WfKws09a1xGw17J3yDtr18JF42939293y3Kw47twnxWa1aga15Z3yYqw45J3Z5XFyDKFZa
	qa4Ut34DXrWvyrs7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3fHUUUUUU
X-CM-SenderInfo: 5o2kikywsqjjiswrkqqrwthudrp/1tbiJw2dLmiNYyETNwABsb

From: 李卓珩 <lizhuoheng@kylinos.cn>

Signed-off-by: 李卓珩 <lizhuoheng@kylinos.cn>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  24 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 112 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   8 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  26 ++--
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 116 +++++++++---------
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  42 +++----
 drivers/staging/rtl8723bs/hal/hal_com.c       |   6 +-
 drivers/staging/rtl8723bs/hal/odm.h           |  10 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |   4 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   4 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  44 +++----
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  10 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   2 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  60 ++++-----
 .../staging/rtl8723bs/include/HalPwrSeqCmd.h  |   8 +-
 drivers/staging/rtl8723bs/include/HalVerDef.h |   2 +-
 .../staging/rtl8723bs/include/basic_types.h   |  16 +--
 drivers/staging/rtl8723bs/include/drv_types.h |   4 +-
 drivers/staging/rtl8723bs/include/hal_com.h   |  10 +-
 .../rtl8723bs/include/hal_com_phycfg.h        |  12 +-
 .../staging/rtl8723bs/include/hal_com_reg.h   |  56 ++++-----
 drivers/staging/rtl8723bs/include/hal_data.h  |  24 ++--
 drivers/staging/rtl8723bs/include/hal_phy.h   |   6 +-
 .../staging/rtl8723bs/include/rtl8723b_xmit.h |   2 +-
 .../staging/rtl8723bs/include/rtw_eeprom.h    |   6 +-
 drivers/staging/rtl8723bs/include/rtw_efuse.h |   2 +-
 drivers/staging/rtl8723bs/include/rtw_io.h    |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  10 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  22 ++--
 drivers/staging/rtl8723bs/include/rtw_recv.h  |   4 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |   2 +-
 drivers/staging/rtl8723bs/include/wifi.h      |  58 ++++-----
 32 files changed, 357 insertions(+), 357 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 692d0c2b766d..139a1065280c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -569,9 +569,9 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 
 /* select the desired network based on the capability of the (i)bss. */
 /*  check items: (1) security */
-/* 			   (2) network_type */
-/* 			   (3) WMM */
-/* 			   (4) HT */
+/*			   (2) network_type */
+/*			   (3) WMM */
+/*			   (4) HT */
 /*                      (5) others */
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
@@ -1843,7 +1843,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	u8 keylen;
 	struct cmd_obj		*pcmd;
 	struct setkey_parm	*psetkeyparm;
-	struct cmd_priv 	*pcmdpriv = &adapter->cmdpriv;
+	struct cmd_priv	*pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
 	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
@@ -1948,8 +1948,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-/* 		-1		:if there is no pre-auth key in the  table */
-/* 		>= 0		:if there is pre-auth key, and   return the entry id */
+/*		-1		:if there is no pre-auth key in the  table */
+/*		>= 0		:if there is pre-auth key, and   return the entry id */
 /*  */
 /*  */
 
@@ -2099,7 +2099,7 @@ void rtw_joinbss_reset(struct adapter *padapter)
 	u8 threshold;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 
 	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
 
@@ -2125,8 +2125,8 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 void rtw_ht_use_default_setting(struct adapter *padapter)
 {
-	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	bool		bHwLDPCSupport = false, bHwSTBCSupport = false;
 	bool		bHwSupportBeamformer = false, bHwSupportBeamformee = false;
@@ -2200,7 +2200,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	phtpriv->ht_option = false;
@@ -2321,7 +2321,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	int len;
 	struct ieee80211_ht_cap *pht_capie;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -2443,7 +2443,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	u8 cap_content[8] = {0};
 
 	if (phtpriv->bss_coexist)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bc980d21d50e..5d0461c381d1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -937,10 +937,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char 	*p, *pos, *wpa_ie;
+	unsigned char	*p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int		i, ie_len, wpa_ie_len, left;
-	unsigned char 	supportRate[16];
+	unsigned char	supportRate[16];
 	int					supportRateNum;
 	unsigned short		status = WLAN_STATUS_SUCCESS;
 	unsigned short		frame_type, ie_offset = 0;
@@ -1124,7 +1124,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->flags |= WLAN_STA_WPS;
 			/* wpabuf_free(sta->wps_ie); */
 			/* sta->wps_ie = wpabuf_alloc_copy(elems.wps_ie + 4, */
-			/* 				elems.wps_ie_len - 4); */
+			/*				elems.wps_ie_len - 4); */
 		} else {
 			pstat->flags |= WLAN_STA_MAYBE_WPS;
 		}
@@ -1502,11 +1502,11 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 	}
 
-	/* 	Commented by Albert 20130604 */
-	/* 	Before sending the auth frame to start the STA/GC mode connection with AP/GO, */
-	/* 	we will send the deauth first. */
-	/* 	However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth. */
-	/* 	Added the following code to avoid this case. */
+	/*	Commented by Albert 20130604 */
+	/*	Before sending the auth frame to start the STA/GC mode connection with AP/GO, */
+	/*	we will send the deauth first. */
+	/*	However, the Win8.1 with BRCM Wi-Fi will send the deauth with reason code 6 to us after receieving our deauth. */
+	/*	Added the following code to avoid this case. */
 	if ((pmlmeinfo->state & WIFI_FW_AUTH_STATE) ||
 	    (pmlmeinfo->state & WIFI_FW_ASSOC_STATE)) {
 		if (reason == WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA) {
@@ -1626,8 +1626,8 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	u8 *addr;
 	struct sta_info *psta = NULL;
 	struct recv_reorder_ctrl *preorder_ctrl;
-	unsigned char 	*frame_body;
-	unsigned char 	category, action;
+	unsigned char	*frame_body;
+	unsigned char	category, action;
 	unsigned short	tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
@@ -2259,10 +2259,10 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 {
 	struct xmit_frame			*pmgntframe;
 	struct pkt_attrib			*pattrib;
-	unsigned char 				*pframe;
+	unsigned char				*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	unsigned char 				*mac, *bssid;
+	unsigned char				*mac, *bssid;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 
 	u8 *pwps_ie;
@@ -2456,12 +2456,12 @@ static int _issue_probereq(struct adapter *padapter,
 	int ret = _FAIL;
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
-	unsigned char 		*pframe;
+	unsigned char		*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	unsigned char 		*mac;
-	unsigned char 		bssrate[NumRates];
-	struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv);
+	unsigned char		*mac;
+	unsigned char		bssrate[NumRates];
+	struct xmit_priv	*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	int	bssrate_len = 0;
@@ -2486,11 +2486,11 @@ static int _issue_probereq(struct adapter *padapter,
 	*(fctrl) = 0;
 
 	if (da) {
-		/* 	unicast probe request frame */
+		/*	unicast probe request frame */
 		memcpy(pwlanhdr->addr1, da, ETH_ALEN);
 		memcpy(pwlanhdr->addr3, da, ETH_ALEN);
 	} else {
-		/* 	broadcast probe request frame */
+		/*	broadcast probe request frame */
 		eth_broadcast_addr(pwlanhdr->addr1);
 		eth_broadcast_addr(pwlanhdr->addr3);
 	}
@@ -2584,13 +2584,13 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 {
 	struct xmit_frame			*pmgntframe;
 	struct pkt_attrib			*pattrib;
-	unsigned char 				*pframe;
+	unsigned char				*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
 	unsigned int					val32;
 	unsigned short				val16;
 	int use_shared_key = 0;
-	struct xmit_priv 		*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv		*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	__le16 le_tmp;
@@ -2841,14 +2841,14 @@ void issue_assocreq(struct adapter *padapter)
 	int ret = _FAIL;
 	struct xmit_frame				*pmgntframe;
 	struct pkt_attrib				*pattrib;
-	unsigned char 				*pframe;
+	unsigned char				*pframe;
 	struct ieee80211_hdr			*pwlanhdr;
 	__le16 *fctrl;
 	__le16 val16;
 	unsigned int					i, j, index = 0;
 	unsigned char bssrate[NumRates], sta_bssrate[NumRates];
 	struct ndis_80211_var_ie *pIE;
-	struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv	*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
@@ -3018,7 +3018,7 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	int ret = _FAIL;
 	struct xmit_frame			*pmgntframe;
 	struct pkt_attrib			*pattrib;
-	unsigned char 				*pframe;
+	unsigned char				*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv;
@@ -3163,11 +3163,11 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	int ret = _FAIL;
 	struct xmit_frame			*pmgntframe;
 	struct pkt_attrib			*pattrib;
-	unsigned char 				*pframe;
+	unsigned char				*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
 	u16 *qc;
-	struct xmit_priv 		*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv		*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
@@ -3272,10 +3272,10 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 {
 	struct xmit_frame			*pmgntframe;
 	struct pkt_attrib			*pattrib;
-	unsigned char 				*pframe;
+	unsigned char				*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	struct xmit_priv 		*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv		*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	int ret = _FAIL;
@@ -3366,10 +3366,10 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	u8 category = RTW_WLAN_CATEGORY_SA_QUERY;
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
-	u8 			*pframe;
+	u8			*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv	*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	__le16 le_tmp;
@@ -3439,15 +3439,15 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
-	u8 			*pframe;
+	u8			*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv	*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct sta_info 	*psta;
-	struct sta_priv 	*pstapriv = &padapter->stapriv;
-	struct registry_priv 	*pregpriv = &padapter->registrypriv;
+	struct sta_info	*psta;
+	struct sta_priv	*pstapriv = &padapter->stapriv;
+	struct registry_priv	*pregpriv = &padapter->registrypriv;
 	__le16 le_tmp;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
@@ -3585,11 +3585,11 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	unsigned char category, action;
 	struct xmit_frame			*pmgntframe;
 	struct pkt_attrib			*pattrib;
-	unsigned char 			*pframe;
+	unsigned char			*pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
 	struct	wlan_network	*pnetwork = NULL;
-	struct xmit_priv 		*pxmitpriv = &(padapter->xmitpriv);
+	struct xmit_priv		*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
@@ -3798,7 +3798,7 @@ Following are some utility functions for WiFi MLME
 
 void site_survey(struct adapter *padapter)
 {
-	unsigned char 	survey_channel = 0, val8;
+	unsigned char	survey_channel = 0, val8;
 	enum rt_scan_type	ScanType = SCAN_PASSIVE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
@@ -3867,7 +3867,7 @@ void site_survey(struct adapter *padapter)
 		set_survey_timer(pmlmeext, channel_scan_time_ms);
 	} else {
 
-		/* 	channel number is 0 or this channel is not valid. */
+		/*	channel number is 0 or this channel is not valid. */
 
 		{
 			pmlmeext->sitesurvey_res.state = SCAN_COMPLETE;
@@ -4148,8 +4148,8 @@ void start_clnt_join(struct adapter *padapter)
 		/*  AP may: 1)not response auth or 2)deauth us after link is complete */
 		/*  issue deauth before issuing auth to deal with the situation */
 
-		/* 	Commented by Albert 2012/07/21 */
-		/* 	For the Win8 P2P connection, it will be hard to have a successful connection if this Wi-Fi doesn't connect to it. */
+		/*	Commented by Albert 2012/07/21 */
+		/*	For the Win8 P2P connection, it will be hard to have a successful connection if this Wi-Fi doesn't connect to it. */
 		{
 				/* To avoid connecting to AP fail during resume process, change retry count from 5 to 1 */
 				issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, 1, 100);
@@ -4322,7 +4322,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 					k++;
 				} else if (chplan_sta[i].ChannelNum < chplan_ap.Channel[j]) {
 					chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
-/* 					chplan_new[k].ScanType = chplan_sta[i].ScanType; */
+/*					chplan_new[k].ScanType = chplan_sta[i].ScanType; */
 					chplan_new[k].ScanType = SCAN_PASSIVE;
 					i++;
 					k++;
@@ -4340,7 +4340,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				(chplan_sta[i].ChannelNum <= 14)) {
 
 				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
-/* 				chplan_new[k].ScanType = chplan_sta[i].ScanType; */
+/*				chplan_new[k].ScanType = chplan_sta[i].ScanType; */
 				chplan_new[k].ScanType = SCAN_PASSIVE;
 				i++;
 				k++;
@@ -4460,7 +4460,7 @@ void report_surveydone_event(struct adapter *padapter)
 	u32 cmdsz;
 	struct surveydone_event *psurveydone_evt;
 	struct C2HEvent_Header	*pc2h_evt_hdr;
-	struct mlme_ext_priv 	*pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -4504,7 +4504,7 @@ void report_join_res(struct adapter *padapter, int res)
 	u32 cmdsz;
 	struct joinbss_event		*pjoinbss_evt;
 	struct C2HEvent_Header	*pc2h_evt_hdr;
-	struct mlme_ext_priv 	*pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
@@ -4554,7 +4554,7 @@ void report_wmm_edca_update(struct adapter *padapter)
 	u32 cmdsz;
 	struct wmm_event		*pwmm_event;
 	struct C2HEvent_Header	*pc2h_evt_hdr;
-	struct mlme_ext_priv 	*pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -4600,7 +4600,7 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	int	mac_id;
 	struct stadel_event			*pdel_sta_evt;
 	struct C2HEvent_Header	*pc2h_evt_hdr;
-	struct mlme_ext_priv 	*pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -4651,7 +4651,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	u32 cmdsz;
 	struct stassoc_event		*padd_sta_evt;
 	struct C2HEvent_Header	*pc2h_evt_hdr;
-	struct mlme_ext_priv 	*pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -4755,7 +4755,7 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 static void rtw_mlmeext_disconnect(struct adapter *padapter)
 {
-	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
@@ -4805,7 +4805,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
-	struct sta_priv 	*pstapriv = &padapter->stapriv;
+	struct sta_priv	*pstapriv = &padapter->stapriv;
 	u8 join_type;
 	struct sta_info *psta;
 
@@ -4983,11 +4983,11 @@ static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
 void linked_status_chk(struct adapter *padapter)
 {
 	u32 i;
-	struct sta_info 	*psta;
-	struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv);
+	struct sta_info	*psta;
+	struct xmit_priv	*pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct sta_priv 	*pstapriv = &padapter->stapriv;
+	struct sta_priv	*pstapriv = &padapter->stapriv;
 
 
 	if (is_client_associated_to_ap(padapter)) {
@@ -5091,8 +5091,8 @@ void survey_timer_hdl(struct timer_list *t)
 		timer_container_of(padapter, t, mlmeextpriv.survey_timer);
 	struct cmd_obj	*ph2c;
 	struct sitesurvey_parm	*psurveyPara;
-	struct cmd_priv 				*pcmdpriv = &padapter->cmdpriv;
-	struct mlme_ext_priv 	*pmlmeext = &padapter->mlmeextpriv;
+	struct cmd_priv				*pcmdpriv = &padapter->cmdpriv;
+	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 
 	/* issue rtw_sitesurvey_cmd */
 	if (pmlmeext->sitesurvey_res.state > SCAN_START) {
@@ -5126,10 +5126,10 @@ void link_timer_hdl(struct timer_list *t)
 		timer_container_of(padapter, t, mlmeextpriv.link_timer);
 	/* static unsigned int		rx_pkt = 0; */
 	/* static u64				tx_cnt = 0; */
-	/* struct xmit_priv 	*pxmitpriv = &(padapter->xmitpriv); */
+	/* struct xmit_priv	*pxmitpriv = &(padapter->xmitpriv); */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	/* struct sta_priv 	*pstapriv = &padapter->stapriv; */
+	/* struct sta_priv	*pstapriv = &padapter->stapriv; */
 
 
 	if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 6a2583d0d3eb..1970cb6ed7b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -431,8 +431,8 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 }
 
 /*  */
-/* 	Description: */
-/* 		Enter the leisure power save mode. */
+/*	Description: */
+/*		Enter the leisure power save mode. */
 /*  */
 void LPS_Enter(struct adapter *padapter, const char *msg)
 {
@@ -467,8 +467,8 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 }
 
 /*  */
-/* 	Description: */
-/* 		Leave the leisure power save mode. */
+/*	Description: */
+/*		Leave the leisure power save mode. */
 /*  */
 void LPS_Leave(struct adapter *padapter, const char *msg)
 {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..fde84be96502 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -168,7 +168,7 @@ static void halbtc8723b2ant_LimitedRx(
 	u8 rxAggSize = aggBufSize;
 
 	/*  */
-	/* 	Rx Aggregation related setting */
+	/*	Rx Aggregation related setting */
 	/*  */
 	pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg);
 	/*  decide BT control aggregation buf size or not */
@@ -181,7 +181,7 @@ static void halbtc8723b2ant_LimitedRx(
 
 static void halbtc8723b2ant_QueryBtInfo(struct btc_coexist *pBtCoexist)
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	pCoexSta->bC2hBtInfoReqSent = true;
 
@@ -418,7 +418,7 @@ static void halbtc8723b2ant_SetFwDacSwingLevel(
 	struct btc_coexist *pBtCoexist, u8 dacSwingLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	/*  There are several type of dacswing */
 	/*  0x18/ 0x10/ 0xc/ 0x8/ 0x4/ 0x6 */
@@ -431,7 +431,7 @@ static void halbtc8723b2ant_SetFwDecBtPwr(
 	struct btc_coexist *pBtCoexist, u8 decBtPwrLvl
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	H2C_Parameter[0] = decBtPwrLvl;
 
@@ -505,7 +505,7 @@ static void halbtc8723b2ant_SetSwPenaltyTxRateAdaptive(
 	struct btc_coexist *pBtCoexist, bool bLowPenaltyRa
 )
 {
-	u8 	H2C_Parameter[6] = {0};
+	u8	H2C_Parameter[6] = {0};
 
 	H2C_Parameter[0] = 0x6;	/*  opCode, 0x6 = Retry_Penalty */
 
@@ -746,7 +746,7 @@ static void halbtc8723b2ant_SetFwIgnoreWlanAct(
 	struct btc_coexist *pBtCoexist, bool bEnable
 )
 {
-	u8 	H2C_Parameter[1] = {0};
+	u8	H2C_Parameter[1] = {0};
 
 	if (bEnable)
 		H2C_Parameter[0] |= BIT0;		/*  function enable */
@@ -778,7 +778,7 @@ static void halbtc8723b2ant_SetFwPstdma(
 	u8 byte5
 )
 {
-	u8 	H2C_Parameter[5] = {0};
+	u8	H2C_Parameter[5] = {0};
 
 	H2C_Parameter[0] = byte1;
 	H2C_Parameter[1] = byte2;
@@ -827,7 +827,7 @@ static void halbtc8723b2ant_SetAntPath(
 	u32 fwVer = 0, u4Tmp = 0;
 	bool bPgExtSwitch = false;
 	bool bUseExtSwitch = false;
-	u8 	H2C_Parameter[2] = {0};
+	u8	H2C_Parameter[2] = {0};
 
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_BL_EXT_SWITCH, &bPgExtSwitch);
 	pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_U4_WIFI_FW_VER, &fwVer);	/*  [31:16]=fw ver, [15:0]=fw sub ver */
@@ -2347,9 +2347,9 @@ void EXhalbtc8723b2ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	/*  */
 	/*  S0 or S1 setting and Local register setting(By the setting fw can get ant number, S0/S1, ... info) */
 	/*  Local setting bit define */
-	/* 	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
-	/* 	BIT1: "0" for internal switch; "1" for external switch */
-	/* 	BIT2: "0" for one antenna; "1" for two antenna */
+	/*	BIT0: "0" for no antenna inverse; "1" for antenna inverse */
+	/*	BIT1: "0" for internal switch; "1" for external switch */
+	/*	BIT2: "0" for one antenna; "1" for two antenna */
 	/*  NOTE: here default all internal switch and 1-antenna ==> BIT1 = 0 and BIT2 = 0 */
 	if (pBtCoexist->chipInterface == BTC_INTF_USB) {
 		/*  fixed at S0 for USB interface */
@@ -2466,8 +2466,8 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 	struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length
 )
 {
-	u8 	btInfo = 0;
-	u8 	i, rspSource = 0;
+	u8	btInfo = 0;
+	u8	i, rspSource = 0;
 	bool bBtBusy = false, bLimitedDig = false;
 	bool bWifiConnected = false;
 
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 34692cca33f5..4cc15fb1b53c 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -368,14 +368,14 @@ static u8 phy_PathA_IQK_8723B(
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	enable path A PA in TXIQK mode */
+	/*	enable path A PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87);
-	/* 	disable path B PA in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
+	/*	disable path B PA in TXIQK mode */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, bRFRegOffsetMask, 0x00020); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x40ec1); */
 
 	/* 1 Tx IQK */
 	/* IQK setting */
@@ -386,7 +386,7 @@ static u8 phy_PathA_IQK_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_A, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x8214010a); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -474,7 +474,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LNA2 off, PA on for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7fb7);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x808000);
 
 	/* IQK setting */
@@ -487,7 +487,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -558,7 +558,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	/* LAN2 on, PA off for Dcut */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* PA, PAD setting */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80);
@@ -575,7 +575,7 @@ static u8 phy_PathA_RxIQK8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -617,7 +617,7 @@ static u8 phy_PathA_RxIQK8723B(
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/*	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0x780);
@@ -654,12 +654,12 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
     /* leave IQK mode */
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
 
-	/* 	in TXIQK mode */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
-	/* 	enable path B PA in TXIQK mode */
+	/*	in TXIQK mode */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x20000); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0003f); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xc7f87); */
+	/*	enable path B PA in TXIQK mode */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30fc1);
 
@@ -675,7 +675,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82140114); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x821303ea);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -689,7 +689,7 @@ static u8 phy_PathB_IQK_8723B(struct adapter *padapter)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -769,7 +769,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82160c1f); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82130ff0);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x28110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
@@ -783,7 +783,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -837,15 +837,15 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_RCK_OS, bRFRegOffsetMask, 0x18000);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G1, bRFRegOffsetMask, 0x0001f);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_TXPA_G2, bRFRegOffsetMask, 0xf7d77);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x0); */
 
 	/* open PA S1 & close SMIXER */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xed, 0x20, 0x1);
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x30ebd);
 
 	/* PA, PAD setting */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xdf, bRFRegOffsetMask, 0xf80); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x56, bRFRegOffsetMask, 0x51000); */
 
 	/* IQK setting */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK, bMaskDWord, 0x01004800);
@@ -857,7 +857,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_Tone_B, bMaskDWord, 0x38008c1c);
 
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_A, bMaskDWord, 0x82110000);
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x281604c2); */
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_A, bMaskDWord, 0x2813001f);
 	PHY_SetBBReg(pDM_Odm->Adapter, rTx_IQK_PI_B, bMaskDWord, 0x82110000);
 	PHY_SetBBReg(pDM_Odm->Adapter, rRx_IQK_PI_B, bMaskDWord, 0x28110000);
@@ -870,7 +870,7 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 
 	/* switch to path B */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, 0x00000280);
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, bRFRegOffsetMask, 0xeffe0); */
 
 	/* GNT_BT = 0 */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, 0x00000800);
@@ -895,10 +895,10 @@ static u8 phy_PathB_RxIQK8723B(struct adapter *padapter, bool configPathB)
 	regEAC = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord);
 	regEA4 = PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord);
 
-	/* 	PA/PAD controlled by 0x0 */
+	/*	PA/PAD controlled by 0x0 */
 	/* leave IQK mode */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, 0xffffff00, 0x00000000); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_B, 0xdf, bRFRegOffsetMask, 0x180); */
 
 
 
@@ -972,7 +972,7 @@ static void _PHY_PathAFillIQKMatrix8723B(
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xCA0][VAL] = 0xfffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
+/*			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S1][IDX_0xC14][VAL] = 0x40000100;
 			return;
 		}
@@ -1032,8 +1032,8 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		/* 2 Tx IQC */
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, 0xF0000000, ((TX1_C&0x3C0)>>6));
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
-/* 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
+/*		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][KEY] = rOFDM0_XDTxAFE; */
+/*		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC9C][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord); */
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][KEY] = rOFDM0_XCTxAFE;
 		pRFCalibrateInfo->TxIQC_8723B[PATH_S0][IDX_0xC94][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XDTxAFE, bMaskDWord);
 
@@ -1047,7 +1047,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 
 		if (bTxOnly) {
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][KEY] = rOFDM0_XARxIQImbalance;
-/* 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
+/*			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XARxIQImbalance, bMaskDWord); */
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = 0x40000100;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 			pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = 0x0fffffff & PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord);
@@ -1063,7 +1063,7 @@ static void _PHY_PathBFillIQKMatrix8723B(
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xC14][VAL] = PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_XBRxIQImbalance, bMaskDWord);
 
 		reg = (result[final_candidate][7] >> 6) & 0xF;
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
+/*		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_AGCRSSITable, 0x0000F000, reg); */
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][KEY] = rOFDM0_RxIQExtAnta;
 		pRFCalibrateInfo->RxIQC_8723B[PATH_S0][IDX_0xCA0][VAL] = (reg << 28)|(PHY_QueryBBReg(pDM_Odm->Adapter, rOFDM0_RxIQExtAnta, bMaskDWord)&0x0fffffff);
 	}
@@ -1355,7 +1355,7 @@ static void phy_IQCalibrate_8723B(
 	const u32 retryCount = 2;
 
 	/*  Note: IQ calibration must be performed after loading */
-	/* 		PHY_REG.txt , and radio_a, radio_b.txt */
+	/*		PHY_REG.txt , and radio_a, radio_b.txt */
 
 	/* u32 bbvalue; */
 
@@ -1372,8 +1372,8 @@ static void phy_IQCalibrate_8723B(
 /* no serial mode */
 
 	/* save RF path for 8723B */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/*	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
+/*	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
 	/* MAC settings */
 	_PHY_MACSettingCalibration8723B(padapter, IQK_MAC_REG, pDM_Odm->RFCalibrateInfo.IQK_MAC_backup);
@@ -1386,10 +1386,10 @@ static void phy_IQCalibrate_8723B(
 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XCD_RFInterfaceSW, bMaskDWord, 0x22204000);
 
 
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT10, 0x01); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XAB_RFInterfaceSW, BIT26, 0x01); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XA_RFInterfaceOE, BIT10, 0x00); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_XB_RFInterfaceOE, BIT10, 0x00); */
 
 
 /* RX IQ calibration setting for 8723B D cut large current issue when leaving IPS */
@@ -1405,7 +1405,7 @@ static void phy_IQCalibrate_8723B(
 /* path A TX IQK */
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_IQK_8723B(padapter, is2T, RF_Path);
-/* 		if (PathAOK == 0x03) { */
+/*		if (PathAOK == 0x03) { */
 		if (PathAOK == 0x01) {
 			/*  Path A Tx IQK Success */
 			PHY_SetBBReg(pDM_Odm->Adapter, rFPGA0_IQK, bMaskH3Bytes, 0x000000);
@@ -1421,8 +1421,8 @@ static void phy_IQCalibrate_8723B(
 	for (i = 0 ; i < retryCount ; i++) {
 		PathAOK = phy_PathA_RxIQK8723B(padapter, is2T, RF_Path);
 		if (PathAOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/*				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/*				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][2] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][3] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 			break;
@@ -1453,8 +1453,8 @@ static void phy_IQCalibrate_8723B(
 		for (i = 0 ; i < retryCount ; i++) {
 			PathBOK = phy_PathB_RxIQK8723B(padapter, is2T);
 			if (PathBOK == 0x03) {
-/* 				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
-/* 				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/*				result[t][0] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_Before_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
+/*				result[t][1] = (PHY_QueryBBReg(pDM_Odm->Adapter, rTx_Power_After_IQK_A, bMaskDWord)&0x3FF0000)>>16; */
 				result[t][6] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_Before_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				result[t][7] = (PHY_QueryBBReg(pDM_Odm->Adapter, rRx_Power_After_IQK_A_2, bMaskDWord)&0x3FF0000)>>16;
 				break;
@@ -1477,8 +1477,8 @@ static void phy_IQCalibrate_8723B(
 		_PHY_ReloadADDARegisters8723B(padapter, IQK_BB_REG_92C, pDM_Odm->RFCalibrateInfo.IQK_BB_backup, IQK_BB_REG_NUM);
 
 		/* Reload RF path */
-/* 		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/*		PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/*		PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 		/* Allen initial gain 0xc50 */
 		/*  Restore RX initial gain */
@@ -1590,8 +1590,8 @@ void PHY_IQCalibrate_8723B(
 		rOFDM0_XDTxAFE,
 		rOFDM0_RxIQExtAnta
 	};
-/* 	u32 		Path_SEL_BB = 0; */
-	u32 		GNT_BT_default;
+/*	u32		Path_SEL_BB = 0; */
+	u32		GNT_BT_default;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1657,12 +1657,12 @@ void PHY_IQCalibrate_8723B(
 	/* save default GNT_BT */
 	GNT_BT_default = PHY_QueryBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord);
 	/*  Save RF Path */
-/* 	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
-/* 	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
+/*	Path_SEL_BB = PHY_QueryBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord); */
+/*	Path_SEL_RF = PHY_QueryRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff); */
 
     /* set GNT_BT = 0, pause BT traffic */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x1); */
 
 
 	for (i = 0; i < 8; i++) {
@@ -1757,8 +1757,8 @@ void PHY_IQCalibrate_8723B(
 	/* restore GNT_BT */
 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, bMaskDWord, GNT_BT_default);
 	/*  Restore RF Path */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
-/* 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x948, bMaskDWord, Path_SEL_BB); */
+/*	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0xb0, 0xfffff, Path_SEL_RF); */
 
 	/* Resotr RX mode table parameter */
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, RF_WE_LUT, 0x80000, 0x1);
@@ -1769,8 +1769,8 @@ void PHY_IQCalibrate_8723B(
 	PHY_SetRFReg(pDM_Odm->Adapter, RF_PATH_A, 0x43, bRFRegOffsetMask, 0x300bd);
 
 	/* set GNT_BT = HW control */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
-/* 	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT12, 0x0); */
+/*	PHY_SetBBReg(pDM_Odm->Adapter, 0x764, BIT11, 0x0); */
 
 	if (Is2ant) {
 		if (RF_Path == 0x0)	/* S1 */
@@ -1786,7 +1786,7 @@ void PHY_IQCalibrate_8723B(
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
-	u32 		timeout = 2000, timecount = 0;
+	u32		timeout = 2000, timecount = 0;
 
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..00758014afb5 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -9,14 +9,14 @@
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
 
-/* 		Global variables */
+/*		Global variables */
 
 struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
 /*  */
-/* 		Debug related function */
+/*		Debug related function */
 /*  */
 static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 {
@@ -401,9 +401,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U1_MAC_PHY_MODE:
 		*pu8 = BTC_SMSP;
-/* 			*pU1Tmp = BTC_DMSP; */
-/* 			*pU1Tmp = BTC_DMDP; */
-/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
+/*			*pU1Tmp = BTC_DMSP; */
+/*			*pU1Tmp = BTC_DMDP; */
+/*			*pU1Tmp = BTC_MP_UNKNOWN; */
 		break;
 
 	case BTC_GET_U1_AP_NUM:
@@ -561,7 +561,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 }
 
 /*  */
-/* 		IO related function */
+/*		IO related function */
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
@@ -772,7 +772,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 }
 
 /*  */
-/* 		Extern functions called by other module */
+/*		Extern functions called by other module */
 /*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
@@ -900,14 +900,14 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		ipsType = BTC_IPS_ENTER;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -952,14 +952,14 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
@@ -978,14 +978,14 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
 		assoType = BTC_ASSOCIATE_FINISH;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
@@ -1006,14 +1006,14 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 		mStatus = BTC_MEDIA_DISCONNECT;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
@@ -1037,14 +1037,14 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
@@ -1055,14 +1055,14 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
 	pBtCoexist->statistics.cntBtInfoNotify++;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
@@ -1102,14 +1102,14 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 	/*  Periodical should be called in cmd thread, */
 	/*  don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+/*	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_Periodical(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_Periodical(pBtCoexist);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+/*	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 07e9d3423651..ca9781127fa3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -362,7 +362,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -403,7 +403,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -420,7 +420,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 010274ba8079..49e6d9f74043 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -388,7 +388,7 @@ enum { /* _ODM_Support_Ability_Definition */
 	ODM_RF_CALIBRATION		= BIT26,
 };
 
-/* 	ODM_CMNINFO_INTERFACE */
+/*	ODM_CMNINFO_INTERFACE */
 enum { /* tag_ODM_Support_Interface_Definition */
 	ODM_ITRF_SDIO	=	0x4,
 	ODM_ITRF_ALL	=	0x7,
@@ -659,7 +659,7 @@ struct ant_detected_info {
 struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	/* struct timer_list	FastAntTrainingTimer; */
 	/*  */
-	/* 	Add for different team use temporarily */
+	/*	Add for different team use temporarily */
 	/*  */
 	struct adapter *Adapter;		/*  For CE/NIC team */
 	/*  WHen you use Adapter or priv pointer, you must make sure the pointer is ready. */
@@ -681,10 +681,10 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 /*  ODM HANDLE, DRIVER NEEDS NOT TO HOOK------ */
 
 /* REMOVED COMMON INFO---------- */
-	/* u8 		PseudoMacPhyMode; */
+	/* u8		PseudoMacPhyMode; */
 	/* bool			*BTCoexist; */
 	/* bool			PseudoBtCoexist; */
-	/* u8 		OPMode; */
+	/* u8		OPMode; */
 	/* bool			bAPMode; */
 	/* bool			bClientMode; */
 	/* bool			bAdHocMode; */
@@ -773,7 +773,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u8 *pAntennaTest;
 	bool *pbNet_closed;
 	u8 *mp_mode;
-	/* u8 	*pAidMap; */
+	/* u8	*pAidMap; */
 	u8 *pu1ForcedIgiLb;
 /*  For 8723B IQK----------- */
 	bool *pIs1Antenna;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 63c4ebe9df12..86908bad14f9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -78,7 +78,7 @@ s32 FillH2CCmd8723B(struct adapter *padapter, u8 ElementID, u32 CmdLen, u8 *pCmd
 		else {
 			memcpy((u8 *)(&h2c_cmd)+1, pCmdBuffer, 3);
 			memcpy((u8 *)(&h2c_cmd_ex), pCmdBuffer+3, CmdLen-3);
-/* 			*(u8 *)(&h2c_cmd) |= BIT(7); */
+/*			*(u8 *)(&h2c_cmd) |= BIT(7); */
 		}
 
 		*(u8 *)(&h2c_cmd) |= ElementID;
@@ -925,7 +925,7 @@ void rtl8723b_download_BTCoex_AP_mode_rsvd_page(struct adapter *padapter)
 		DLBcnCount++;
 		do {
 			yield();
-/* 			mdelay(10); */
+/*			mdelay(10); */
 			/*  check rsvd page download OK. */
 			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, &bcn_valid);
 			poll++;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..c5f9f6a76294 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -42,7 +42,7 @@ static void Init_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_CUT_VER, cut_ver);
 
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_PATCH_ID, pHalData->CustomerID);
-	/* 	ODM_CMNINFO_BINHCT_TEST only for MP Team */
+	/*	ODM_CMNINFO_BINHCT_TEST only for MP Team */
 	ODM_CmnInfoInit(pDM_Odm, ODM_CMNINFO_BWIFI_TEST, Adapter->registrypriv.wifi_spec);
 
 	pdmpriv->InitODMFlag = ODM_RF_CALIBRATION|ODM_RF_TX_PWR_TRACK;
@@ -80,7 +80,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	/*  Pointer reference */
 	/*  */
 	/* ODM_CMNINFO_MAC_PHY_MODE pHalData->MacPhyMode92D */
-	/* 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
+	/*	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MAC_PHY_MODE,&(pDM_Odm->u8_temp)); */
 
 	ODM_CmnInfoUpdate(pDM_Odm, ODM_CMNINFO_ABILITY, pdmpriv->InitODMFlag);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1608bc71bd71..14817e4c7ed0 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -286,8 +286,8 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		Download 8192C firmware code. */
+/*	Description: */
+/*		Download 8192C firmware code. */
 /*  */
 /*  */
 s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
@@ -442,7 +442,7 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 }
 
 /*  */
-/* 				Efuse related code */
+/*				Efuse related code */
 /*  */
 static u8 hal_EfuseSwitchToBank(
 	struct adapter *padapter, u8 bank, bool bPseudoTest
@@ -588,8 +588,8 @@ void Hal_GetEfuseDefinition(
 #define VOLTAGE_V25		0x03
 
 /*  */
-/* 	The following is for compile ok */
-/* 	That should be merged with the original in the future */
+/*	The following is for compile ok */
+/*	That should be merged with the original in the future */
 /*  */
 #define EFUSE_ACCESS_ON_8723			0x69	/*  For RTL8723 only. */
 #define REG_EFUSE_ACCESS_8723			0x00CF	/*  Efuse access protection for RTL8723 */
@@ -1342,9 +1342,9 @@ void rtl8723b_init_default_value(struct adapter *padapter)
 
 	/*  init dm default value */
 	pdmpriv->TM_Trigger = 0;/* for IQK */
-/* 	pdmpriv->binitialized = false; */
-/* 	pdmpriv->prv_traffic_idx = 3; */
-/* 	pdmpriv->initialize = 0; */
+/*	pdmpriv->binitialized = false; */
+/*	pdmpriv->prv_traffic_idx = 3; */
+/*	pdmpriv->initialize = 0; */
 
 	pdmpriv->ThermalValue_HP_index = 0;
 	for (i = 0; i < HP_THERMAL_NUM; i++)
@@ -1451,7 +1451,7 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
 void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-/* 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
+/*	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter); */
 	u16 EEPROMId;
 
 
@@ -1584,7 +1584,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct TxPowerInfo24G	pwrInfo24G;
-	u8 	rfPath, ch, TxCount = 1;
+	u8	rfPath, ch, TxCount = 1;
 
 	Hal_ReadPowerValueFromPROM_8723B(padapter, &pwrInfo24G, PROMContent, AutoLoadFail);
 	for (rfPath = 0 ; rfPath < MAX_RF_PATH ; rfPath++) {
@@ -1838,7 +1838,7 @@ u8 BWMapping_8723B(struct adapter *Adapter, struct pkt_attrib *pattrib)
 		BWSettingOfDesc = 0;
 
 	/* if (pTcb->bBTTxPacket) */
-	/* 	BWSettingOfDesc = 0; */
+	/*	BWSettingOfDesc = 0; */
 
 	return BWSettingOfDesc;
 }
@@ -2120,8 +2120,8 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pbuf)
 
 /*  */
 /*  Description: In normal chip, we should send some packet to Hw which will be used by Fw */
-/* 			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
-/* 			Fw can tell Hw to send these packet derectly. */
+/*			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
+/*			Fw can tell Hw to send these packet derectly. */
 /*  Added by tynli. 2009.10.15. */
 /*  */
 /* type1:pspoll, type2:null */
@@ -2513,11 +2513,11 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 		break;
 
 	case C2H_CCX_TX_RPT:
-/* 			CCX_FwC2HTxRpt(padapter, QueueID, pC2hEvent->payload); */
+/*			CCX_FwC2HTxRpt(padapter, QueueID, pC2hEvent->payload); */
 		break;
 
 	case C2H_EXT_RA_RPT:
-/* 			C2HExtRaRptHandler(padapter, pC2hEvent->payload, C2hEvent.CmdLen); */
+/*			C2HExtRaRptHandler(padapter, pC2hEvent->payload, C2hEvent.CmdLen); */
 		break;
 
 	case C2H_HW_INFO_EXCH:
@@ -2533,8 +2533,8 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 
 	/*  Clear event to notify FW we have read the command. */
 	/*  Note: */
-	/* 	If this field isn't clear, the FW won't update the next command message. */
-/* 	rtw_write8(padapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE); */
+	/*	If this field isn't clear, the FW won't update the next command message. */
+/*	rtw_write8(padapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE); */
 exit:
 	return ret;
 }
@@ -2553,11 +2553,11 @@ static void process_c2h_event(struct adapter *padapter, struct c2h_evt_hdr_t *pC
 		break;
 
 	case C2H_CCX_TX_RPT:
-/* 			CCX_FwC2HTxRpt(padapter, QueueID, tmpBuf); */
+/*			CCX_FwC2HTxRpt(padapter, QueueID, tmpBuf); */
 		break;
 
 	case C2H_EXT_RA_RPT:
-/* 			C2HExtRaRptHandler(padapter, tmpBuf, C2hEvent.CmdLen); */
+/*			C2HExtRaRptHandler(padapter, tmpBuf, C2hEvent.CmdLen); */
 		break;
 
 	case C2H_HW_INFO_EXCH:
@@ -2692,7 +2692,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			break;
 		case 2:
 			/*  sta add event callback */
-/* 				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
+/*				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
 			break;
 		}
 		break;
@@ -2845,9 +2845,9 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			}
 
 			/* if (psmode != PS_MODE_ACTIVE)	{ */
-			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
+			/*	rtl8723b_set_lowpwr_lps_cmd(padapter, true); */
 			/*  else { */
-			/* 	rtl8723b_set_lowpwr_lps_cmd(padapter, false); */
+			/*	rtl8723b_set_lowpwr_lps_cmd(padapter, false); */
 			/*  */
 			rtl8723b_set_FwPwrMode_cmd(padapter, psmode);
 		}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 28c914ec2604..9505a0de827e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -269,9 +269,9 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 				rtw_free_recvframe(precvframe,
 						   &precvpriv->free_recv_queue);
 			} else {
-				/* 	Modified by Albert 20101213 */
-				/* 	For 8 bytes IP header alignment. */
-				if (pattrib->qos)	/* 	Qos data, wireless lan header length is 26 */
+				/*	Modified by Albert 20101213 */
+				/*	For 8 bytes IP header alignment. */
+				if (pattrib->qos)	/*	Qos data, wireless lan header length is 26 */
 					shift_sz = 6;
 				else
 					shift_sz = 0;
@@ -287,8 +287,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 						alloc_sz = skb_len + 14;
 				} else {
 					alloc_sz = skb_len;
-					/* 	6 is for IP header 8 bytes alignment in QoS packet case. */
-					/* 	8 is for skb->data 4 bytes alignment. */
+					/*	6 is for IP header 8 bytes alignment in QoS packet case. */
+					/*	8 is for skb->data 4 bytes alignment. */
 					alloc_sz += 14;
 				}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 842e19b53421..2c53707fed69 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -146,7 +146,7 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
-/* 	dump secondary adapter xmitbuf */
+/*	dump secondary adapter xmitbuf */
 	} while (!queue_empty);
 
 	rtw_unregister_tx_alive(padapter);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 73561a63401e..17919fbafb1e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -46,7 +46,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	u16 value16;
 	u32 value32;
 	u8 ret;
-/* 	u8 bMacPwrCtrlOn; */
+/*	u8 bMacPwrCtrlOn; */
 
 
 	/*  all of these MUST be configured before power on */
@@ -70,8 +70,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write16(padapter, REG_APS_FSMCO, value16);
 
 	/*  Enable CMD53 R/W Operation */
-/* 	bMacPwrCtrlOn = true; */
-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
+/*	bMacPwrCtrlOn = true; */
+/*	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
 
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
@@ -357,7 +357,7 @@ static void _InitNetworkType(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_CR);
 
 	/*  TODO: use the other function to set network type */
-/* 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
+/*	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AD_HOC); */
 	value32 = (value32 & ~MASK_NETTYPE) | _NETTYPE(NT_LINK_AP);
 
 	rtw_write32(padapter, REG_CR, value32);
@@ -485,7 +485,7 @@ static void _initSdioAggregationSetting(struct adapter *padapter)
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
 	/*  Tx aggregation setting */
-/* 	sdio_AggSettingTxUpdate(padapter); */
+/*	sdio_AggSettingTxUpdate(padapter); */
 
 	/*  Rx aggregation setting */
 	HalRxAggr8723BSdio(padapter);
@@ -639,7 +639,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	}
 
 	/*  Disable Interrupt first. */
-/* 	rtw_hal_disable_interrupt(padapter); */
+/*	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
 	if (ret == _FAIL)
@@ -659,7 +659,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	rtl8723b_InitializeFirmwareVars(padapter);
 
-/* 	SIC_Init(padapter); */
+/*	SIC_Init(padapter); */
 
 	if (pwrctrlpriv->reg_rfoff)
 		pwrctrlpriv->rf_pwrstate = rf_off;
@@ -745,8 +745,8 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  Record original value for template. This is arough data, we can only use the data */
 	/*  for power adjust. The value can not be adjustde according to different power!!! */
-/* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
-/* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
+/*	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
+/*	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
 	rtl8723b_InitAntenna_Selection(padapter);
 
@@ -789,7 +789,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	/* ack for xmit mgmt frames. */
 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_TXQ_CTRL) | BIT(12));
 
-/* 	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
+/*	pHalData->PreRpwmVal = SdioLocalCmd52Read1Byte(padapter, SDIO_REG_HRPWM1) & 0x80; */
 
 	{
 		pwrctrlpriv->rf_pwrstate = rf_on;
@@ -842,7 +842,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 /*  */
 /*  Description: */
-/* 	RTL8723e card disable power sequence v003 which suggested by Scott. */
+/*	RTL8723e card disable power sequence v003 which suggested by Scott. */
 /*  */
 /*  First created by tynli. 2011.01.28. */
 /*  */
@@ -854,7 +854,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/*  Run LPS WL RFOFF flow */
 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
-	/* 	==== Reset digital sequence   ====== */
+	/*	==== Reset digital sequence   ====== */
 
 	u1bTmp = rtw_read8(padapter, REG_MCUFWDL);
 	if ((u1bTmp & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
@@ -877,7 +877,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	u1bTmp |= BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL+1, u1bTmp);
 
-	/* 	==== Reset digital sequence end ====== */
+	/*	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -985,13 +985,13 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		We should set Efuse cell selection to WiFi cell in default. */
+/*	Description: */
+/*		We should set Efuse cell selection to WiFi cell in default. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL */
+/*	Assumption: */
+/*		PASSIVE_LEVEL */
 /*  */
-/* 	Added by Roger, 2010.11.23. */
+/*	Added by Roger, 2010.11.23. */
 /*  */
 static void _EfuseCellSel(struct adapter *padapter)
 {
@@ -1019,7 +1019,7 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
 
 	if (AutoLoadFail) {
-/* 		sMacAddr[5] = (u8)GetRandomNumber(1, 254); */
+/*		sMacAddr[5] = (u8)GetRandomNumber(1, 254); */
 		for (i = 0; i < 6; i++)
 			pEEPROM->mac_addr[i] = sMacAddr[i];
 	} else {
@@ -1082,24 +1082,24 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 static void _ReadPROMContent(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u8 	eeValue;
+	u8	eeValue;
 
 	eeValue = rtw_read8(padapter, REG_9346CR);
 	/*  To check system boot selection. */
 	pEEPROM->EepromOrEfuse = (eeValue & BOOT_FROM_EEPROM) ? true : false;
 	pEEPROM->bautoload_fail_flag = (eeValue & EEPROM_EN) ? false : true;
 
-/* 	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
+/*	pHalData->EEType = IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EEPROM_BOOT_EFUSE; */
 
 	_ReadEfuseInfo8723BS(padapter);
 }
 
 /*  */
-/* 	Description: */
-/* 		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
+/*	Description: */
+/*		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL (SDIO interface) */
+/*	Assumption: */
+/*		PASSIVE_LEVEL (SDIO interface) */
 /*  */
 /*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
@@ -1211,14 +1211,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 }
 
 /*  */
-/* 	Description: */
-/* 		Query setting of specified variable. */
+/*	Description: */
+/*		Query setting of specified variable. */
 /*  */
 u8 GetHalDefVar8723BSDIO(
 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
 )
 {
-	u8 	bResult = _SUCCESS;
+	u8	bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_IS_SUPPORT_ANT_DIV:
@@ -1239,8 +1239,8 @@ u8 GetHalDefVar8723BSDIO(
 }
 
 /*  */
-/* 	Description: */
-/* 		Change default setting of specified variable. */
+/*	Description: */
+/*		Change default setting of specified variable. */
 /*  */
 u8 SetHalDefVar8723BSDIO(struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue)
 {
diff --git a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
index b81252d374ef..1eb30ec32f63 100644
--- a/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
+++ b/drivers/staging/rtl8723bs/include/HalPwrSeqCmd.h
@@ -99,13 +99,13 @@ struct wlan_pwr_cfg {
 
 
 /*  */
-/* 	Prototype of protected function. */
+/*	Prototype of protected function. */
 /*  */
 u8 HalPwrSeqCmdParsing(
 	struct adapter *padapter,
-	u8 		CutVersion,
-	u8 		FabVersion,
-	u8 		InterfaceType,
+	u8		CutVersion,
+	u8		FabVersion,
+	u8		InterfaceType,
 	struct wlan_pwr_cfg	PwrCfgCmd[]);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index d0ce21ccc1cc..22ba147372dd 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -46,7 +46,7 @@ struct hal_version { /* tag_HAL_VERSION */
 	enum hal_chip_type_e		ChipType;
 	enum hal_cut_version_e	CUTVersion;
 	enum hal_vendor_e		VendorType;
-	u8 			ROMVer;
+	u8			ROMVer;
 };
 
 /* hal_version			VersionID; */
diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 24626e65fc7f..e65dbb1e6687 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -106,9 +106,9 @@
 	(EF1BYTE(*((u8 *)(__pstart))))
 
 /*  */
-/* 	Description: */
-/* 		Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to */
-/* 		4-byte value in host byte ordering. */
+/*	Description: */
+/*		Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to */
+/*		4-byte value in host byte ordering. */
 /*  */
 #define LE_BITS_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
@@ -127,9 +127,9 @@
 	)
 
 /*  */
-/* 	Description: */
-/* 		Mask subfield (continuous bits in little-endian) of 4-byte value in litten byte oredering */
-/* 		and return the result in 4-byte value in host byte ordering. */
+/*	Description: */
+/*		Mask subfield (continuous bits in little-endian) of 4-byte value in litten byte oredering */
+/*		and return the result in 4-byte value in host byte ordering. */
 /*  */
 #define LE_BITS_CLEARED_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
@@ -148,8 +148,8 @@
 	)
 
 /*  */
-/* 	Description: */
-/* 		Set subfield of little-endian 4-byte value to specified value. */
+/*	Description: */
+/*		Set subfield of little-endian 4-byte value to specified value. */
 /*  */
 #define SET_BITS_TO_LE_4BYTE(__pstart, __bitoffset, __bitlen, __val) \
 		*((u32 *)(__pstart)) =				\
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 080c321665c0..5a93948a47d0 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -403,8 +403,8 @@ struct adapter {
 	u8 bBTFWReady;
 	u8 bLinkInfoDump;
 	u8 bRxRSSIDisplay;
-	/* 	Added by Albert 2012/10/26 */
-	/* 	The driver will show up the desired channel number when this flag is 1. */
+	/*	Added by Albert 2012/10/26 */
+	/*	The driver will show up the desired channel number when this flag is 1. */
 	u8 bNotifyChannelChange;
 
 	/* pbuddystruct adapter is used only in two interface case, (iface_nums =2 in struct dvobj_priv) */
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7ea9ee2b3975..0d82d0871f4d 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -18,7 +18,7 @@
 /* pragma mark -- Tx Desc related definition. -- */
 /*  */
 /*  */
-/* 	Rate */
+/*	Rate */
 /*  */
 /*  CCK Rates, TxHT = 0 */
 #define DESC_RATE1M					0x00
@@ -97,16 +97,16 @@ void dump_chip_info(struct hal_version	ChipVersion);
 u8 /* return the final channel plan decision */
 hal_com_config_channel_plan(
 struct adapter *padapter,
-u8 	hw_channel_plan,	/* channel plan from HW (efuse/eeprom) */
-u8 	sw_channel_plan,	/* channel plan from SW (registry/module param) */
-u8 	def_channel_plan,	/* channel plan used when the former two is invalid */
+u8	hw_channel_plan,	/* channel plan from HW (efuse/eeprom) */
+u8	sw_channel_plan,	/* channel plan from SW (registry/module param) */
+u8	def_channel_plan,	/* channel plan used when the former two is invalid */
 bool		AutoLoadFail
 	);
 
 bool
 HAL_IsLegalChannel(
 struct adapter *Adapter,
-u32 		Channel
+u32		Channel
 	);
 
 u8 MRateToHwRate(u8 rate);
diff --git a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
index cb7c7ed74146..26ed40d06f40 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
@@ -31,23 +31,23 @@ enum {
 /*------------------------------Define structure----------------------------*/
 struct bb_register_def {
 	u32 rfintfs;			/*  set software control: */
-					/* 	0x870~0x877[8 bytes] */
+					/*	0x870~0x877[8 bytes] */
 
 	u32 rfintfo;			/*  output data: */
-					/* 	0x860~0x86f [16 bytes] */
+					/*	0x860~0x86f [16 bytes] */
 
 	u32 rfintfe;			/*  output enable: */
-					/* 	0x860~0x86f [16 bytes] */
+					/*	0x860~0x86f [16 bytes] */
 
 	u32 rf3wireOffset;		/*  LSSI data: */
-					/* 	0x840~0x84f [16 bytes] */
+					/*	0x840~0x84f [16 bytes] */
 
 	u32 rfHSSIPara2;		/*  wire parameter control2 : */
-					/* 	0x824~0x827, 0x82c~0x82f,
+					/*	0x824~0x827, 0x82c~0x82f,
 					 *	0x834~0x837, 0x83c~0x83f
 					 */
 	u32 rfLSSIReadBack;		/* LSSI RF readback data SI mode */
-					/* 	0x8a0~0x8af [16 bytes] */
+					/*	0x8a0~0x8af [16 bytes] */
 
 	u32 rfLSSIReadBackPi;		/* LSSI RF readback data PI mode
 					 *	0x8b8-8bc for Path A and B */
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 9a02ae69d7a4..5f84fda57339 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -9,7 +9,7 @@
 
 /*  */
 /*  */
-/* 	0x0000h ~ 0x00FFh	System Configuration */
+/*	0x0000h ~ 0x00FFh	System Configuration */
 /*  */
 /*  */
 #define REG_SYS_FUNC_EN				0x0002
@@ -38,7 +38,7 @@
 
 /*  */
 /*  */
-/* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
+/*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
 /*  */
 /*  */
 #define REG_CR							0x0100
@@ -55,7 +55,7 @@
 
 /*  */
 /*  */
-/* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
+/*	0x0200h ~ 0x027Fh	TXDMA Configuration */
 /*  */
 /*  */
 #define REG_RQPN						0x0200
@@ -67,7 +67,7 @@
 
 /*  */
 /*  */
-/* 	0x0280h ~ 0x02FFh	RXDMA Configuration */
+/*	0x0280h ~ 0x02FFh	RXDMA Configuration */
 /*  */
 /*  */
 #define REG_RXDMA_AGG_PG_TH			0x0280
@@ -75,7 +75,7 @@
 
 /*  */
 /*  */
-/* 	0x0400h ~ 0x047Fh	Protocol Configuration */
+/*	0x0400h ~ 0x047Fh	Protocol Configuration */
 /*  */
 /*  */
 #define REG_TXPKT_EMPTY				0x041A
@@ -94,7 +94,7 @@
 
 /*  */
 /*  */
-/* 	0x0500h ~ 0x05FFh	EDCA Configuration */
+/*	0x0500h ~ 0x05FFh	EDCA Configuration */
 /*  */
 /*  */
 #define REG_EDCA_VO_PARAM				0x0500
@@ -110,14 +110,14 @@
 #define REG_RD_CTRL						0x0524
 /*  */
 /*  Format for offset 540h-542h: */
-/* 	[3:0]:   TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
-/* 	[7:4]:   Reserved. */
-/* 	[19:8]:  TBTT prohibit hold in unit of 32us. The time for HW holding to send the beacon packet. */
-/* 	[23:20]: Reserved */
+/*	[3:0]:   TBTT prohibit setup in unit of 32us. The time for HW getting beacon content before TBTT. */
+/*	[7:4]:   Reserved. */
+/*	[19:8]:  TBTT prohibit hold in unit of 32us. The time for HW holding to send the beacon packet. */
+/*	[23:20]: Reserved */
 /*  Description: */
-/* 	              | */
+/*	              | */
 /*      |<--Setup--|--Hold------------>| */
-/* 	--------------|---------------------- */
+/*	--------------|---------------------- */
 /*                 | */
 /*                TBTT */
 /*  Note: We cannot update beacon content to HW or send any AC packets during the time between Setup and Hold. */
@@ -139,7 +139,7 @@
 
 /*  */
 /*  */
-/* 	0x0600h ~ 0x07FFh	WMAC Configuration */
+/*	0x0600h ~ 0x07FFh	WMAC Configuration */
 /*  */
 /*  */
 #define REG_BWOPMODE					0x0603
@@ -160,11 +160,11 @@
 
 /*  */
 /*  Note: */
-/* 	The NAV upper value is very important to WiFi 11n 5.2.3 NAV test. The default value is */
-/* 	always too small, but the WiFi TestPlan test by 25, 000 microseconds of NAV through sending */
-/* 	CTS in the air. We must update this value greater than 25, 000 microseconds to pass the item. */
-/* 	The offset of NAV_UPPER in 8192C Spec is incorrect, and the offset should be 0x0652. Commented */
-/* 	by SD1 Scott. */
+/*	The NAV upper value is very important to WiFi 11n 5.2.3 NAV test. The default value is */
+/*	always too small, but the WiFi TestPlan test by 25, 000 microseconds of NAV through sending */
+/*	CTS in the air. We must update this value greater than 25, 000 microseconds to pass the item. */
+/*	The offset of NAV_UPPER in 8192C Spec is incorrect, and the offset should be 0x0652. Commented */
+/*	by SD1 Scott. */
 /*  By Bruce, 2011-07-18. */
 /*  */
 #define REG_NAV_UPPER					0x0652	/*  unit of 128 */
@@ -186,7 +186,7 @@
 
 /*  */
 /*  */
-/* 	Redifine 8192C register definition for compatibility */
+/*	Redifine 8192C register definition for compatibility */
 /*  */
 /*  */
 
@@ -295,7 +295,7 @@
 
 /*  */
 /*  */
-/* 	0x0000h ~ 0x00FFh	System Configuration */
+/*	0x0000h ~ 0x00FFh	System Configuration */
 /*  */
 /*  */
 
@@ -357,7 +357,7 @@
 
 /*  */
 /*  */
-/* 	0x0100h ~ 0x01FFh	MACTOP General Configuration */
+/*	0x0100h ~ 0x01FFh	MACTOP General Configuration */
 /*  */
 /*  */
 
@@ -404,7 +404,7 @@
 
 /*  */
 /*  */
-/* 	0x0200h ~ 0x027Fh	TXDMA Configuration */
+/*	0x0200h ~ 0x027Fh	TXDMA Configuration */
 /*  */
 /*  */
 /* 2 RQPN */
@@ -420,7 +420,7 @@
 
 /*  */
 /*  */
-/* 	0x0280h ~ 0x028Bh	RX DMA Configuration */
+/*	0x0280h ~ 0x028Bh	RX DMA Configuration */
 /*  */
 /*  */
 
@@ -442,7 +442,7 @@
 
 /*  */
 /*  */
-/* 	0x0400h ~ 0x047Fh	Protocol Configuration */
+/*	0x0400h ~ 0x047Fh	Protocol Configuration */
 /*  */
 /*  */
 /* 2 FWHW_TXQ_CTRL */
@@ -459,7 +459,7 @@
 
 /*  */
 /*  */
-/* 	0x0500h ~ 0x05FFh	EDCA Configuration */
+/*	0x0500h ~ 0x05FFh	EDCA Configuration */
 /*  */
 /*  */
 
@@ -483,7 +483,7 @@
 
 /*  */
 /*  */
-/* 	0x0600h ~ 0x07FFh	WMAC Configuration */
+/*	0x0600h ~ 0x07FFh	WMAC Configuration */
 /*  */
 /*  */
 
@@ -504,7 +504,7 @@
 
 /*  */
 /*  */
-/* 	SDIO Bus Specification */
+/*	SDIO Bus Specification */
 /*  */
 /*  */
 
@@ -585,7 +585,7 @@
 
 /*  */
 /*  */
-/* 	0xFE00h ~ 0xFE55h	USB Configuration */
+/*	0xFE00h ~ 0xFE55h	USB Configuration */
 /*  */
 /*  */
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b87c90f693ec..bddac74f2c22 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -214,8 +214,8 @@ struct hal_com_data {
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
 
 	bool		EepromOrEfuse;
-	u8 		EfuseUsedPercentage;
-	u16 			EfuseUsedBytes;
+	u8		EfuseUsedPercentage;
+	u16			EfuseUsedBytes;
 	struct efuse_hal		EfuseHal;
 
 	/* 3 [2.4G] */
@@ -365,22 +365,22 @@ struct hal_com_data {
 
 	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
 
-	u32 		sdio_himr;
-	u32 		sdio_hisr;
+	u32		sdio_himr;
+	u32		sdio_hisr;
 
 	/*  SDIO Tx FIFO related. */
 	/*  HIQ, MID, LOW, PUB free pages; padapter->xmitpriv.free_txpg */
-	u8 	SdioTxFIFOFreePage[SDIO_TX_FREE_PG_QUEUE];
+	u8	SdioTxFIFOFreePage[SDIO_TX_FREE_PG_QUEUE];
 	spinlock_t		SdioTxFIFOFreePageLock;
-	u8 	SdioTxOQTMaxFreeSpace;
-	u8 	SdioTxOQTFreeSpace;
+	u8	SdioTxOQTMaxFreeSpace;
+	u8	SdioTxOQTFreeSpace;
 
 
 	/*  SDIO Rx FIFO related. */
-	u8 	SdioRxFIFOCnt;
-	u16 		SdioRxFIFOSize;
+	u8	SdioRxFIFOCnt;
+	u16		SdioRxFIFOSize;
 
-	u32 		sdio_tx_max_len[SDIO_MAX_TX_QUEUE];/*  H, N, L, used for sdio tx aggregation max length per queue */
+	u32		sdio_tx_max_len[SDIO_MAX_TX_QUEUE];/*  H, N, L, used for sdio tx aggregation max length per queue */
 
 	struct dm_priv dmpriv;
 	struct dm_odm_t		odmpriv;
@@ -389,8 +389,8 @@ struct hal_com_data {
 	struct bt_coexist		bt_coexist;
 
 	/*  Interrupt related register information. */
-	u32 		SysIntrStatus;
-	u32 		SysIntrMask;
+	u32		SysIntrStatus;
+	u32		SysIntrMask;
 };
 
 #define GET_HAL_DATA(__padapter)	((struct hal_com_data *)((__padapter)->HalData))
diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index 3d71a4f41592..89193f76d680 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -63,9 +63,9 @@ enum SwChnlCmdID {
 
 struct SwChnlCmd {
 	enum SwChnlCmdID	CmdID;
-	u32 			Para1;
-	u32 			Para2;
-	u32 			msDelay;
+	u32			Para1;
+	u32			Para2;
+	u32			msDelay;
 };
 
 /*--------------------------Exported Function prototype---------------------*/
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ddf868c7899b..c2b5696554fe 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -366,7 +366,7 @@ struct txdesc_8723b {
 #endif
 /*  */
 /*  */
-/* 	Rate */
+/*	Rate */
 /*  */
 /*  */
 /*  CCK Rates, TxHT = 0 */
diff --git a/drivers/staging/rtl8723bs/include/rtw_eeprom.h b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
index 9b84105af816..b1e7ea3d984f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_eeprom.h
+++ b/drivers/staging/rtl8723bs/include/rtw_eeprom.h
@@ -100,8 +100,8 @@ struct eeprom_priv {
 
 	u8 mac_addr[6];	/* PermanentAddress */
 
-	u16 	channel_plan;
-	u16 	CustomerID;
+	u16	channel_plan;
+	u16	CustomerID;
 
 	u8 efuse_eeprom_data[EEPROM_MAX_SIZE]; /* 92C:256bytes, 88E:512bytes, we use union set (512bytes) */
 	u8 adjuseVoltageVal;
@@ -110,7 +110,7 @@ struct eeprom_priv {
 	u8 EEPROMRFGainVal;
 
 	u8 sdio_setting;
-	u32 	ocr;
+	u32	ocr;
 	u8 cis0[eeprom_cis0_sz];
 	u8 cis1[eeprom_cis1_sz];
 };
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 669565fa1c69..4254f8c55d8a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -34,7 +34,7 @@ enum {
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
 /*  */
-/* 	The following is for BT Efuse definition */
+/*	The following is for BT Efuse definition */
 /*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index adf1de4d7924..8d3ed48656ed 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -40,7 +40,7 @@ struct _io_ops {
 
 struct	intf_hdl {
 	struct adapter *padapter;
-	struct dvobj_priv *pintf_dev;/* 	pointer to &(padapter->dvobjpriv); */
+	struct dvobj_priv *pintf_dev;/*	pointer to &(padapter->dvobjpriv); */
 
 	struct _io_ops	io_ops;
 };
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 3cf68b85eb32..24e86f769ade 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -13,8 +13,8 @@
 /* define   MAX_JOIN_TIMEOUT	2500 */
 #define   MAX_JOIN_TIMEOUT	6500
 
-/* 	Commented by Albert 20101105 */
-/* 	Increase the scanning timeout because of increasing the SURVEY_TO value. */
+/*	Commented by Albert 20101105 */
+/*	Increase the scanning timeout because of increasing the SURVEY_TO value. */
 
 #define		SCANNING_TIMEOUT	8000
 
@@ -97,9 +97,9 @@ struct sitesurvey_ctrl {
 };
 
 struct rt_link_detect_t {
-	u32 			NumTxOkInPeriod;
-	u32 			NumRxOkInPeriod;
-	u32 			NumRxUnicastOkInPeriod;
+	u32			NumTxOkInPeriod;
+	u32			NumRxOkInPeriod;
+	u32			NumRxUnicastOkInPeriod;
 	bool			bBusyTraffic;
 	bool			bTxBusyTraffic;
 	bool			bRxBusyTraffic;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..deb864bd1660 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -8,11 +8,11 @@
 #define __RTW_MLME_EXT_H_
 
 
-/* 	Commented by Albert 20101105 */
-/* 	Increase the SURVEY_TO value from 100 to 150  (100ms to 150ms) */
-/* 	The Realtek 8188CE SoftAP will spend around 100ms to send the probe response after receiving the probe request. */
-/* 	So, this driver tried to extend the dwell time for each scanning channel. */
-/* 	This will increase the chance to receive the probe response from SoftAP. */
+/*	Commented by Albert 20101105 */
+/*	Increase the SURVEY_TO value from 100 to 150  (100ms to 150ms) */
+/*	The Realtek 8188CE SoftAP will spend around 100ms to send the probe response after receiving the probe request. */
+/*	So, this driver tried to extend the dwell time for each scanning channel. */
+/*	This will increase the chance to receive the probe response from SoftAP. */
 
 #define SURVEY_TO		(100)
 #define REAUTH_TO		(300) /* 50) */
@@ -73,10 +73,10 @@ extern unsigned char WMM_PARA_OUI[];
 /*  */
 /*  Channel Plan Type. */
 /*  Note: */
-/* 	We just add new channel plan when the new channel plan is different from any of the following */
-/* 	channel plan. */
-/* 	If you just want to customize the actions(scan period or join actions) about one of the channel plan, */
-/* 	customize them in rt_channel_info in the RT_CHANNEL_LIST. */
+/*	We just add new channel plan when the new channel plan is different from any of the following */
+/*	channel plan. */
+/*	If you just want to customize the actions(scan period or join actions) about one of the channel plan, */
+/*	customize them in rt_channel_info in the RT_CHANNEL_LIST. */
 /*  */
 enum {
 	/*  old channel plan mapping ===== */
@@ -322,7 +322,7 @@ struct mlme_ext_info {
 
 /*  The channel information about this channel including joining, scanning, and power constraints. */
 struct rt_channel_info {
-	u8 		ChannelNum;		/*  The channel number. */
+	u8		ChannelNum;		/*  The channel number. */
 	enum rt_scan_type	ScanType;		/*  Scan type such as passive or active scan. */
 };
 
@@ -390,7 +390,7 @@ struct mlme_ext_priv {
 	struct timer_list		link_timer;
 	struct timer_list		sa_query_timer;
 	/* struct timer_list		ADDBA_timer; */
-	u16 		chan_scan_time;
+	u16		chan_scan_time;
 	unsigned long last_scan_time;
 	u8 scan_abort;
 	u8 tx_rate; /*  TXRATE when USERATE is set. */
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index aa9f9d5ecd01..9790ca0d98d4 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -75,8 +75,8 @@ struct phy_info {
 
 	u8 rx_mimo_signal_strength[4];/*  in 0~100 index */
 
-	u16 	Cfo_short[4];			/*  per-path's Cfo_short */
-	u16 	Cfo_tail[4];			/*  per-path's Cfo_tail */
+	u16	Cfo_short[4];			/*  per-path's Cfo_short */
+	u16	Cfo_tail[4];			/*  per-path's Cfo_tail */
 
 	s8		RxPower; /*  in dBm Translate from PWdB */
 	s8		RecvSignalPower;/*  Real power in dBm for this packet, no beautification and aggregation. Keep this raw info to be used for the other procedures. */
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 63343998266a..46e1eb78f2da 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -122,7 +122,7 @@ struct sta_info {
 	struct recv_reorder_ctrl recvreorder_ctrl[16];
 
 	/* for A-MPDU Tx */
-	/* unsigned char 	ampdu_txen_bitmap; */
+	/* unsigned char	ampdu_txen_bitmap; */
 	u16 BA_starting_seqctrl[16];
 
 
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 230b2c4ffd3b..26911a685868 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -332,10 +332,10 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
  */
 struct ieee80211_ht_addt_info {
 	unsigned char control_chan;
-	unsigned char 	ht_param;
+	unsigned char	ht_param;
 	__le16	operation_mode;
 	__le16	stbc_param;
-	unsigned char 	basic_set[16];
+	unsigned char	basic_set[16];
 } __attribute__ ((packed));
 
 
@@ -360,19 +360,19 @@ struct HT_info_element {
 }  __attribute__ ((packed));
 
 struct AC_param {
-	unsigned char 	ACI_AIFSN;
-	unsigned char 	CW;
+	unsigned char	ACI_AIFSN;
+	unsigned char	CW;
 	__le16	TXOP_limit;
 }  __attribute__ ((packed));
 
 struct WMM_para_element {
-	unsigned char 	QoS_info;
-	unsigned char 	reserved;
+	unsigned char	QoS_info;
+	unsigned char	reserved;
 	struct AC_param	ac_param[4];
 }  __attribute__ ((packed));
 
 struct ADDBA_request {
-	unsigned char 	dialog_token;
+	unsigned char	dialog_token;
 	__le16	BA_para_set;
 	__le16	BA_timeout_value;
 	__le16	BA_starting_seqctrl;
@@ -396,11 +396,11 @@ struct ADDBA_request {
 
 /* endif */
 
-/* 	===============WPS Section =============== */
-/* 	WPS attribute ID */
+/*	===============WPS Section =============== */
+/*	WPS attribute ID */
 #define WPS_ATTR_SELECTED_REGISTRAR	0x1041
 
-/* 	=====================P2P Section ===================== */
+/*	=====================P2P Section ===================== */
 enum p2p_role {
 	P2P_ROLE_DISABLE = 0,
 	P2P_ROLE_DEVICE = 1,
@@ -409,27 +409,27 @@ enum p2p_role {
 };
 
 enum p2p_state {
-	P2P_STATE_NONE = 0,							/* 	P2P disable */
-	P2P_STATE_IDLE = 1,								/* 	P2P had enabled and do nothing */
-	P2P_STATE_LISTEN = 2,							/* 	In pure listen state */
-	P2P_STATE_SCAN = 3,							/* 	In scan phase */
-	P2P_STATE_FIND_PHASE_LISTEN = 4,				/* 	In the listen state of find phase */
-	P2P_STATE_FIND_PHASE_SEARCH = 5,				/* 	In the search state of find phase */
-	P2P_STATE_TX_PROVISION_DIS_REQ = 6,			/* 	In P2P provisioning discovery */
+	P2P_STATE_NONE = 0,							/*	P2P disable */
+	P2P_STATE_IDLE = 1,								/*	P2P had enabled and do nothing */
+	P2P_STATE_LISTEN = 2,							/*	In pure listen state */
+	P2P_STATE_SCAN = 3,							/*	In scan phase */
+	P2P_STATE_FIND_PHASE_LISTEN = 4,				/*	In the listen state of find phase */
+	P2P_STATE_FIND_PHASE_SEARCH = 5,				/*	In the search state of find phase */
+	P2P_STATE_TX_PROVISION_DIS_REQ = 6,			/*	In P2P provisioning discovery */
 	P2P_STATE_RX_PROVISION_DIS_RSP = 7,
 	P2P_STATE_RX_PROVISION_DIS_REQ = 8,
-	P2P_STATE_GONEGO_ING = 9,						/* 	Doing the group owner negotiation handshake */
-	P2P_STATE_GONEGO_OK = 10,						/* 	finish the group negotiation handshake with success */
-	P2P_STATE_GONEGO_FAIL = 11,					/* 	finish the group negotiation handshake with failure */
-	P2P_STATE_RECV_INVITE_REQ_MATCH = 12,		/* 	receiving the P2P Invitation request and match with the profile. */
-	P2P_STATE_PROVISIONING_ING = 13,				/* 	Doing the P2P WPS */
-	P2P_STATE_PROVISIONING_DONE = 14,			/* 	Finish the P2P WPS */
-	P2P_STATE_TX_INVITE_REQ = 15,					/* 	Transmit the P2P Invitation request */
-	P2P_STATE_RX_INVITE_RESP_OK = 16,				/* 	Receiving the P2P Invitation response */
-	P2P_STATE_RECV_INVITE_REQ_DISMATCH = 17,	/* 	receiving the P2P Invitation request and mismatch with the profile. */
-	P2P_STATE_RECV_INVITE_REQ_GO = 18,			/* 	receiving the P2P Invitation request and this wifi is GO. */
-	P2P_STATE_RECV_INVITE_REQ_JOIN = 19,			/* 	receiving the P2P Invitation request to join an existing P2P Group. */
-	P2P_STATE_RX_INVITE_RESP_FAIL = 20,			/* 	recveing the P2P Invitation response with failure */
+	P2P_STATE_GONEGO_ING = 9,						/*	Doing the group owner negotiation handshake */
+	P2P_STATE_GONEGO_OK = 10,						/*	finish the group negotiation handshake with success */
+	P2P_STATE_GONEGO_FAIL = 11,					/*	finish the group negotiation handshake with failure */
+	P2P_STATE_RECV_INVITE_REQ_MATCH = 12,		/*	receiving the P2P Invitation request and match with the profile. */
+	P2P_STATE_PROVISIONING_ING = 13,				/*	Doing the P2P WPS */
+	P2P_STATE_PROVISIONING_DONE = 14,			/*	Finish the P2P WPS */
+	P2P_STATE_TX_INVITE_REQ = 15,					/*	Transmit the P2P Invitation request */
+	P2P_STATE_RX_INVITE_RESP_OK = 16,				/*	Receiving the P2P Invitation response */
+	P2P_STATE_RECV_INVITE_REQ_DISMATCH = 17,	/*	receiving the P2P Invitation request and mismatch with the profile. */
+	P2P_STATE_RECV_INVITE_REQ_GO = 18,			/*	receiving the P2P Invitation request and this wifi is GO. */
+	P2P_STATE_RECV_INVITE_REQ_JOIN = 19,			/*	receiving the P2P Invitation request to join an existing P2P Group. */
+	P2P_STATE_RX_INVITE_RESP_FAIL = 20,			/*	recveing the P2P Invitation response with failure */
 	P2P_STATE_RX_INFOR_NOREADY = 21,			/*  receiving p2p negotiation response with information is not available */
 	P2P_STATE_TX_INFOR_NOREADY = 22,			/*  sending p2p negotiation response with information is not available */
 };
-- 
2.34.1

