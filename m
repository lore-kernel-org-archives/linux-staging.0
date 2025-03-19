Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D8B259C8B
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 11:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382655; cv=none; b=rPNhlRTYS+xNTVhdVW/kYQQWDkNfpcqub3geb2N95HNupYMMaYIhW67FCLxKaH0+hJNZh2fTdclFMWtfOk7z4vXrPnJcoA0/4h7SZeKvVQQ0TP0g3T1zfgd/wfOGY1fAh7rYd9xLtDc+SXRJ2vfAosULDdSyyTsvqLvH4Lgfg2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382655; c=relaxed/simple;
	bh=DuCRhfvY1YWAlcegeb2xSNc/frHOXvyRWj9TuE87/Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EyD/eO+IN3qRemJW++sGFRExl864VKVHrWRmi0C1+WvHpkdYf9ekemObLxkujyd4YJzPryDIcKCPHtx03YAIj8ensD8wxw42xqDiy2ADplYe4s8ID1U27zJ0xA19ymvZW+Ff9EWGOSC5bRr8rb/mkGR1TDvw0KLnbOpvw2H2DKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0EaaidG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0EaaidG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso45424745e9.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 04:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742382651; x=1742987451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEqsHasWuQ53hJKWtja1pTPO3NrgTSuGn7P0x/RZWWg=;
        b=m0EaaidGwqTy05YWcAp8VaCQFhmGfT5FoJbD56YTE4I1KZ830NDdMNgfF69liPbl0u
         AM+sBqmdEWD9cioLPqpQKnSNEVPe8AyvBgfNWSz726AR2oxV4ypyX87SgCjjIUtX1vit
         jQ4ozKoZ9XK1KacoBq/iBaiN7UINycBzepOBsPfWg54PLdRpRO4kYcE1F3jCcu18hzjk
         jZHnHEDVI2qpTvdpBcGo6+fiPF/e2vINBH/uJjRhVBt78snDdFN9CwRQLIzPzCUiIDSq
         nmwNzpVg1edFqOmiNwY2v8sDpU+Flgg1sRSLroVx7lcLkhYXmFhpRtDp4iStzNVn7R0h
         BZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742382651; x=1742987451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEqsHasWuQ53hJKWtja1pTPO3NrgTSuGn7P0x/RZWWg=;
        b=s5xI/Y9sT91lIiteJSduZUNAk2itF4R6YDd/zIpd3gdEsFksGhqIM5W78n5LR6QeTF
         nR4v953TGYmtG87ZBPS0jBhkNoMMHCMYsl1DPiT4rhUZPF4Lj8V6Qn8L+hVw1e1SlIN5
         cJ08Wj/YwYErm+je9+Kc5nbq7KNqum0EihoIX1mv0V/T3pq28/ue4iQnO9uIeQWdjevo
         yEAXRPxrmxa2xKvGnhubCGEt205KYgi1I4FQIxg/qjDklWKAora1dx5ufyNlFtPUP8PC
         T3ytXpe3OulHG7MNqWR7WmE7UdL7L6YovCvon5qtDNc3oRj7SO+6pn8UkW4rAuMYp6LX
         eHjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3cFdsyM/S1pWT1Z6OwaR5KFSx1tT4Auhxsu4NSgHzqYirDI9QIYHw1Pr/0RIt8zJgS1snInEggbRnTGXE@lists.linux.dev
X-Gm-Message-State: AOJu0YwRKWFSS7/nGZoxd7rv3KVbeUWBiBwaJ/sRajSQ/fGgMhW8wVqm
	FdtufBMAwzoHkcPEQpi91nykV63FGENCqM3/xxScpWGqKuilS1qd
X-Gm-Gg: ASbGncszk+clCXeifMluLO4DopTLqvuSqCrTxb00p5oOWnyCoh10oAkO1rVkNWdUpy7
	3VqZfz8xZmEgrFKUmdYJe7EJqLBHiR4sYgo1fHkjBIjIB5hgcHCOrKxHXT1cYXiup1Bvt1/h1Z2
	TrRZWRlX6lbJsTXDiIwfE6ZzKZ4P7A+1qXVvHcXMzf3tGd6ZXbY3DFHl/Wwr9/HNTn4R0/7F3LP
	M+KPBCRhY4Hf5VJkXEF0vFEWIBgVWmSywX5IFjEM7vqtXKGWAOGwEa8qxctKDu6CwQaRhr70p3C
	q5hNPA+11qAB/Z8xHzSqwCWiBmpyn3f2GCDIPJoeW31BxVA3t49efS+qAiTmYkxoihW3aDvbhw=
	=
