Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60016442391
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 15:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786980680; cv=none; b=Vp9ls39V9OAjwKvozD+WRgBGVIGDhgvvZNCystGdoP0aIfoPfPRrGP53SEaDOVEVHevfbtCqLuyXXjosRao3bhkNoXVIChuuc5z9Mi2arc7A13uXgKS3T0riSKmhQcRIi/UUb3Y16vRDEHydXTihDzCMTH8r6tVodv2FFDzcaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786980680; c=relaxed/simple;
	bh=C4arIdT+Md/eugbZ5imLgomw5bw1TQUJGazmQV+CfY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VtqFUB5VqTZ0vQtlx2/tJssJn633JZ+52kuApQh+1//y7RCG4ITKSa1LuBYAJbOy2jMS/iscmlJRVzO2bg5W+WlKNa9n6gZkZFiQNiRnWJRVbDf1ltIAEsinG+T2w8gSEe4iN89qs/woSn1vDJfGw85hlYMqHW9YwvS6xj7VeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWj+DiGd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWj+DiGd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e27035206so715674b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 08:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786980678; x=1787585478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWESBOj6gnzAYY8lBtR1WfrtkXfeTNWW4oedYJyMyOY=;
        b=BWj+DiGdvM+8OoT7n9WgPag/YQNM5GVWq70dSs/tcWM0dX/zYViQQn6wfoqezPKy3e
         HEA95jiORb3St7cWMrItkhaWcbmmj0nZSxcJehBkNJGoNfEjijk+9Pn3B6c0XNHywStz
         kXJw5OOsnbyzwBJwBdiDkIwE5AuZY3B9H525OpKvkMbnh4q0s9EPvn56n84nBdjJ5Mbi
         Djbq/qer3xqK0COjK5phGg+MvsKRyrA7aHw52zwSK7ZQBVN+RDuxyVIMeFVHFMhqAM8M
         X0XBqSpxAG2ax6m63CuaAkK1jhHdhrQoBs4TBCZrkjLGNg8d2spLP+OWm1nGV11eqSw1
         YXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786980678; x=1787585478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWESBOj6gnzAYY8lBtR1WfrtkXfeTNWW4oedYJyMyOY=;
        b=Jv6Xhfsur9ce/Gseij3M0S5C/mcat1PBs+lAlg1ANt+Q7DZZT/AndFhXECw6hE+/aa
         Xpir90GVzsdMTk8WmGbCAEacCPfggr7ISpuueSdrS5aCZfdVVbD4HkaEUs0DsJz1cAux
         wuTZiC/ctV1YlENEuJ4WNUy5HIXP/Xd6lNrG+3xc777Kxof4Ox+q8fAWa9aMZyXJl8t4
         G33rfigHTirfPO3E+aJwPax0Lb7v3fAXazPq2KWllNZeR+AswUs0OOpdJkYQmiFZ2mRY
         Ph6tampA8VzR+YPkG2Y5LYd9KrygbI729bJL4yd2/GxU8gWx/VV3WPVmGBxB2IFEAVBM
         aLzQ==
X-Gm-Message-State: AOJu0YzRJ1uv2q0qauE224gvjL2WIT8OdtOs6P5ND6dvHyUZXxuqcfkX
	/2QFZNFgc6cjTT6DCirjArMZaScMi9km36cpP0VIJA5QivCFJQAYtloy
