Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6F637DEA3
	for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507843; cv=none; b=HBw29FsJmWfkT+iwd0he6PJkVGxiTnC0wXErHLFTzXMDGprlsYFeGAoTirIfWSutLsW/Neqrgoy34wCOFus+yiuwHhamKEzkslWga6HLuFM4hbb+OYnaGfnfQNO9GdjtYpFQYsJqls5HJ669V+2+iRDN6nhsf3hf01TSd8DqK3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507843; c=relaxed/simple;
	bh=/1KD8xclSsh9uYOAJwDD1SKj1wDH6Fx/Ou8Eu3vdMkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9Kp34+e1OeZub9imoBoWWPFxnDI7zTxW0cJPT60dx8XdrHpBs3gFXAIAhV+LFRQeX5cdjepbIgKUkqE6+yLqeyhcmBUAT4ZLL40iw/G8luBJAq2FFtptctM4miVX4nkkuCyEIutOxnfJ2RsbyL3uRdfc9JcpKE7nv23nvhtpvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOlbrHkz; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOlbrHkz"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881a3a28e72so181104b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Sep 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790507840; x=1791112640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hx8g+kDLA+hq2wKTYtS/g/FCYEq932gJ43hOPqXrOA=;
        b=pOlbrHkz0mBckpQQqc9TiEEZ5ug9wqJ58vfoy0Yg5D5x1EEUDlXZ4mSGY3gnwgqyu2
         7cePHcTL7iSiPTVHV5GCyikDs6KeOfzn9/L8ciYgT6NmD6va46S5nN/XCDpbk2527N4O
         T5w2j7vpCjSb1yhDvIcgr0mzyAHy+Gz2hTNG85F9XX9+fjKqQmpN6l52I9vlmKcP5Mlf
         romCp0GIk9AbR40M6eufiLTzaNbsZbs7tyyI8MQHhHQ1VQPcebqlOarnhSsryOm+rxn3
         VPJTAwyGvHuaOw/cAZXkDRn8o2KQ9W9mTeI2Nx0IWXXGf9hNboXAOTUyHd+eNha7gLXn
         0bqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790507840; x=1791112640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hx8g+kDLA+hq2wKTYtS/g/FCYEq932gJ43hOPqXrOA=;
        b=h3+K5UzCwwSMatY3l+M4QwBoCHh1Tx6DPPPzBoIvlYNIP0Zc4scwdjnJ6S7mUtGjYV
         MqUUcA6DLUI7v62ny25ulGzMcNyIkHcgtGMUexhrPo/dYJKRlmNUHuH/ywTbWtcW5D1K
         AKoJdpRKF6ZVxm0dod/jiHFyjrb3+Czj8naN1t1s467FcK+il6UYHpIOoerdJ5BgIW96
         KpBtGmWvSyqtQtZanQ0Bp2Zyl+a4Oe0CggEOYVRZYvKwn12MJ9J/xhYrzfdI4kTob97n
         jEJxplmCiHo18/MvB9l1NVsiKzACoGgIBDu8Gkj6eJiI3kdbsyAjH0V4ItM5n8LrZYVE
         ZBBA==
X-Gm-Message-State: AFuF++l673VT3s+xBnoRn/wJD/nQDGOez8YisCjo9Kom5/NXaIqjAeR8
	lIDgZIf0lb0uNI3eflkK3Y4/wNX6NDX4fPrSv6exMKc9nhOb+M0+zDt8
X-Gm-Gg: AYBFou05xyfILQf8OYfLQj91wVgtSRTctXoz7jN4DKkSa+G78XBPJBiChED/HqBqPtB
	MyFc6VdJIHJjuh2QiX6oSKrTPDnWXlMoKtx5s84pXkXNa0Fs7O41Rk2zQgGE+6mnHtUXC879OpG
	gML5/zo0u08TDSGJaxSQ3AZnst/lTyFqGk4K/XpFksiaTSgWwgPvwPO8fqHOAYZSZy7NQSD5zqz
	40ie1EMLfS7befLBRJAx3LCFFAZDZrStxJCXMnBpXFP9jwveIjkj2GUIhF517y6W3U41NNzMx6j
	ve94IcuIVvP03535barWLqjEdN1f+176ZoUnwbe1/qQ7kz79xUdKykntXHaSQXjEdSws/ztosFi
	JRt1djwq0DIUixqHZvhKf245C/SBvi23mzrSI7VWPxmvnM81Km8TNsEl3E6BKfbm8+uyySdASbP
	hNkemLbvXszbAteyRw3O01Byo78CqhNsWVU51LGeB1qYbcP68XZbZ/zycgqnzLDN06Y7F2iBwUf
	gINQXHZftBJySPIdg==
X-Received: by 2002:a05:6a00:2e13:b0:877:fe9f:6828 with SMTP id d2e1a72fcca58-881351f35d1mr3442268b3a.13.1790507839306;
        Sun, 27 Sep 2026 04:17:19 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8829ff81dd7sm562620b3a.55.2026.09.27.04.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:17:18 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace custom uint with standard unsigned int
