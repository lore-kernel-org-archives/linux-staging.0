Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6F76D0E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 23:15:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 12so25222375lfq.13
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 16:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=5pkQa+A/3vvq9xfKOGYJ3q2RAzOOAi/VcGGX+q7kLaM=;
        b=MsU2ypYIm96M1lDHBb2kyQlGtYzKB2+EkUX2xvmRupzB+ZMBfzKIWFaD37cPrlkmdX
         8bh2Rr19ybpTcoUyGWvAHpmG/+omnXaxlAjzYqIPZssGoWk5KK8m2NVxVtaihHIFvAW7
         BLESsXgIfTanW8+dnB931ZaMlvAGFRliaJfUvq1Iz1MLnXDJLS/rHW1W0DiqzpfVstFE
         eRKYkJVarJt7dNe1cVf2W4sFxu+oEwqT1oyBPQ3emuRknVjVZAHQ2Un9/c4Wmjq41LGB
         +T6KG/P3VgHkP2rUpjzDNCZnNJQwiZz71N3ZyiWBiSjL8RF1FFv/BiN0fggWxld33kpx
         NBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=5pkQa+A/3vvq9xfKOGYJ3q2RAzOOAi/VcGGX+q7kLaM=;
        b=BQfZc8K61HYPZ/U+0QPUAryKZpgqKQtJk1p9Ha7G/ppAqOjXPZYVYQS18nsPmcI19f
         G8k1FaZU4TP4D1YhF4Zk0FGr2IUtRorqduAga7C4M80owftxkG3UbWsJjhKsNd+0Cij7
         5EHOjuPF3Jr8ZcgOAzntYrAqxh9MotLbc7bdEayzuKhkBY+tfPVIxOUEkfjV1P2cj8if
         +fqo4z7EcxMA0jnYMbcQVNi4R8Zt1dKJR/+AYxAUsablCuoq1OkMDSUsLnxJOIUKmPld
         XgOj0TaHgheT+INDi8D90I7PhtrP2owIv6+UQ6s9GUui/ChE14iww1eM2M+7PZPHB8bd
         Mj7g==
X-Gm-Message-State: AOAM533j5c2tnqh4Yysgz478YhcbBvYgIjAfx7R8BuAsJjBdkqOOP7vX
	ToJ3jXnrWxd9aAwj+r2EHuU=
X-Google-Smtp-Source: ABdhPJyLrn4XSp1drEpJbRw1apLx7m/8GlGLpuoM0WYW7MJ2TNaXbGVh2QaH7cgvsI+yIPzj1tyNIg==
X-Received: by 2002:a05:6512:3741:: with SMTP id a1mr384023lfs.121.1617750919878;
        Tue, 06 Apr 2021 16:15:19 -0700 (PDT)
Received: from test-VirtualBox ([87.116.183.186])
        by smtp.gmail.com with ESMTPSA id j15sm2284211lfm.138.2021.04.06.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 16:15:19 -0700 (PDT)
Date: Wed, 7 Apr 2021 01:15:17 +0200
From: Sergei Krainov <sergei.krainov.lkd@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: rtl8712: avoid multiple line dereference
Message-ID: <20210406231517.GA30925@test-VirtualBox>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

fix post-commit hook checkpatch issues:

WARNING: Avoid multiple line dereference - prefer 'adapter->mlmepriv.cur_network.network.InfrastructureMode'
+			adapter->mlmepriv.cur_network.network.
+			InfrastructureMode)

WARNING: Avoid multiple line dereference - prefer 'adapter->registrypriv.dev_network.MacAddress'
+						 adapter->registrypriv.
+							dev_network.MacAddress;

WARNING: Avoid multiple line dereference - prefer 'pnetwork->network.Configuration.FHConfig.DwellTime'
+		 le32_to_cpu(pnetwork->network.Configuration.FHConfig.
+			     DwellTime);

WARNING: Avoid multiple line dereference - prefer 'pnetwork->network.Configuration.FHConfig.HopPattern'
+		 le32_to_cpu(pnetwork->network.Configuration.
+			     FHConfig.HopPattern);