X-Gm-Gg: AR+sD10IQD5F073HeAu0uddXDbV2RfH+l0BFUNLsWNLe3K0/X4sIdrrtjkcpvaREsW0
	crB/H6cSphQw/QVzTNMQXyuDPh8m6R+R73KK/KrjRC0wofq8Ogn4Z2AgaiP4TRT3CtQb2vUJU3F
	2pijlLKJq6vnVNwtwm9U0MH0jb9Uji9sG8cslssaETpy7mtpvHAMZrbDFj8Mor/YeTCXPSfkdvq
	qgl5A64G9qOnrcjprc7IJglwEAJvHkxye9Ps3HF3fPauf1b+LZ/AzcPKNquUD40iz2fs+xSMhmK
	Ybr6edZqn7+NLfjQ623eim/9IlS/qNIfqiOASSoeOGWMJ8WHRaLgO+hMtiW+KyuaidgS0adSe7c
	GU12Z+7kPrWA3EN1NWO2hMc+L7auW6E6C4vUFbnmGooO3/Lrd5wIAPJ4Xn56oybrav4CSvMCZui
	op0l6lF198LCprpXokQy0zinXkMmOnOE5zEcnGrPNqTWB8ZpOyW/zua0jraaB0u5+ooXtxuRRoJ
	kqaqKGl6kwQYbjF97EtqS2OHDbBBSSLvqXdtg==