Date: Sun, 27 Sep 2026 11:16:32 +0000
Message-ID: <20260927111632.50423-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TODO file for the rtl8723bs driver specifies converting unusual
variable types. The driver was extensively using the non-standard
'uint' type.

Replace all instances of 'uint' with the kernel standard 'unsigned int'
across the entire driver. This improves code readability and aligns
with the Linux kernel coding style guidelines.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 48 +++++++++++--------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 29 ++++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 39 +++++++--------
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c | 30 ++++++------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 12 +++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  4 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  8 ++--
 drivers/staging/rtl8723bs/include/hal_intf.h  |  4 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 28 ++++++-----
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 23 +++++----
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 14 +++---
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  4 +-
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 22 ++++-----
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 24 +++++-----
 drivers/staging/rtl8723bs/include/sta_info.h  | 10 ++--
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 12 ++---
 18 files changed, 169 insertions(+), 146 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 4d211711f2ba..0c5ede8523de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -117,9 +117,9 @@ u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *sourc
 /*  rtw_set_ie will update frame length */
 u8 *rtw_set_ie(u8 *pbuf,
 	       signed int index,
-	       uint len,
+	       unsigned int len,
 	       u8 *source,
-	       uint *frlen) /* frame length */
+	       unsigned int *frlen) /* frame length */
 {
 	*pbuf = (u8)index;
 
@@ -173,9 +173,10 @@ u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
  *
  * Returns: The address of the specific IE found, or NULL
  */
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen)
+u8 *rtw_get_ie_ex(u8 *in_ie, unsigned int in_len, u8 eid,
+		  u8 *oui, u8 oui_len, u8 *ie, unsigned int *ielen)
 {
-	uint cnt;
+	unsigned int cnt;
 	u8 *target_ie = NULL;
 
 	if (ielen)
@@ -221,13 +222,14 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
  *
  * Returns: _SUCCESS: ies is updated, _FAIL: not updated
  */
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len)
+int rtw_ies_remove_ie(u8 *ies, unsigned int *ies_len, unsigned int offset,
+		      u8 eid, u8 *oui, u8 oui_len)
 {
 	int ret = _FAIL;
 	u8 *target_ie;
 	u32 target_ielen;
 	u8 *start;
-	uint search_len;
+	unsigned int search_len;
 
 	if (!ies || !ies_len || *ies_len <= offset)
 		goto exit;
@@ -239,7 +241,7 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 		target_ie = rtw_get_ie_ex(start, search_len, eid, oui, oui_len, NULL, &target_ielen);
 		if (target_ie && target_ielen) {
 			u8 *remain_ies = target_ie + target_ielen;
-			uint remain_len = search_len - (remain_ies - start);
+			unsigned int remain_len = search_len - (remain_ies - start);
 
 			memcpy(target_ie, remain_ies, remain_len);
 			*ies_len = *ies_len - target_ielen;
@@ -255,7 +257,7 @@ int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 o
 	return ret;
 }
 
-void rtw_set_supported_rate(u8 *supported_rates, uint mode)
+void rtw_set_supported_rate(u8 *supported_rates, unsigned int mode)
 {
 	memset(supported_rates, 0, NDIS_802_11_LENGTH_RATES_EX);
 
@@ -278,9 +280,9 @@ void rtw_set_supported_rate(u8 *supported_rates, uint mode)
 	}
 }
 
-uint rtw_get_rateset_len(u8 *rateset)
+unsigned int rtw_get_rateset_len(u8 *rateset)
 {
-	uint i;
+	unsigned int i;
 
 	for (i = 0; i < 13; i++)
 		if (rateset[i] == 0)
@@ -573,11 +575,11 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 	return ret;
 }
 
-int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
+int rtw_get_wapi_ie(u8 *in_ie, unsigned int in_len, u8 *wapi_ie, u16 *wapi_len)
 {
 	int len = 0;
 	u8 authmode;
-	uint	cnt;
+	unsigned int	cnt;
 	u8 wapi_oui1[4] = {0x0, 0x14, 0x72, 0x01};
 	u8 wapi_oui2[4] = {0x0, 0x14, 0x72, 0x02};
 
@@ -616,11 +618,12 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 	return len;
 }
 
