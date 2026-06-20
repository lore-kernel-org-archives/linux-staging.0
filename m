Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13B92FFF89
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977394; cv=none; b=hopellMwhx+vZK12UmfIIv/g0E5XuLtQpxAzNoE5UoBaDS76AqZltPzS5F1Tn3bX2QldiJtu4LRIBiTruhtw9ie0C96iRTlt2zsYb/snIr3mKbc6sYLdmMWW0zBomCTt6o5fCi2DVWgzBRAths6x2E9CNg+jFkM5HCvfwKM4U1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977394; c=relaxed/simple;
	bh=qXIspo1TANR4ShgA5E1XOV89aIBGVJb2hpTmY05IzgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U2hROK6kRfH7W9GZOsuDyVsRWRcQEY8ZM+wtqi74e0pYTPwRTVB/30EnsOf7sdAdy/zBSRBfNfnIUY+9t/cl+S6fvgp96mSyunLYN+JzVKPJaKBW5atsR+wadxotYisWZkvDgnVwu5AhL38M87ASlsgXwKjwBIAbrZLPOJ75whQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqBgubV5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqBgubV5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49230a567a9so14637905e9.0
        for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781977391; x=1782582191; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u38JOwl8ityepdhbMymTpLk1T1Oq2KdZBkK/GsnaiYM=;
        b=XqBgubV5YT6iBOQXBNw0fry/aE75Ac6o18cpVx1XYLbn/NBtOrWD/Cmy6P/WfkuXGe
         sjEHUehYAYVisJFLpsSSa8sBSSb/0HbPiqadbozDOUKHrSBYZhVAHP7FMnqhP6Th3e+V
         usv06BSRnVYqQq7tNvwRJjEHWGWJ9itawjuv/0iq3efcl3Meegzet0m6dtgCWY/xgkwj
         FNl4PeSmUIQk/DMqCHSliK/hNWiJUYMJkN+q2WotPh2rUrOEtP6spsdgOmEYIariMvx2
         5qojYQGpFvxSAIqnflue5YxNY+WKcdJl+42UEeypv8WGXGhN8xOpCb1kElWuJ5adIRke
         gx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781977391; x=1782582191;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u38JOwl8ityepdhbMymTpLk1T1Oq2KdZBkK/GsnaiYM=;
        b=gt5xWOMZOemLb2YwCb0yjCjk9qW8/YNWT3Ez2EnTKE/1mo/qWfwBpBF7opV8LPyG/m
         uoIxcp+AsA2yGU/kZEl8VwgE1dgzlbCnJ6Utt0rfGIhgZ+cRt9Yngsa+Q1zAyqFUXKSe
         o5/pRvnxQSt+awRmpMlTBHTWcLQBTAccaRER6xXMUBZVU4vWbRll5RqyBO4IDwlXCAIi
         9qASjQUX7mUZQgn8GnzfvveamRKtMLNqEOwUKFEusQUbyOrrfEph7pPD8FwZe4a5QmYE
         tBSrVj0Li43yHPgVgoyJLOgvKOM1wkHZbZ425hYCIzXQF69KCFJEqqBbR3//1BsAVbUl
         bMEQ==
X-Gm-Message-State: AOJu0Yx5PfU4YZCbac2HHIDkRk0oYAFtpHJ8Gs4HWx8GMpg7VN1/wa8p
	Mo3rhXgzwhq0Tu6mbiOjyIJOXu9EtwWJOIII1cy3c0ZJOxcbQd5Dxzaj
X-Gm-Gg: AfdE7cmIttr/XaJOhFEW3N7XEQypla/Go/ys2v6Y0uf+xdq7HlnO2w4WN9cVOzXHmSz
	dI2XotaNQpZuyJxB9amv5K/ZOsUD+XEelrJN8IBX/fJxAEJ55Rai0xS3TS6CPFH3dTWrSu4d/tW
	tszy4SpMddKRQbPCaRB7XQKJBn1ZE4yfveUxYnUNwHTcPVbe4sDW7cBKnFwJOBLKvsB7iC7fkzA
	H+H0NfhB18+EB3Ptbrv/hKnHCsMCtSUUMrYpnkix9GLfHilGVSjL5OT/HeWYvMPCgzYehtKg6Pw
	WJEyZevm5u5u0SbOzTGSayhnGrUIj3Z701ROjBYEnObHBPk+XakO49BA8hdgzZOkMgcXlpEUSLb
	92tBs4CLw6IZvduHvu+E6huI3wacPW0DHpByGWypReOMVU3mPRcuqIE3QjgRE9vg3AcrVS34DQR
	zLGMhcJ4liWq0Nm2rCsYAPQR+K8uxS8MJF0u9Y0RxLdaxb8tkSjHrgX4y9M46xaZvib666VOjtM
	y9eaw==
X-Received: by 2002:a05:600d:6402:20b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-49240eb56b9mr99864455e9.37.1781977390943;
        Sat, 20 Jun 2026 10:43:10 -0700 (PDT)
Received: from localhost (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15470sm180672645e9.2.2026.06.20.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:43:10 -0700 (PDT)
Date: Sat, 20 Jun 2026 17:41:54 +0000
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix Alignment should match open
 parenthesis in rtw_mlme.c
Message-ID: <ajbQ4m5HAaL2yflQ@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Align continuation lines which weren't properly aligned.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4fb74729180f..3f66fc36d2fc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -265,7 +265,7 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 bool rtw_if_up(struct adapter *padapter)
 {
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		!check_fwstate(&padapter->mlmepriv, _FW_LINKED))
+	    !check_fwstate(&padapter->mlmepriv, _FW_LINKED))
 		return false;
 
 	return true;
@@ -331,7 +331,7 @@ bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		return false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -406,7 +406,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -457,7 +457,7 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
@@ -1064,7 +1064,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	}
 
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+			      (cur_network->network.ie_length));
 
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
@@ -1432,7 +1432,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
@@ -1991,7 +1991,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
-- 
2.54.0

