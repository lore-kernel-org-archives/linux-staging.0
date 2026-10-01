Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010AF4A384D
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864040; cv=none; b=C6LMZHOlnHqG5VyCp3AORpyYb8kejbJ36qEAfcGY3SciPYeqfD/Zhjs8vqRrzln0oU67E9pv6rw4iiMNjcUY5BPk1YoIlFY5BN/mYpKDYMJxz1xeusojDBzRhCKOYYafaKb6LUhM9jtsk9qa4uCnlCrlMKOdxDv20D6FJw4jytI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864040; c=relaxed/simple;
	bh=IEXUskiaguTB4Otopyr6gaLDiGGpDYbBgosBuNngyxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLqGu104/GSsdJZ42w0bT8qzi5h6sqq7eAysBXIgLm1sXk0rO/oE8T/R3vth2xtbswjJqenQhiUxwRmGXwNuNj/RZh6Q8hQuC3ooLeWqWaf8cedS4vBzrvsiSJQMU0qwiZZLzy474wzbRLqyVrrXc/NDw5A+l8alLZcpkyH33kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5bM98SL; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5bM98SL"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so962148166b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790864036; x=1791468836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCWRto5ZbEKJLVpd5fclw/bB6bh5Fpi2NNDb+Pnb0AI=;
        b=D5bM98SLxIX5gVMTx7RuZrNBe+FbybDyR1Z1nHlON9W9ZKEWh1R64eAxtInda/34vO
         zZwVN26a7XEjjFSLGyo5NWvuteCZtP2jVxyiD73Qn5KSoMNDoYiMKiDu6aOB2ssoPHsb
         Oj4hnOVatZY18ldkWAqUsjsrE7b+PyucorFfg3YyUugMDE8Ez+FchQMhSg38CEYgii4w
         NcsmoZNYrnn3jSemzWMMAV6mPA7XhpEHCZs+3GbyEwCah0jHPu5fFPDeMtZjrppmYGeV
         YGzjiBA+aCaEPJrQucUcILEAD4T3KRLfAtAlJNUe0eeswnKS6x2gpZp8YgN0dytDLA3Z
         wT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864036; x=1791468836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCWRto5ZbEKJLVpd5fclw/bB6bh5Fpi2NNDb+Pnb0AI=;
        b=N1euKzT0PJqcbWhKxeUUGiq8vHn8gabbcSpTeyDhJTdzlCL8Kg0x9AcmTFm8/TjQdf
         10hLYxAH5Kh8co4Ex4rbzassigBlbPuD0rU24p25SLTfBhJd8y8sMYWDxnL5gktBZbP9
         JkW9NxZJV309U+tIZsJQV+wIzWOTL6n3sYqsxT0juIn7v4Wq4QJqGc9r/ZLsrxKUue8Q
         SCBdpoL1BHLKQb2VByaIsNh7oJijAM6DQPbBBkQnuy4DhDmNyJxh6b8bzg3adTRqoPoV
         vgBaMElg8DP/a/+w8cUS2/NMiyNbl+qPcOVPDJAL0WJCOvmBMsW8jgl4+WBAuwkLsnRn
         TOcg==
X-Forwarded-Encrypted: i=1; AKwUvBxJRUvswjVWPyyos1TRAsnbxG2RtFiqbLkdWTm5Q+NOZbhCwD5kpK3PUAGpOcIMP/26dJp1CzpHmon7I9Jc@lists.linux.dev
X-Gm-Message-State: AFuF++k8HybNmyvD6M8GFK9xfUUvFwGwVsCuoLRQv2HwxlmGgo3wcTah
	9K7pJpItil7frKQP0WE2q9m01vdB1Ud7fnaNThhsn2/oA15bKJ5pYK5k
X-Gm-Gg: AYBFou2f1OPcHJTFt1janLUy4sjML8ZZBB5ehsKWFGX5CAm7NXwmWQ7HgDjXHzY7Q6K
	yUjmuZzt9fLBL+XotD0ur+2DSRyZ7zPQWssPU1A8BQxMkyztR2PLRcCGw0mrrY/gUUwkb4xDSOa
	9YHcqpSN/iWemDmEElTviEH7O38N1dlOwvDP8N/nQiwQOfhk8usRptYKLA3vcIljkTnW9B5QiSi
	Z+kfMYRkQy+5Ry5DEHVdZEIJQRLpr641c7+It8VhONTDFWtoRs4WO9445YRD0/Njy5d2m9lKxIQ
	pW4dGcPxKJ4iB8CyQ5HLBVuPrm7+CgdBkyUWW1fXsPs/qqUj0V0+V9QRIV3+ZuWZf3vRw+0Wm+a
	v10fDl2fZi7MZ+lPkMngxSKsyvsA8BdrPISmEVGkr7BZMacEBO8jav91asBs1HJS0O4ISjy2voe
	09hfKnzVFmWqZh5iV+TQPT3Yc1Fz8ZfavuiCaZokTE2iI4BaJGlwnNoD4ZVRxhMb7kXqRbbzOB9
	g0DTyViW+aoFMVP