-void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
+void rtw_get_sec_ie(u8 *in_ie, unsigned int in_len, u8 *rsn_ie,
+		    u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len)
 {
 	u8 authmode;
 	u8 wpa_oui[4] = {0x0, 0x50, 0xf2, 0x01};
-	uint	cnt;
+	unsigned int	cnt;
 
 	/* Search required WPA or WPA2 IE and copy to sec_ie[ ] */
 
@@ -660,9 +663,9 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
  *
  * Returns: The address of the WPS IE found, or NULL
  */
-u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
+u8 *rtw_get_wps_ie(u8 *in_ie, unsigned int in_len, u8 *wps_ie, unsigned int *wps_ielen)
 {
-	uint cnt;
+	unsigned int cnt;
 	u8 *wpsie_ptr = NULL;
 	u8 eid, wps_oui[4] = {0x0, 0x50, 0xf2, 0x04};
 
@@ -713,7 +716,8 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
  *
  * Returns: the address of the specific WPS attribute found, or NULL
  */
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr)
+u8 *rtw_get_wps_attr(u8 *wps_ie, unsigned int wps_ielen,
+		     u16 target_attr_id, u8 *buf_attr, u32 *len_attr)
 {
 	u8 *attr_ptr = NULL;
 	u8 *target_attr_ptr = NULL;
@@ -772,7 +776,9 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, unsigned int wps_ielen,
+			     u16 target_attr_id, u8 *buf_content,
+			     unsigned int *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -795,7 +801,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	return NULL;
 }
 
-static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
+static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, unsigned int elen,
 					    struct rtw_ieee802_11_elems *elems,
 					    int show_errors)
 {
@@ -879,11 +885,11 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
  * @show_errors: Whether to show parsing errors in debug log
  * Returns: Parsing result
  */
-enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_result rtw_ieee802_11_parse_elems(u8 *start, unsigned int len,
 					     struct rtw_ieee802_11_elems *elems,
 					     int show_errors)
 {
-	uint left = len;
+	unsigned int left = len;
 	u8 *pos = start;
 	int unknown = 0;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e22e33c364bb..383ecac56136 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -588,7 +588,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	u32 desired_encmode;
 	u32 privacy;
-	uint wps_ielen;
+	unsigned int wps_ielen;
 	bool bselected = true;
 
 	desired_encmode = psecuritypriv->ndisencryptstatus;
@@ -605,7 +605,7 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
-		uint ie_len = 0;
+		unsigned int ie_len = 0;
 
 		if ((desired_encmode == Ndis802_11EncryptionDisabled) && (privacy != 0))
 			bselected = false;
@@ -1332,7 +1332,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 
 	/* to do : init sta_info variable */
 	psta->qos_option = 0;
-	psta->mac_id = (uint)pstassoc->cam_id;
+	psta->mac_id = (unsigned int)pstassoc->cam_id;
 
 	/* for ad-hoc mode */
 	rtw_hal_set_odm_var(adapter, HAL_ODM_STA_INFO, psta, true);
@@ -1953,7 +1953,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			unsigned int in_len, unsigned int initial_out_len)
 {
 	unsigned int ielength = 0;
 	unsigned int i, j;
@@ -2016,7 +2017,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 /*  13th element in the array is the IE length */
 /*  */
 
-static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint ie_len)
+static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, unsigned int ie_len)
 {
 	struct security_priv *psecuritypriv = &Adapter->securitypriv;
 
@@ -2035,7 +2036,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint
 
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
-	uint len;
+	unsigned int len;
 	u8 *buff, *p;
 	union iwreq_data wrqu;
 
@@ -2066,15 +2067,15 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 	}
 }
 
-signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
+signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len)
 {
 	u8 authmode = 0x0;
-	uint ielength;
+	unsigned int ielength;
 	int pmkid_idx;
 
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
-	uint ndisauthmode = psecuritypriv->ndisauthtype;
+	unsigned int ndisauthmode = psecuritypriv->ndisauthtype;
 
 	/* copy fixed ie only */
 	memcpy(out_ie, in_ie, 12);
@@ -2236,7 +2237,7 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
-void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, uint *pout_len)
+void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, unsigned int *pout_len)
 {
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
 	int out_len;
@@ -2251,7 +2252,9 @@ void rtw_build_wmm_ie_ht(struct adapter *adapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie,
+				    u8 *out_ie, unsigned int in_len,
+				    unsigned int *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2375,7 +2378,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *adapter, u8 *in_ie, u8 *out_i
 }
 
 /* the function is > passive_level (in critical_section) */
-void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel)
+void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, unsigned int ie_len, u8 channel)
 {
 	u8 *p, max_ampdu_sz;
 	int len;
@@ -2497,7 +2500,7 @@ void rtw_issue_addbareq_cmd(struct adapter *adapter, struct xmit_frame *pxmitfra
 	}
 }
 