X-Received: by 2002:a05:6a00:3314:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-851b877b4f2mr1592248b3a.13.1786980677512;
        Mon, 17 Aug 2026 08:31:17 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-0-40.dynamic-ip.hinet.net. [36.234.0.40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6fc1740sm508416b3a.49.2026.08.17.08.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:31:16 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variables in rtw_mlme.c
Date: Mon, 17 Aug 2026 23:29:47 +0800
Message-ID: <20260817152947.53607-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename several CamelCase variables to snake_case to comply with
kernel coding style, as flagged by checkpatch.pl:
  CHECK: Avoid CamelCase: <iEntry>
  CHECK: Avoid CamelCase: <backupPMKIDList>
  CHECK: Avoid CamelCase: <backupPMKIDIndex>
  CHECK: Avoid CamelCase: <backupTKIPCountermeasure>
  CHECK: Avoid CamelCase: <backupTKIPcountermeasure_time>
  CHECK: Avoid CamelCase: <bHwLDPCSupport>
  CHECK: Avoid CamelCase: <bHwSTBCSupport>
  CHECK: Avoid CamelCase: <bHwSupportBeamformer>
  CHECK: Avoid CamelCase: <bHwSupportBeamformee>

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 64 +++++++++++------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 10c50aa0b..415af0f1f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1084,12 +1084,12 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
 
-static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
+static struct rt_pmkid_list   backup_pmkid_list[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-	u8 backupPMKIDIndex = 0;
-	u8 backupTKIPCountermeasure = 0x00;
-	u32 backupTKIPcountermeasure_time = 0;
+	u8 backup_pmkid_index = 0;
+	u8 backup_tkip_countermeasure = 0x00;
+	u32 backup_tkip_countermeasure_time = 0;
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
@@ -1103,10 +1103,10 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  Backup the btkip_countermeasure information. */
 		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
 
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
-		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
-		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
+		memcpy(&backup_pmkid_list[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		backup_pmkid_index = adapter->securitypriv.PMKIDIndex;
+		backup_tkip_countermeasure = adapter->securitypriv.btkip_countermeasure;
+		backup_tkip_countermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
 
 		/* reset RX BIP packet number */
 		pmlmeext->mgnt_80211w_IPN_rx = 0;
@@ -1115,10 +1115,10 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 		/*  Added by Albert 2009/02/18 */
 		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
-		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
-		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backup_pmkid_list[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		adapter->securitypriv.PMKIDIndex = backup_pmkid_index;
+		adapter->securitypriv.btkip_countermeasure = backup_tkip_countermeasure;
+		adapter->securitypriv.btkip_countermeasure_time = backup_tkip_countermeasure_time;
 
 		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
 		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
@@ -2019,7 +2019,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 /*  13th element in the array is the IE length */
 /*  */
 
-static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie_len)
+static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint ie_len)
 {
 	struct security_priv *psecuritypriv = &Adapter->securitypriv;
 
@@ -2029,7 +2029,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 		ie_len++;
 		ie[ie_len] = 0;	/* PMKID count = 0x0100 */
 		ie_len++;
-		memcpy(&ie[ie_len], &psecuritypriv->PMKIDList[iEntry].PMKID, 16);
+		memcpy(&ie[ie_len], &psecuritypriv->PMKIDList[pmkid_idx].PMKID, 16);
 		ie_len += 16;
 		ie[13] += 18;/* PMKID length = 2+16 */
 	}
@@ -2073,7 +2073,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 {
 	u8 authmode = 0x0;
 	uint	ielength;
-	int iEntry;
+	int pmkid_idx;
 
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
@@ -2098,12 +2098,12 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
-	iEntry = SecIsInPMKIDList(adapter, pmlmepriv->assoc_bssid);
-	if (iEntry < 0)
+	pmkid_idx = SecIsInPMKIDList(adapter, pmlmepriv->assoc_bssid);
+	if (pmkid_idx < 0)
 		return ielength;
 
 	if (authmode == WLAN_EID_RSN)
-		ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
+		ielength = rtw_append_pmkid(adapter, pmkid_idx, out_ie, ielength);
 
 	return ielength;
 }
@@ -2207,8 +2207,8 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	bool		bHwLDPCSupport = false, bHwSTBCSupport = false;
-	bool		bHwSupportBeamformer = false, bHwSupportBeamformee = false;
+	bool		hw_ldpc_support = false, hw_stbc_support = false;
+	bool		hw_support_beamformer = false, hw_support_beamformee = false;
 
 	if (pregistrypriv->wifi_spec)
 		phtpriv->bss_coexist = 1;
@@ -2219,39 +2219,39 @@ void rtw_ht_use_default_setting(struct adapter *padapter)
 	phtpriv->sgi_20m = TEST_FLAG(pregistrypriv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
-	rtw_hal_get_def_var(padapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
+	rtw_hal_get_def_var(padapter, HAL_DEF_RX_LDPC, (u8 *)&hw_ldpc_support);
 	CLEAR_FLAGS(phtpriv->ldpc_cap);
-	if (bHwLDPCSupport) {
+	if (hw_ldpc_support) {
 		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(4)))
 			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
-	rtw_hal_get_def_var(padapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
-	if (bHwLDPCSupport) {
+	rtw_hal_get_def_var(padapter, HAL_DEF_TX_LDPC, (u8 *)&hw_ldpc_support);
+	if (hw_ldpc_support) {
 		if (TEST_FLAG(pregistrypriv->ldpc_cap, BIT(5)))
 			SET_FLAG(phtpriv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
 
 	/*  STBC */
-	rtw_hal_get_def_var(padapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
+	rtw_hal_get_def_var(padapter, HAL_DEF_TX_STBC, (u8 *)&hw_stbc_support);
 	CLEAR_FLAGS(phtpriv->stbc_cap);
-	if (bHwSTBCSupport) {
+	if (hw_stbc_support) {
 		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(5)))
 			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
-	rtw_hal_get_def_var(padapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
-	if (bHwSTBCSupport) {
+	rtw_hal_get_def_var(padapter, HAL_DEF_RX_STBC, (u8 *)&hw_stbc_support);
+	if (hw_stbc_support) {
 		if (TEST_FLAG(pregistrypriv->stbc_cap, BIT(4)))
 			SET_FLAG(phtpriv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
 
 	/*  Beamforming setting */
-	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&bHwSupportBeamformer);
-	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
+	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&hw_support_beamformer);
+	rtw_hal_get_def_var(padapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&hw_support_beamformee);
 	CLEAR_FLAGS(phtpriv->beamform_cap);
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && bHwSupportBeamformer)
+	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(4)) && hw_support_beamformer)
 		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
 
-	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
+	if (TEST_FLAG(pregistrypriv->beamform_cap, BIT(5)) && hw_support_beamformee)
 		SET_FLAG(phtpriv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
-- 
2.43.0