X-Received: by 2002:a17:907:7284:b0:c2e:a9:57f4 with SMTP id a640c23a62f3a-c2e23d2e342mr391143966b.22.1790864035909;
        Thu, 01 Oct 2026 07:13:55 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d96628sm167372766b.62.2026.10.01.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:13:54 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	error27@gmail.com,
	guojy.bj@gmail.com,
	dvdh12707@gmail.com,
	enelsonmoore@gmail.com,
	khomenkov@mailbox.org,
	fliegbert2@gmail.com,
	m.steinmoetzger@gmail.com,
	knavaneeth786@gmail.com,
	nikolayof23@gmail.com,
	serhatkumral1@gmail.com,
	samasth.norway.ananda@oracle.com,
	dennylin0707@gmail.com,
	adrishbora@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v6] staging: rtl8723bs: Remove manual ifname allocation
Date: Thu,  1 Oct 2026 17:12:41 +0300
Message-ID: <20261001141242.2763-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The manual ifname allocation via dev_alloc_name() is redundant because
the networking core handles interface naming automatically during
register_netdev().

Remove the ifname module parameter, the corresponding field from
struct registry_priv, and the rtw_init_netdev_name() callpath.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
Changes in v6:
- Rebased one more time. Should be working now. I'm so sorry for it.

Changes in v5:
- Rebased onto latest staging-testing to resolve merge conflicts caused by recent tree updates.

Changes in v4:
- Rebased onto latest staging-testing branch.

Changes in v3:
- Added missing changelog.

Changes in v2:
- Removed rtw_init_netdev_name() and the entire manual naming callpath
  instead of hardcoding "wlan%d", as suggested by Greg KH.
---
 drivers/staging/rtl8723bs/include/drv_types.h |  2 --
 .../staging/rtl8723bs/include/osdep_intf.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 26 +++----------------
 3 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 0db276d46b1c..7f7d4fbad4bd 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -151,8 +151,6 @@ struct registry_priv {
 
 	u8 enable80211d;
 
-	u8 ifname[16];
-
 	u8 notch_filter;
 
 	/* define for tx power adjust */
diff --git a/drivers/staging/rtl8723bs/include/osdep_intf.h b/drivers/staging/rtl8723bs/include/osdep_intf.h
index 83a25598e962..f1e7a303a286 100644
--- a/drivers/staging/rtl8723bs/include/osdep_intf.h
+++ b/drivers/staging/rtl8723bs/include/osdep_intf.h
@@ -20,7 +20,6 @@ u32 rtw_start_drv_threads(struct adapter *padapter);
 void rtw_stop_drv_threads(struct adapter *padapter);
 void rtw_cancel_all_timer(struct adapter *padapter);
 
-int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname);
 struct net_device *rtw_init_netdev(struct adapter *padapter);
 void rtw_unregister_netdevs(struct dvobj_priv *dvobj);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index ab291792459b..d220df325fa9 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -106,10 +106,6 @@ static int rtw_80211d;
 static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
-static char *ifname = "wlan%d";
-module_param(ifname, charp, 0644);
-MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
-
 char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
@@ -249,8 +245,6 @@ static void loadparam(struct adapter *padapter)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	snprintf(registry_par->ifname, 16, "%s", ifname);
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -394,17 +388,6 @@ static const struct net_device_ops rtw_netdev_ops = {
 	.ndo_get_stats = rtw_net_get_stats,
 };
 
-int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
-{
-	if (dev_alloc_name(pnetdev, ifname) < 0) {
-		pr_err("dev_alloc_name, fail for %s\n", ifname);
-		return 1;
-	}
-	netif_carrier_off(pnetdev);
-
-	return 0;
-}
-
 struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 {
 	struct adapter *padapter;
@@ -726,14 +709,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 	return _SUCCESS;
 }
 
-static int _rtw_drv_register_netdev(struct adapter *padapter, char *name)
+static int _rtw_drv_register_netdev(struct adapter *padapter)
 {
 	int ret = _SUCCESS;
 	struct net_device *pnetdev = padapter->pnetdev;
 
-	/* alloc netdev name */
-	if (rtw_init_netdev_name(pnetdev, name))
-		return _FAIL;
+	netif_carrier_off(pnetdev);
 
 	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 
@@ -758,9 +739,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
 {
 	struct dvobj_priv *dvobj = if1->dvobj;
 	struct adapter *padapter = dvobj->padapters;
-	char *name = if1->registrypriv.ifname;
 
-	return _rtw_drv_register_netdev(padapter, name);
+	return _rtw_drv_register_netdev(padapter);
 }
 
 static int _netdev_open(struct net_device *pnetdev)
-- 
2.47.3