-void rtw_append_exented_cap(struct adapter *adapter, u8 *out_ie, uint *pout_len)
+void rtw_append_exented_cap(struct adapter *adapter, u8 *out_ie, unsigned int *pout_len)
 {
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c39fb142302e..23349d444ae9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -503,7 +503,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*cur = &pmlmeinfo->network;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint len = precv_frame->u.hdr.len;
+	unsigned int len = precv_frame->u.hdr.len;
 	u8 is_valid_p2p_probereq = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
@@ -558,7 +558,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint len = precv_frame->u.hdr.len;
+	unsigned int len = precv_frame->u.hdr.len;
 	struct wlan_bssid_ex *pbss;
 	int ret = _SUCCESS;
 	u8 *p = NULL;
@@ -677,7 +677,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint len = precv_frame->u.hdr.len;
+	unsigned int len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
@@ -852,7 +852,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint pkt_len = precv_frame->u.hdr.len;
+	unsigned int pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
@@ -940,7 +940,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct wlan_bssid_ex	*cur = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint pkt_len = precv_frame->u.hdr.len;
+	unsigned int pkt_len = precv_frame->u.hdr.len;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
@@ -1337,7 +1337,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	uint i;
+	unsigned int i;
 	int res;
 	unsigned short	status;
 	struct ndis_80211_var_ie *pIE;
@@ -1346,7 +1346,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	/* struct wlan_bssid_ex			*cur_network = &(pmlmeinfo->network); */
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint pkt_len = precv_frame->u.hdr.len;
+	unsigned int pkt_len = precv_frame->u.hdr.len;
 
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
@@ -1742,7 +1742,7 @@ static unsigned int on_action_public_default(union recv_frame *precv_frame, u8 a
 {
 	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	uint frame_len = precv_frame->u.hdr.len;
+	unsigned int frame_len = precv_frame->u.hdr.len;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 token;
 	struct adapter *adapter = precv_frame->u.hdr.adapter;
@@ -2116,7 +2116,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 		{
 			u8 *wps_ie;
-			uint wps_ielen;
+			unsigned int wps_ielen;
 			u8 sr = 0;
 
 			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr + TXDESC_OFFSET +
@@ -2216,7 +2216,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 
 	u8 *pwps_ie;
-	uint wps_ielen;
+	unsigned int wps_ielen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -2269,10 +2269,10 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
-			uint wps_offset, remainder_ielen;
+			unsigned int wps_offset, remainder_ielen;
 			u8 *premainder_ie;
 
-			wps_offset = (uint)(pwps_ie - cur_network->ies);
+			wps_offset = (unsigned int)(pwps_ie - cur_network->ies);
 
 			premainder_ie = pwps_ie + wps_ielen;
 
@@ -2282,7 +2282,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			pframe += wps_offset;
 			pattrib->pktlen += wps_offset;
 
-			wps_ielen = (uint)pmlmepriv->wps_probe_resp_ie[1];/* to get ie data len */
+			/* to get ie data len */
+			wps_ielen = (unsigned int)pmlmepriv->wps_probe_resp_ie[1];
 			if ((wps_offset + wps_ielen + 2) <= MAX_IE_SZ) {
 				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen + 2);
 				pframe += wps_ielen + 2;
@@ -2322,7 +2323,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
 
 			if (ssid_ie &&  cur_network->ssid.ssid_length) {
-				uint remainder_ielen;
+				unsigned int remainder_ielen;
 				u8 *remainder_ie;
 
 				remainder_ie = ssid_ie + 2;
@@ -2676,7 +2677,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
-		uint ie_len = 0;
+		unsigned int ie_len = 0;
 
 		/* FILL HT CAP INFO IE */
 		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
@@ -2699,7 +2700,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 	/* FILL WMM IE */
 	if ((pstat->flags & WLAN_STA_WME) && (pmlmepriv->qospriv.qos_option)) {
-		uint ie_len = 0;
+		unsigned int ie_len = 0;
 		unsigned char WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 
 		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
@@ -4260,7 +4261,7 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	struct mlme_ext_priv *pmlmeext;
 	struct cmd_priv *pcmdpriv;
 	/* u8 *pframe = precv_frame->u.hdr.rx_data; */
-	/* uint len = precv_frame->u.hdr.len; */
+	/* unsigned int len = precv_frame->u.hdr.len; */
 
 	if (!padapter)
 		return;
@@ -5643,14 +5644,14 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	u8 evt_code;
 	u16 evt_sz;
-	uint	*peventbuf;
+	unsigned int	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
 	struct evt_priv *pevt_priv = &(padapter->evtpriv);
 
 	if (!pbuf)
 		goto _abort_event_;
 
-	peventbuf = (uint *)pbuf;
+	peventbuf = (unsigned int *)pbuf;
 	evt_sz = (u16)(*peventbuf & 0xffff);
 	evt_code = (u8)((*peventbuf >> 16) & 0xff);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fdc6c..7e58b1084354 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -924,7 +924,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct sta_info *psta = NULL;
-	/* uint len = precv_frame->u.hdr.len; */
+	/* unsigned int len = precv_frame->u.hdr.len; */
 
 	if (GetFrameType(pframe) != WIFI_CTRL_TYPE)
 		return _FAIL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 3de102a27517..68efbd09d5f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -618,9 +618,9 @@ static void construct_mic_iv(u8 *mic_iv,
 			     signed int qc_exists,
 			     signed int a4_exists,
 			     u8 *mpdu,
-			     uint payload_length,
+			     unsigned int payload_length,
 			     u8 *pn_vector,
-			     uint frtype)
+			     unsigned int frtype)
 {
 		signed int i;
 
@@ -656,7 +656,7 @@ static void construct_mic_iv(u8 *mic_iv,
 static void construct_mic_header1(u8 *mic_header1,
 				  signed int header_length,
 				  u8 *mpdu,
-				  uint frtype)
+				  unsigned int frtype)
 {
 		mic_header1[0] = (u8)((header_length - 2) / 256);
 		mic_header1[1] = (u8)((header_length - 2) % 256);
@@ -739,7 +739,7 @@ static void construct_ctr_preload(u8 *ctr_preload,
 				  u8 *mpdu,
 				  u8 *pn_vector,
 				  signed int c,
-				  uint frtype)
+				  unsigned int frtype)
 {
 	signed int i = 0;
 
@@ -765,10 +765,10 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
 
-static signed int aes_cipher(u8 *key, uint hdrlen,
-			     u8 *pframe, uint plen)
+static signed int aes_cipher(u8 *key, unsigned int hdrlen,
+			     u8 *pframe, unsigned int plen)
 {
-	uint	qc_exists, a4_exists, i, j, payload_remainder,
+	unsigned int	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
 
 	u8 pn_vector[6];
@@ -782,8 +782,8 @@ static signed int aes_cipher(u8 *key, uint hdrlen,
 	u8 aes_out[16] = {};
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
-	uint	frtype  = GetFrameType(pframe);
-	uint	frsubtype  = GetFrameSubType(pframe);
+	unsigned int	frtype  = GetFrameType(pframe);
+	unsigned int	frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -966,11 +966,11 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+static signed int aes_decipher(u8 *key, unsigned int	hdrlen,
+			 u8 *pframe, unsigned int plen)
 {
 	static u8 message[MAX_MSG_SIZE];
-	uint qc_exists, a4_exists, i, j, payload_remainder,
+	unsigned int qc_exists, a4_exists, i, j, payload_remainder,
 			num_blocks, payload_index;
 	signed int res = _SUCCESS;
 	u8 pn_vector[6];
@@ -985,8 +985,8 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	u8 padded_buffer[16] = {};
 	u8 mic[8];
 
-	uint frtype  = GetFrameType(pframe);
-	uint frsubtype  = GetFrameSubType(pframe);
+	unsigned int frtype  = GetFrameType(pframe);
+	unsigned int frsubtype  = GetFrameSubType(pframe);
 
 	frsubtype = frsubtype >> 4;
 
@@ -1252,7 +1252,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	u8 *pframe;
 	u8 *BIP_AAD, *p;
 	u32 res = _FAIL;
-	uint len, ori_len;
+	unsigned int len, ori_len;
 	struct ieee80211_hdr *pwlanhdr;
 	u8 mic[16];
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6d49dff616c2..ef410c4f4c54 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1256,7 +1256,8 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	return _SUCCESS;
 }
 
-void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, struct sta_info *psta)
+void update_beacon_info(struct adapter *padapter, u8 *pframe,
+			unsigned int pkt_len, struct sta_info *psta)
 {
 	unsigned int i;
 	unsigned int len;
@@ -1413,7 +1414,7 @@ static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
 	return Vender;
 }
 
-unsigned char check_assoc_AP(u8 *pframe, uint len)
+unsigned char check_assoc_AP(u8 *pframe, unsigned int len)
 {
 	unsigned int	i;
 	struct ndis_80211_var_ie *pIE;
@@ -1579,7 +1580,8 @@ void update_sta_basic_rate(struct sta_info *psta, u8 wireless_mode)
 	}
 }
 
-int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_len, int cam_idx)
+int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie,
+			    unsigned int var_ie_len, int cam_idx)
 {
 	unsigned int	ie_len;
 	struct ndis_80211_var_ie *pIE;
@@ -1627,7 +1629,7 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 	}
 }
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len)
 {
 	u8 *pIE;
 	__le32 *pbuf;
@@ -1647,7 +1649,7 @@ void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext)
 	rtw_hal_set_hwreg(padapter, HW_VAR_CORRECT_TSF, NULL);
 }
 
-void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
+void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len)
 {
 	int i;
 	u8 *pIE;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 95350fd6a94f..aa49dc2d0a1e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1382,9 +1382,9 @@ s32 rtw_put_snap(u8 *data, u16 h_proto)
 	return SNAP_SIZE + sizeof(u16);
 }
 
-void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len)
+void rtw_update_protection(struct adapter *padapter, u8 *ie, unsigned int ie_len)
 {
-	uint	protection;
+	unsigned int	protection;
 	u8 *perp;
 	signed int	 erp_len;
 	struct	xmit_priv *pxmitpriv = &padapter->xmitpriv;
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1369..67b21b777b44 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+unsigned int rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	unsigned int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -54,9 +54,9 @@ uint rtw_hal_init(struct adapter *padapter)
 	return status;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+unsigned int rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	unsigned int status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b63116525ca..b43a9c86a436 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+unsigned int rtw_hal_init(struct adapter *padapter);
+unsigned int rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9f421e4875b7..0f10574d2235 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -685,32 +685,38 @@ enum parse_result {
 	PARSE_FAILED = -1
 };
 
-enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
+enum parse_result rtw_ieee802_11_parse_elems(u8 *start, unsigned int len,
 					     struct rtw_ieee802_11_elems *elems,
 					     int show_errors);
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source, unsigned int *frlen);
-u8 *rtw_set_ie(u8 *pbuf, signed int index, uint len, u8 *source, uint *frlen);
+u8 *rtw_set_ie(u8 *pbuf, signed int index, unsigned int len, u8 *source, unsigned int *frlen);
 
 u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit);
