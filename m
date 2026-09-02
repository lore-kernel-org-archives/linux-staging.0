Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4D7383C99
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370773; cv=none; b=Vl2GwHYqXZgvLt5Bm8MCc1xyS6+sBY5h5KQU/b1cuDaP4qyzEs3LX3h/9P7hZvZa3YfM4d0XD2mMYxV2+3O9t7LotjWNqVZenrpcp+DFGWjlmCY8kGcbh8kFSRzqYwNwNi1WSBzXob0cleLKvlIvWtdwEeAwxUmvADDgYUFAh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370773; c=relaxed/simple;
	bh=3dbmWb2Qm1pKmZpCcrRSZOxmIsBhjnhrHRw39IOonQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyGfE5I34Uixf5Da6g1UCHKPr3Irs0mThlWJA/3k4UTd7/ZffZF4Y866peVj8sOBPMrCypYp+W9fklpfK+uNVCM72Iux3zgnf0yLOMTPuyNDMYmknCmhjm5OzfJ7tIbGp5EtI4IN0cXYGse2pIyjLGKtwr/pCwGD5l4NuzB5mJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSpnteqO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSpnteqO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-853e2610bb4so85996b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788370771; x=1788975571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFloIhfQ4q+BWHAjn27okStJlZfzSzoO/QTCMXzRVxc=;
        b=bSpnteqOsahemglv3QgGT3oR3iU6cBFcqIBgZz9SNFTLycb/Lo+JuC4ooP+8vEWXY9
         gyz+sujr2xbrZImCRBkNXaeqGGTSEvPD2uhs0L3RFEPAFjq2ulTYjEM9UEUVO8z95gLs
         zaTNTOk799igdh8hzBe2ybXcVnPKYVqNJNkjZ8UtatjUJbnUrZLZfBGI+fbyWEN+rugl
         +AxX8cEYT9HVkypkSSgcjT3cqnwqmCxzxvCI0C09W8Wi/f3vui8DHTiqYafFkICCjIhn
         7b+Bu3ffrT/AurkBgszn8Ztk9IwSso5YGo1oma23+lHZRmAeftXpwgIZsbOm/n0VbMmo
         ILMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788370771; x=1788975571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFloIhfQ4q+BWHAjn27okStJlZfzSzoO/QTCMXzRVxc=;
        b=iIrjuwu9HobEftAYv3sTE5zZP/bKMml5BEqmS7hBE1bC9XgzAH+LYCQHFmFnpiMKkf
         5sBAcFH2ynj4/AWqDiy9DSfy/qPmv4oibPIjr71nohnhaUZL/jqdiSC+70klXqgJCVpt
         ZVbwtPQdOJ/gLLsi88y1G2+wLGywjSQm3833ifKAj9lzfZdg9cqIixgSIoGh9rqSYRnA
         FS1Y6L9h8tSffPoncRLdvX1GSuFK4bGUAZJsZOnjz5SuDvRKhH4dGIj55L14k5fViI9w
         ocs1zBf5//2Lpau1f/dSKYDv1DDrg8Ko5jT85n1dPJbtOzF0OXhadC5zlkfhhgKps5jQ
         QvIg==
X-Gm-Message-State: AFuF++nYe8vRmoF7nTZCQl4HjrCAZi+MjYllyUZMriRRj2MRW4jcm7SU
	rx6mSRObv0zcwelt7dUqpdsMciZvZ5DXm7usrESlS+qbyIlWC5WVLmFa