X-Google-Smtp-Source: AGHT+IHDT/p/3j+bWc722lk+UMK/0hxzdn0fzyby6MFzE7vnohTsH7ooXbuzUm1mBdUhwujdIXj5oQ==
X-Received: by 2002:a05:600c:c1b:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43d4381617dmr18101475e9.24.1742382650623;
        Wed, 19 Mar 2025 04:10:50 -0700 (PDT)
Received: from localhost.localdomain ([5.29.19.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8e43244sm21156411f8f.60.2025.03.19.04.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:10:50 -0700 (PDT)
From: David Zalman <davidzalman.101@gmail.com>
To: gregkh@linuxfoundation.org
Cc: vivek6429.ts@gmail.com,
	philipp.g.hortmann@gmail.com,
	viro@zeniv.linux.org.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Zalman <davidzalman.101@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fixed a unnecessary parentheses coding style issue
Date: Wed, 19 Mar 2025 07:10:12 -0400
Message-Id: <20250319111012.1588-1-davidzalman.101@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around derefrened pointers in
core/rtw_ap.c to adapter to the Linux kernel coding style.

Reported by checkpatch:

CHECK: Unnecessary parentheses around x->y

Signed-off-by: David Zalman <davidzalman.101@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 96 ++++++++++++-------------
 1 file changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index a6dc88dd4ba1..50022bb5911e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -324,7 +324,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
 	unsigned char sta_band = 0, shortGIrate = false;
 	unsigned int tx_ra_bitmap = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
 		*pcur_network = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
 
@@ -372,9 +372,9 @@ void update_bmc_sta(struct adapter *padapter)
 	unsigned char network_type;
 	int supportRateNum = 0;
 	unsigned int tx_ra_bitmap = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex
 		*pcur_network = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
 	struct sta_info *psta = rtw_get_bcmc_stainfo(padapter);
@@ -451,9 +451,9 @@ void update_bmc_sta(struct adapter *padapter)
 
 void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 	struct ht_priv *phtpriv_sta = &psta->htpriv;
 	u8 cur_ldpc_cap = 0, cur_stbc_cap = 0, cur_beamform_cap = 0;
@@ -563,10 +563,10 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 static void update_ap_info(struct adapter *padapter, struct sta_info *psta)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
 		*pnetwork = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 
 	psta->wireless_mode = pmlmeext->cur_wireless_mode;
@@ -609,7 +609,7 @@ static void update_hw_ht_param(struct adapter *padapter)
 	unsigned char max_AMPDU_len;
 	unsigned char min_MPDU_spacing;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	/* handle A-MPDU parameter field
 	 *
@@ -645,13 +645,13 @@ void start_bss_network(struct adapter *padapter)
 	u32 acparm;
 	int	ie_len;
 	struct registry_priv  *pregpriv = &padapter->registrypriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct wlan_bssid_ex
 		*pnetwork = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *pnetwork_mlmeext = &(pmlmeinfo->network);
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *pnetwork_mlmeext = &pmlmeinfo->network;
 	struct HT_info_element *pht_info = NULL;
 	u8 cbw40_enable = 0;
 
@@ -823,7 +823,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
 		*pbss_network = (struct wlan_bssid_ex *)&pmlmepriv->cur_network.network;
 	u8 *ie = pbss_network->ies;
@@ -845,7 +845,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pbss_network->rssi = 0;
 
-	memcpy(pbss_network->mac_address, myid(&(padapter->eeprompriv)), ETH_ALEN);
+	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
 
 	/* beacon interval */
 	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
@@ -1186,7 +1186,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 	if ((NUM_ACL - 1) < pacl_list->num)
 		return (-1);
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 
 	phead = get_list_head(pacl_node_q);
 	list_for_each(plist, phead) {
@@ -1200,12 +1200,12 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		}
 	}
 
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	if (added)
 		return ret;
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 
 	for (i = 0; i < NUM_ACL; i++) {
 		paclnode = &pacl_list->aclnode[i];
@@ -1225,7 +1225,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		}
 	}
 
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	return ret;
 }
@@ -1238,7 +1238,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
 
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 
 	phead = get_list_head(pacl_node_q);
 	list_for_each_safe(plist, tmp, phead) {
@@ -1258,7 +1258,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 		}
 	}
 
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 }
 