-u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, uint *ielen);
-int rtw_ies_remove_ie(u8 *ies, uint *ies_len, uint offset, u8 eid, u8 *oui, u8 oui_len);
+u8 *rtw_get_ie_ex(u8 *in_ie, unsigned int in_len, u8 eid,
+		  u8 *oui, u8 oui_len, u8 *ie, unsigned int *ielen);
+int rtw_ies_remove_ie(u8 *ies, unsigned int *ies_len, unsigned int offset,
+		      u8 eid, u8 *oui, u8 oui_len);
 
-void rtw_set_supported_rate(u8 *SupportedRates, uint mode);
+void rtw_set_supported_rate(u8 *SupportedRates, unsigned int mode);
 
 unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit);
 unsigned char *rtw_get_wpa2_ie(unsigned char *pie, int *rsn_ie_len, int limit);
 int rtw_get_wpa_cipher_suite(u8 *s);
 int rtw_get_wpa2_cipher_suite(u8 *s);
-int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len);
+int rtw_get_wapi_ie(u8 *in_ie, unsigned int in_len, u8 *wapi_ie, u16 *wapi_len);
 int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
 int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwise_cipher, int *is_8021x);
 
-void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
+void rtw_get_sec_ie(u8 *in_ie, unsigned int in_len, u8 *rsn_ie,
+		    u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
 
-u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen);
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content);
+u8 *rtw_get_wps_ie(u8 *in_ie, unsigned int in_len, u8 *wps_ie, unsigned int *wps_ielen);
+u8 *rtw_get_wps_attr(u8 *wps_ie, unsigned int wps_ielen,
+		     u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, unsigned int wps_ielen,
+			     u16 target_attr_id, u8 *buf_content,
+			     unsigned int *len_content);
 
 /**
  * for_each_ie - iterate over continuous IEs
@@ -722,7 +728,7 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	for (ie = (void *)buf; (((u8 *)ie) - ((u8 *)buf) + 1) < buf_len; \
 		ie = (void *)(((u8 *)ie) + *(((u8 *)ie) + 1) + 2))
 
-uint	rtw_get_rateset_len(u8 *rateset);
+unsigned int	rtw_get_rateset_len(u8 *rateset);
 
 struct registry_priv;
 int rtw_generate_ie(struct registry_priv *pregistrypriv);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 7709d5fd77a3..666c428e2fb8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -86,7 +86,7 @@ enum {
 
 struct sitesurvey_ctrl {
 	u64	last_tx_pkts;
-	uint	last_rx_pkts;
+	unsigned int	last_rx_pkts;
 	signed int	traffic_busy;
 	struct timer_list	sitesurvey_ctrl_timer;
 };
@@ -144,14 +144,14 @@ struct mlme_priv {
 	struct wlan_network	cur_network;
 	struct wlan_network *cur_network_scanned;
 
-	/* uint wireless_mode; no used, remove it */
+	/* unsigned int wireless_mode; no used, remove it */
 
 	u32 auto_scan_int_ms;
 
 	struct timer_list assoc_timer;
 