WARNING: Avoid multiple line dereference - prefer 'pmlmepriv->scanned_queue'
+					    r8712_find_network(&pmlmepriv->
+					    scanned_queue,

WARNING: Avoid multiple line dereference - prefer 'pmlmepriv->scanned_queue'
+					     r8712_find_network(&pmlmepriv->
+					     scanned_queue,

WARNING: Avoid multiple line dereference - prefer 'pstapriv->sta_hash_lock'
+					spin_lock_irqsave(&pstapriv->
+						sta_hash_lock, irqL2);

WARNING: Avoid multiple line dereference - prefer 'pstapriv->sta_hash_lock'
+					spin_unlock_irqrestore(&(pstapriv->
+						sta_hash_lock), irqL2);

WARNING: Avoid multiple line dereference - prefer 'pmlmepriv->scanned_queue'
+						 r8712_find_network(&pmlmepriv->
+						 scanned_queue,

WARNING: Avoid multiple line dereference - prefer 'pnetwork->network.MacAddress'
+						 pnetwork->network.
+						 MacAddress);

WARNING: Avoid multiple line dereference - prefer 'pmlmepriv->scanned_queue'
+				ptarget_wlan = r8712_find_network(&pmlmepriv->
+						scanned_queue,

WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.AuthAlgrthm'
+					if (adapter->securitypriv.
+					    AuthAlgrthm == 2) {

WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.binstallGrpkey'
+						adapter->securitypriv.
+							binstallGrpkey =

WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.busetkipkey'
+						adapter->securitypriv.
+							busetkipkey =

WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.bgrpkey_handshake'
+						adapter->securitypriv.
+							bgrpkey_handshake =

WARNING: Avoid multiple line dereference - prefer 'adapter->securitypriv.PrivacyAlgrthm'
+							 adapter->securitypriv.
+							 PrivacyAlgrthm;

WARNING: Avoid multiple line dereference - prefer 'ptarget_sta->x_UncstKey'
+						memset((u8 *)&ptarget_sta->
+							 x_UncstKey,

WARNING: Avoid multiple line dereference - prefer 'ptarget_sta->tkiprxmickey'
+						memset((u8 *)&ptarget_sta->
+							 tkiprxmickey,

WARNING: Avoid multiple line dereference - prefer 'ptarget_sta->tkiptxmickey'
+						memset((u8 *)&ptarget_sta->
+							 tkiptxmickey,

WARNING: Avoid multiple line dereference - prefer 'ptarget_sta->txpn'
+						memset((u8 *)&ptarget_sta->
+							 txpn, 0,

WARNING: Avoid multiple line dereference - prefer 'ptarget_sta->rxpn'
+						memset((u8 *)&ptarget_sta->
+							 rxpn, 0,

WARNING: Avoid multiple line dereference - prefer 'tgt_network->network'
+				r8712_get_wlan_bssid_ex_sz(&tgt_network->
+							network));

WARNING: Avoid multiple line dereference - prefer 'pmlmepriv->cur_network.network'
+					if (is_same_network(&pmlmepriv->
+					    cur_network.network,

Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 73 +++++++++-----------------
 1 file changed, 25 insertions(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index 8a97307fbbd6..26acb4069d3d 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -431,8 +431,7 @@ static int is_desired_network(struct _adapter *adapter,
 		bselected = false;
 	if (check_fwstate(&adapter->mlmepriv, WIFI_ADHOC_STATE)) {
 		if (pnetwork->network.InfrastructureMode !=
-			adapter->mlmepriv.cur_network.network.
-			InfrastructureMode)
+			adapter->mlmepriv.cur_network.network.InfrastructureMode)
 			bselected = false;
 	}
 	return bselected;
@@ -539,8 +538,7 @@ void r8712_surveydone_event_callback(struct _adapter *adapter, u8 *pbuf)
 					struct wlan_bssid_ex *pdev_network =
 					  &(adapter->registrypriv.dev_network);
 					u8 *pibss =
-						 adapter->registrypriv.
-							dev_network.MacAddress;
+						 adapter->registrypriv.dev_network.MacAddress;
 					pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
 					memcpy(&pdev_network->Ssid,
 						&pmlmepriv->assoc_ssid,
@@ -688,11 +686,9 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
 	pnetwork->network.Configuration.DSConfig =
 		 le32_to_cpu(pnetwork->network.Configuration.DSConfig);
 	pnetwork->network.Configuration.FHConfig.DwellTime =
-		 le32_to_cpu(pnetwork->network.Configuration.FHConfig.
-			     DwellTime);
+		 le32_to_cpu(pnetwork->network.Configuration.FHConfig.DwellTime);
 	pnetwork->network.Configuration.FHConfig.HopPattern =
-		 le32_to_cpu(pnetwork->network.Configuration.
-			     FHConfig.HopPattern);
+		 le32_to_cpu(pnetwork->network.Configuration.FHConfig.HopPattern);
 	pnetwork->network.Configuration.FHConfig.HopSet =
 		 le32_to_cpu(pnetwork->network.Configuration.FHConfig.HopSet);
 	pnetwork->network.Configuration.FHConfig.Length =
@@ -717,36 +713,29 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (the_same_macaddr) {
 					ptarget_wlan =
-					    r8712_find_network(&pmlmepriv->
-					    scanned_queue,
+					    r8712_find_network(&pmlmepriv->scanned_queue,
 					    cur_network->network.MacAddress);
 				} else {
 					pcur_wlan =
-					     r8712_find_network(&pmlmepriv->
-					     scanned_queue,
+					     r8712_find_network(&pmlmepriv->scanned_queue,
 					     cur_network->network.MacAddress);
 					if (pcur_wlan)
 						pcur_wlan->fixed = false;
 
 					pcur_sta = r8712_get_stainfo(pstapriv,
 					     cur_network->network.MacAddress);
-					spin_lock_irqsave(&pstapriv->
-						sta_hash_lock, irqL2);
+					spin_lock_irqsave(&pstapriv->sta_hash_lock, irqL2);
 					r8712_free_stainfo(adapter, pcur_sta);
-					spin_unlock_irqrestore(&(pstapriv->
-						sta_hash_lock), irqL2);
+					spin_unlock_irqrestore(&(pstapriv->sta_hash_lock), irqL2);
 
 					ptarget_wlan =
-						 r8712_find_network(&pmlmepriv->
-						 scanned_queue,
-						 pnetwork->network.
-						 MacAddress);
+						 r8712_find_network(&pmlmepriv->scanned_queue,
+						 pnetwork->network.MacAddress);
 					if (ptarget_wlan)
 						ptarget_wlan->fixed = true;
 				}
 			} else {
-				ptarget_wlan = r8712_find_network(&pmlmepriv->
-						scanned_queue,
+				ptarget_wlan = r8712_find_network(&pmlmepriv->scanned_queue,
 						pnetwork->network.MacAddress);
 				if (ptarget_wlan)
 					ptarget_wlan->fixed = true;
@@ -779,39 +768,29 @@ void r8712_joinbss_event_callback(struct _adapter *adapter, u8 *pbuf)
 					ptarget_sta->aid = pnetwork->join_res;
 					ptarget_sta->qos_option = 1;
 					ptarget_sta->mac_id = 5;
-					if (adapter->securitypriv.
-					    AuthAlgrthm == 2) {
-						adapter->securitypriv.
-							binstallGrpkey =
+					if (adapter->securitypriv.AuthAlgrthm == 2) {
+						adapter->securitypriv.binstallGrpkey =
 							 false;
-						adapter->securitypriv.
-							busetkipkey =
+						adapter->securitypriv.busetkipkey =
 							 false;
-						adapter->securitypriv.
-							bgrpkey_handshake =
+						adapter->securitypriv.bgrpkey_handshake =
 							 false;
-						ptarget_sta->ieee8021x_blocked
-							 = true;
+						ptarget_sta->ieee8021x_blocked =
+							 true;
 						ptarget_sta->XPrivacy =
-							 adapter->securitypriv.
-							 PrivacyAlgrthm;
-						memset((u8 *)&ptarget_sta->
-							 x_UncstKey,
+							 adapter->securitypriv.PrivacyAlgrthm;
+						memset((u8 *)&ptarget_sta->x_UncstKey,
 							 0,
 							 sizeof(union Keytype));
-						memset((u8 *)&ptarget_sta->
-							 tkiprxmickey,
+						memset((u8 *)&ptarget_sta->tkiprxmickey,
 							 0,
 							 sizeof(union Keytype));
-						memset((u8 *)&ptarget_sta->
-							 tkiptxmickey,
+						memset((u8 *)&ptarget_sta->tkiptxmickey,
 							 0,
 							 sizeof(union Keytype));
-						memset((u8 *)&ptarget_sta->
-							 txpn, 0,
+						memset((u8 *)&ptarget_sta->txpn, 0,
 							 sizeof(union pn48));
-						memset((u8 *)&ptarget_sta->
-							 rxpn, 0,
+						memset((u8 *)&ptarget_sta->rxpn, 0,
 							 sizeof(union pn48));
 					}
 				} else {
@@ -942,8 +921,7 @@ void r8712_stadel_event_callback(struct _adapter *adapter, u8 *pbuf)
 			pdev_network = &(adapter->registrypriv.dev_network);
 			pibss = adapter->registrypriv.dev_network.MacAddress;
 			memcpy(pdev_network, &tgt_network->network,
-				r8712_get_wlan_bssid_ex_sz(&tgt_network->
-							network));
+				r8712_get_wlan_bssid_ex_sz(&tgt_network->network));
 			memcpy(&pdev_network->Ssid,
 				&pmlmepriv->assoc_ssid,
 				sizeof(struct ndis_802_11_ssid));
@@ -1092,8 +1070,7 @@ int r8712_select_and_join_from_scan(struct mlme_priv *pmlmepriv)
 			src_ssid = pmlmepriv->assoc_bssid;
 			if (!memcmp(dst_ssid, src_ssid, ETH_ALEN)) {
 				if (check_fwstate(pmlmepriv, _FW_LINKED)) {
-					if (is_same_network(&pmlmepriv->
-					    cur_network.network,
+					if (is_same_network(&pmlmepriv->cur_network.network,
 					    &pnetwork->network)) {
 						_clr_fwstate_(pmlmepriv,
 							_FW_UNDER_LINKING);
-- 
2.25.1

