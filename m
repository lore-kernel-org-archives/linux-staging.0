Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8256D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f10so8761021wml.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lCfuu08NjMYhv5PuIppJ+v+CEj6fiVf/mdmZGX10GxA=;
        b=luL/RkGgFNyn53BCcVkWJUVIBubk8oXNdZbrXhtrD7vq0K14kQHDqhM7OC37WwG2rf
         jaNIDK0PcnO+A5Nrtp0xMORLGAqZAR/TPyaOJmaco8k5e41xOPMoaUpj4rZ6uO9dj3mg
         689mquNpku0gQui+hs1+jdql0Hn+iF4/hfUGhE9dp2dhhWflnPQpDCscrzLjSJzGjrA3
         umu35LwTK2suvs22bbMYXXPWUvFUC2+gDxeYgjc/DNKktPgZ4Sx1rmeLXLSolc22kgeP
         STEdjlk10auQKwFva86KPzClg7AGmYHgBBNP43znrB0Lwt5izTCIhPNPfqjUU6NFxZ/7
         IdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lCfuu08NjMYhv5PuIppJ+v+CEj6fiVf/mdmZGX10GxA=;
        b=AxXN8ZWL6en5kRA6fXK96sEDSUZBFk9BNGf2cs25cL+6VVIsjr32xaV7yQaGs4UaIs
         cNR8Eqk0rEDHYFu2ei1H/+WZS7E4FjYnxmzUS2oBmvW7M4MXJ69FqgBqAkliyqydgKY0
         uIBHgdHOQ4mMl3vBkch0+NswzhZB1o5JbrvUOe4iAApzRIPw3K5vI4m59Y9kIoEw84pC
         gEuy10zQC6whcI62bsyM+DZ6HYI9NdM1Er+h4gLV+ftT6DYhhfpnaal/M+CwdVxjKpSL
         TnmMzOBqc1GVgEv58R2RRkp5FPk2GT33962nLMgpV06c0f9PrMXv04jc6O83zt1Q3Vmj
         gS4g==
X-Gm-Message-State: AOAM533Qrm+UDApPLiHIWKzbjj/zPnCgrpW7aSQxjAxabSMqw8TlDwFX
	TUQGY3VgItdVZR7pVr4VlGw=
X-Google-Smtp-Source: ABdhPJyXhLNCQAkwZ1nPyBu9fyyEmRu1N17Y2I/pX+roEcNrzmynjtU2LRygvlUfmOkOllJJws9snA==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr15538572wmb.112.1629129568552;
        Mon, 16 Aug 2021 08:59:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/23] staging: r8188eu: clean up spacing style issues in core/rtw_ioctl_set.c
Date: Mon, 16 Aug 2021 17:58:03 +0200
Message-Id: <20210816155818.24005-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up spacing style issues in core/rtw_ioctl_set.c reported by
checkpatch.

CHECK: spaces preferred around that ...
WARNING: space prohibited before semicolon

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index bb6bc6508255..edfea5ad8259 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -154,7 +154,7 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if (!memcmp(&pmlmepriv->cur_network.network.MacAddress, bssid, ETH_ALEN)) {
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false)
 				goto release_mlme_lock;/* it means driver is in WIFI_ADHOC_MASTER_STATE, we needn't create bss again. */
@@ -228,7 +228,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 		goto release_mlme_lock;
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.SsidLength == ssid->SsidLength) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.Ssid, ssid->Ssid, ssid->SsidLength))) {
 			if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -389,7 +389,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		goto exit;
 	}
 
-	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING)) ||
+	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) ||
 	    (pmlmepriv->LinkDetectInfo.bBusyTraffic)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
@@ -623,8 +623,8 @@ u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
 		struct ndis_802_11_wep *wep = &padapter->securitypriv.ndiswep;
 
 		wep->Length = len;
-		keyindex = key->KeyIndex&0x7fffffff;
-		wep->KeyIndex = keyindex ;
+		keyindex = key->KeyIndex & 0x7fffffff;
+		wep->KeyIndex = keyindex;
 		wep->KeyLength = key->KeyLength;
 
 		memcpy(wep->KeyMaterial, key->KeyMaterial, key->KeyLength);
@@ -654,7 +654,7 @@ u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
 
 		if (bgrouptkey)
 			padapter->securitypriv.dot118021XGrpKeyid = (u8)key->KeyIndex;
-		if ((key->KeyIndex&0x3) == 0) {
+		if ((key->KeyIndex & 0x3) == 0) {
 			ret = _FAIL;
 			goto exit;
 		}
@@ -796,9 +796,9 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 		return 0;
 
 	if (pmlmeext->cur_wireless_mode & (WIRELESS_11_24N)) {
-		p = rtw_get_ie(&pcur_bss->IEs[12], _HT_CAPABILITY_IE_, &ht_ielen, pcur_bss->IELength-12);
+		p = rtw_get_ie(&pcur_bss->IEs[12], _HT_CAPABILITY_IE_, &ht_ielen, pcur_bss->IELength - 12);
 		if (p && ht_ielen > 0) {
-			pht_capie = (struct ieee80211_ht_cap *)(p+2);
+			pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 
 			memcpy(&mcs_rate, pht_capie->mcs.rx_mask, 2);
 
@@ -819,7 +819,7 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 		}
 	} else {
 		while ((pcur_bss->SupportedRates[i] != 0) && (pcur_bss->SupportedRates[i] != 0xFF)) {
-			rate = pcur_bss->SupportedRates[i]&0x7F;
+			rate = pcur_bss->SupportedRates[i] & 0x7F;
 			if (rate > max_rate)
 				max_rate = rate;
 			i++;
-- 
2.32.0