-	uint assoc_by_bssid;
-	uint assoc_by_rssi;
+	unsigned int assoc_by_bssid;
+	unsigned int assoc_by_rssi;
 
 	struct timer_list scan_to_timer; /*  driver itself handles scan_timeout status. */
 	unsigned long scan_start_time; /*  used to evaluate the time spent in scanning */
@@ -332,8 +332,9 @@ void rtw_indicate_connect(struct adapter *adapter);
 void rtw_indicate_scan_done(struct adapter *padapter, bool aborted);
 void rtw_scan_abort(struct adapter *adapter);
 
-int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len);
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len);
+int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, unsigned int in_len);
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			unsigned int in_len, unsigned int initial_out_len);
 void rtw_init_registrypriv_dev_network(struct adapter *adapter);
 
 void rtw_update_registrypriv_dev_network(struct adapter *adapter);
@@ -372,11 +373,13 @@ u8 *rtw_get_beacon_interval_from_ie(u8 *ie);
 void rtw_joinbss_reset(struct adapter *padapter);
 
 void rtw_ht_use_default_setting(struct adapter *padapter);
-void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len);
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel);
-void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channel);
+void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, unsigned int *pout_len);
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
+				    u8 *out_ie, unsigned int in_len,
+				    unsigned int *pout_len, u8 channel);
+void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, unsigned int ie_len, u8 channel);
 void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe);
-void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len);
+void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, unsigned int *pout_len);
 
 bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork);
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index d486cd462509..19a9b7bf9afd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -480,7 +480,7 @@ int is_client_associated_to_ap(struct adapter *padapter);
 int is_client_associated_to_ibss(struct adapter *padapter);
 int is_IBSS_empty(struct adapter *padapter);
 