X-Gm-Gg: AYBFou0vKrrMzGSQ4bwQ/F91aNjlxXBb1FTdAaBAy5wp3HHVP1N0Xyi5zYVAJoV31ca
	HdE1qsdMNV+UtjtSKa4j9IVUjiWEIqJ5iDjOlVLWy+PW2qOjyL+lDeXaS9VM+/Vsop/56gK/yx7
	3eTCN7ZAR3V6S+Sft0kGMC9nrSkWHoJM1eTr63ZSmdECPJ6pTsVnguJ+7Ciqy7MAMYOif/eSG7C
	2UTC38fRO73AJXBDt3IKhIT8Yzil+unrSjXeDStvlCEx/X0/qpXfxmi9VSQpavvz1hfQyb7UfKb
	SuF1rT6SDZaQdNZgs/DfBYLMn+l6r7CyyCTC/VeB6XPyCaIwmNuo+uAr6CBoKEreeoy5srLBgfj
	5Yf+QgPK7s1BpZb3X4qlkJthCLD08nvPmAHRPuHLR5fqzF5Fdo0GXJ6ne6xR9xnHi5XLLxaE8+X
	c6J7R+gzBPalGF8QsR6lhi7OCq2ON/WQ6FTB2JkVZgPrrntFkb+DBzQRPTFu2EZv0IhUp5g9Cvt
	GdiOoccUFYncgeypD4xGOx0RTANvIFG3gWELbk=
X-Received: by 2002:a05:6a00:4187:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-85ffb4b6d31mr607749b3a.3.1788370771012;
        Wed, 02 Sep 2026 10:39:31 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-4-160.dynamic-ip.hinet.net. [36.234.4.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db23f7bccsm1863255b3a.10.2026.09.02.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:39:30 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variables in rtw_mlme.c
Date: Thu,  3 Sep 2026 01:39:01 +0800
Message-ID: <20260902173901.50435-1-s950343@gmail.com>
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

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 36 +++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 179061239a6f..35729e61cd07 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1080,12 +1080,12 @@ static void rtw_joinbss_update_network(struct adapter *adapter, struct wlan_netw
 	rtw_update_ht_cap(adapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
 
-static struct rt_pmkid_list backupPMKIDList[NUM_PMKID_CACHE];
+static struct rt_pmkid_list backup_pmkid_list[NUM_PMKID_CACHE];
 void rtw_reset_securitypriv(struct adapter *adapter)
 {
-	u8 backupPMKIDIndex = 0;
-	u8 backupTKIPCountermeasure = 0x00;
-	u32 backupTKIPcountermeasure_time = 0;
+	u8 backup_pmkid_index = 0;
+	u8 backup_tkip_countermeasure = 0x00;
+	u32 backup_tkip_countermeasure_time = 0;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	spin_lock_bh(&adapter->security_key_mutex);
@@ -1098,10 +1098,10 @@ void rtw_reset_securitypriv(struct adapter *adapter)
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
@@ -1110,10 +1110,10 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
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
@@ -2013,7 +2013,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 /*  13th element in the array is the IE length */
 /*  */
 
-static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie_len)
+static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint ie_len)
 {
 	struct security_priv *psecuritypriv = &Adapter->securitypriv;
 
@@ -2023,7 +2023,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 		ie_len++;
 		ie[ie_len] = 0;	/* PMKID count = 0x0100 */
 		ie_len++;
-		memcpy(&ie[ie_len], &psecuritypriv->PMKIDList[iEntry].PMKID, 16);
+		memcpy(&ie[ie_len], &psecuritypriv->PMKIDList[pmkid_idx].PMKID, 16);
 		ie_len += 16;
 		ie[13] += 18;/* PMKID length = 2+16 */
 	}
@@ -2067,7 +2067,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 {
 	u8 authmode = 0x0;
 	uint ielength;
-	int iEntry;
+	int pmkid_idx;
 
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
@@ -2092,12 +2092,12 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
-	iEntry = SecIsInPMKIDList(adapter, mlme_priv->assoc_bssid);
-	if (iEntry < 0)
+	pmkid_idx = SecIsInPMKIDList(adapter, mlme_priv->assoc_bssid);
+	if (pmkid_idx < 0)
 		return ielength;
 
 	if (authmode == WLAN_EID_RSN)
-		ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
+		ielength = rtw_append_pmkid(adapter, pmkid_idx, out_ie, ielength);
 
 	return ielength;
 }
-- 
2.43.0