@@ -1308,7 +1308,7 @@ static int rtw_ap_set_key(
 	u8 keylen;
 	struct cmd_obj *pcmd;
 	struct setkey_parm *psetkeyparm;
-	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	int res = _SUCCESS;
 
 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -1345,7 +1345,7 @@ static int rtw_ap_set_key(
 		keylen = 16;
 	}
 
-	memcpy(&(psetkeyparm->key[0]), key, keylen);
+	memcpy(&psetkeyparm->key[0], key, keylen);
 
 	pcmd->cmdcode = _SetKey_CMD_;
 	pcmd->parmbuf = (u8 *)psetkeyparm;
@@ -1397,10 +1397,10 @@ static void update_bcn_fixed_ie(struct adapter *padapter)
 
 static void update_bcn_erpinfo_ie(struct adapter *padapter)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *pnetwork = &(pmlmeinfo->network);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *pnetwork = &pmlmeinfo->network;
 	unsigned char *p, *ie = pnetwork->ies;
 	u32 len = 0;
 
@@ -1461,10 +1461,10 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	u8 *pbackup_remainder_ie = NULL;
 
 	uint wps_ielen = 0, wps_offset, remainder_ielen;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex *pnetwork = &(pmlmeinfo->network);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct wlan_bssid_ex *pnetwork = &pmlmeinfo->network;
 	unsigned char *ie = pnetwork->ies;
 	u32 ielen = pnetwork->ie_length;
 
@@ -1537,8 +1537,8 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 	if (!padapter)
 		return;
 
-	pmlmepriv = &(padapter->mlmepriv);
-	pmlmeext = &(padapter->mlmeextpriv);
+	pmlmepriv = &padapter->mlmepriv;
+	pmlmeext = &padapter->mlmeextpriv;
 	/* pmlmeinfo = &(pmlmeext->mlmext_info); */
 
 	if (!pmlmeext->bstart_bss)
@@ -1619,7 +1619,7 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 {
 	u16 cur_op_mode, new_op_mode;
 	int op_mode_changes = 0;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv_ap = &pmlmepriv->htpriv;
 
 	if (pmlmepriv->htpriv.ht_option)
@@ -1703,8 +1703,8 @@ void associated_clients_update(struct adapter *padapter, u8 updated)
 void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 beacon_updated = false;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	if (!(psta->flags & WLAN_STA_SHORT_PREAMBLE)) {
 		if (!psta->no_short_preamble_set) {
@@ -1823,8 +1823,8 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 beacon_updated = false;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	if (!psta)
 		return beacon_updated;
@@ -1932,7 +1932,7 @@ void rtw_sta_flush(struct adapter *padapter)
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
@@ -1962,7 +1962,7 @@ void rtw_sta_flush(struct adapter *padapter)
 void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 {
 	int flags = psta->flags;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	/* update wmm cap. */
 	if (WLAN_STA_WME & flags)
@@ -1991,7 +1991,7 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (psta->state & _FW_LINKED) {
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
@@ -2006,7 +2006,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *psta;
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct list_head	*phead, *plist;
 	u8 chk_alive_num = 0;
 	char chk_alive_list[NUM_STA];
@@ -2072,7 +2072,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 void start_ap_mode(struct adapter *padapter)
 {
 	int i;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
@@ -2109,7 +2109,7 @@ void start_ap_mode(struct adapter *padapter)
 	pmlmepriv->p2p_probe_resp_ie = NULL;
 
 	/* for ACL */
-	INIT_LIST_HEAD(&(pacl_list->acl_node_q.queue));
+	INIT_LIST_HEAD(&pacl_list->acl_node_q.queue);
 	pacl_list->num = 0;
 	pacl_list->mode = 0;
 	for (i = 0; i < NUM_ACL; i++) {
@@ -2124,7 +2124,7 @@ void stop_ap_mode(struct adapter *padapter)
 	struct rtw_wlan_acl_node *paclnode;
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct wlan_acl_pool *pacl_list = &pstapriv->acl_list;
 	struct __queue	*pacl_node_q = &pacl_list->acl_node_q;
@@ -2142,7 +2142,7 @@ void stop_ap_mode(struct adapter *padapter)
 	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
 
 	/* for ACL */
-	spin_lock_bh(&(pacl_node_q->lock));
+	spin_lock_bh(&pacl_node_q->lock);
 	phead = get_list_head(pacl_node_q);
 	list_for_each_safe(plist, tmp, phead) {
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
@@ -2155,7 +2155,7 @@ void stop_ap_mode(struct adapter *padapter)
 			pacl_list->num--;
 		}
 	}
-	spin_unlock_bh(&(pacl_node_q->lock));
+	spin_unlock_bh(&pacl_node_q->lock);
 
 	rtw_sta_flush(padapter);
 
-- 
2.39.5