-unsigned char check_assoc_AP(u8 *pframe, uint len);
+unsigned char check_assoc_AP(u8 *pframe, unsigned int len);
 
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void WMMOnAssocRsp(struct adapter *padapter);
@@ -493,13 +493,15 @@ void ERP_IE_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE);
 void VCS_update(struct adapter *padapter, struct sta_info *psta);
 void update_ldpc_stbc_cap(struct sta_info *psta);
 
-void update_beacon_info(struct adapter *padapter, u8 *pframe, uint len, struct sta_info *psta);
+void update_beacon_info(struct adapter *padapter, u8 *pframe,
+			unsigned int len, struct sta_info *psta);
 int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len);
 void update_IOT_info(struct adapter *padapter);
 void update_capinfo(struct adapter *Adapter, u16 updateCap);
 void update_wireless_mode(struct adapter *padapter);
 void update_sta_basic_rate(struct sta_info *psta, u8 wireless_mode);
-int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_len, int cam_idx);
+int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie,
+			    unsigned int var_ie_len, int cam_idx);
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta);
@@ -606,15 +608,15 @@ void sa_query_timer_hdl(struct timer_list *t);
 
 void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
 
-void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len);
 void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
-void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, unsigned int len);
 bool traffic_status_watchdog(struct adapter *padapter, bool from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
 struct cmd_hdl {
-	uint	parmsize;
+	unsigned int	parmsize;
 	u8 (*h2cfuns)(struct adapter *padapter, u8 *pbuf);
 };
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..1490b4acaa04 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -145,8 +145,8 @@ struct pwrctrl_priv {
 	u32 cur_ps_level;
 	u32 reg_rfps_level;
 
-	uint	ips_enter_cnts;
-	uint	ips_leave_cnts;
+	unsigned int	ips_enter_cnts;
+	unsigned int	ips_leave_cnts;
 
 	u8 ips_mode;
 	u8 ips_org_mode;
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 5c197bd6915f..ad51a97d11a8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -176,16 +176,16 @@ struct recv_priv {
 	struct __queue uc_swdec_pending_queue;
 	u8 *pallocated_frame_buf;
 	u8 *precv_frame_buf;
-	uint free_recvframe_cnt;
+	unsigned int free_recvframe_cnt;
 	struct adapter *adapter;
 	u32 bIsAnyNonBEPkts;
 	u64 rx_bytes;
 	u64 rx_pkts;
 	u64 rx_drop;
-	uint rx_icv_err;
-	uint rx_largepacket_crcerr;
-	uint rx_smallpacket_crcerr;
-	uint rx_middlepacket_crcerr;
+	unsigned int rx_icv_err;
+	unsigned int rx_largepacket_crcerr;
+	unsigned int rx_smallpacket_crcerr;
+	unsigned int rx_middlepacket_crcerr;
 
 	struct tasklet_struct irq_prepare_beacon_tasklet;
 	struct tasklet_struct recv_tasklet;
@@ -231,9 +231,9 @@ struct sta_recv_priv {
 
 	struct stainfo_rxcache rxcache;
 
-	/* uint	sta_rx_bytes; */
-	/* uint	sta_rx_pkts; */
-	/* uint	sta_rx_fail; */
+	/* unsigned int	sta_rx_bytes; */
+	/* unsigned int	sta_rx_pkts; */
+	/* unsigned int	sta_rx_fail; */
 
 };
 
@@ -288,7 +288,7 @@ struct recv_frame_hdr {
 
 	struct rx_pkt_attrib attrib;
 
-	uint len;
+	unsigned int len;
 	u8 *rx_head;
 	u8 *rx_data;
 	u8 *rx_tail;
@@ -308,10 +308,10 @@ union recv_frame {
 	union{
 		struct list_head list;
 		struct recv_frame_hdr hdr;
-		uint mem[RECVFRAME_HDR_ALIGN>>2];
+		unsigned int mem[RECVFRAME_HDR_ALIGN>>2];
 	} u;
 
-	/* uint mem[MAX_RXSZ>>2]; */
+	/* unsigned int mem[MAX_RXSZ>>2]; */
 
 };
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 873807fcd0dd..43dabdcfd0ba 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -291,9 +291,9 @@ struct sta_xmit_priv {
 
 	u16 txseq_tid[16];
 
-	/* uint	sta_tx_bytes; */
+	/* unsigned int	sta_tx_bytes; */
 	/* u64	sta_tx_pkts; */
-	/* uint	sta_tx_fail; */
+	/* unsigned int	sta_tx_fail; */
 
 
 };
@@ -305,8 +305,8 @@ struct	hw_txqueue	{
 	volatile signed int	free_sz;	/* in units of 64 bytes */
 	volatile signed int      free_cmdsz;
 	volatile signed int	 txsz[8];
-	uint	ff_hwaddr;
-	uint	cmd_hwaddr;
+	unsigned int	ff_hwaddr;
+	unsigned int	cmd_hwaddr;
 	signed int	ac_tag;
 };
 
@@ -335,15 +335,15 @@ struct	xmit_priv {
 
 	u8 *pallocated_frame_buf;
 	u8 *pxmit_frame_buf;
-	uint free_xmitframe_cnt;
+	unsigned int free_xmitframe_cnt;
 	struct __queue	free_xmit_queue;
 
-	/* uint mapping_addr; */
-	/* uint pkt_sz; */
+	/* unsigned int mapping_addr; */
+	/* unsigned int pkt_sz; */
 
 	u8 *xframe_ext_alloc_addr;
 	u8 *xframe_ext;
-	uint free_xframe_ext_cnt;
+	unsigned int free_xframe_ext_cnt;
 	struct __queue free_xframe_ext_queue;
 
 	/* struct	hw_txqueue	be_txqueue; */
@@ -352,7 +352,7 @@ struct	xmit_priv {
 	/* struct	hw_txqueue	vo_txqueue; */
 	/* struct	hw_txqueue	bmc_txqueue; */
 
-	uint	frag_len;
+	unsigned int	frag_len;
 
 	struct adapter	*adapter;
 
@@ -379,12 +379,12 @@ struct	xmit_priv {
 	struct __queue pending_xmitbuf_queue;
 	u8 *pallocated_xmitbuf;
 	u8 *pxmitbuf;
-	uint free_xmitbuf_cnt;
+	unsigned int free_xmitbuf_cnt;
 
 	struct __queue free_xmit_extbuf_queue;
 	u8 *pallocated_xmit_extbuf;
 	u8 *pxmit_extbuf;
-	uint free_xmit_extbuf_cnt;
+	unsigned int free_xmit_extbuf_cnt;
 
 	struct xmit_buf	pcmd_xmitbuf[CMDBUF_MAX];
 
@@ -409,7 +409,7 @@ extern struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
 void rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz);
-extern void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
+extern void rtw_update_protection(struct adapter *padapter, u8 *ie, unsigned int ie_len);
 extern int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
 extern s32 rtw_put_snap(u8 *data, u16 h_proto);
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index bc78c32192c0..c767474dc683 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -80,14 +80,14 @@ struct sta_info {
 	struct __queue sleep_q;
 	unsigned int sleepq_len;
 
-	uint state;
-	uint aid;
-	uint mac_id;
-	uint qos_option;
+	unsigned int state;
+	unsigned int aid;
+	unsigned int mac_id;
+	unsigned int qos_option;
 	u8 hwaddr[ETH_ALEN];
 
 	bool ieee8021x_blocked;
-	uint dot118021XPrivacy; /* aes, tkip... */
+	unsigned int dot118021XPrivacy; /* aes, tkip... */
 	union Keytype dot11tkiptxmickey;
 	union Keytype dot11tkiprxmickey;
 	union Keytype dot118021x_UncstKey;
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 9137057726ef..a051634f77b9 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -144,7 +144,7 @@ struct wlan_bssid_ex {
 	u8 ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
 } __packed;
 
-static inline uint get_wlan_bssid_ex_sz(struct wlan_bssid_ex *bss)
+static inline unsigned int get_wlan_bssid_ex_sz(struct wlan_bssid_ex *bss)
 {
 	return (sizeof(struct wlan_bssid_ex) - MAX_IE_SZ + bss->ie_length);
 }
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..e4796bc958f2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -145,8 +145,8 @@ module_param(rtw_antdiv_type, int, 0644);
 
 module_param(rtw_hw_wps_pbc, int, 0644);
 
-static uint rtw_max_roaming_times = 2;
-module_param(rtw_max_roaming_times, uint, 0644);
+static unsigned int rtw_max_roaming_times = 2;
+module_param(rtw_max_roaming_times, unsigned int, 0644);
 MODULE_PARM_DESC(rtw_max_roaming_times, "The max roaming times to try");
 
 module_param(rtw_mc2u_disable, int, 0644);
@@ -154,14 +154,14 @@ module_param(rtw_mc2u_disable, int, 0644);
 module_param(rtw_80211d, int, 0644);
 MODULE_PARM_DESC(rtw_80211d, "Enable 802.11d mechanism");
 
-static uint rtw_notch_filter;
-module_param(rtw_notch_filter, uint, 0644);
+static unsigned int rtw_notch_filter;
+module_param(rtw_notch_filter, unsigned int, 0644);
 MODULE_PARM_DESC(rtw_notch_filter, "0:Disable, 1:Enable, 2:Enable only for P2P");
 
 #define CONFIG_RTW_HIQ_FILTER 1
 
-static uint rtw_hiq_filter = CONFIG_RTW_HIQ_FILTER;
-module_param(rtw_hiq_filter, uint, 0644);
+static unsigned int rtw_hiq_filter = CONFIG_RTW_HIQ_FILTER;
+module_param(rtw_hiq_filter, unsigned int, 0644);
 MODULE_PARM_DESC(rtw_hiq_filter, "0:allow all, 1:allow special, 2:deny all");
 
 static int rtw_tx_pwr_lmt_enable;
-- 
2.43.0

