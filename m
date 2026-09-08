Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140A93AEF45
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868660; cv=none; b=Nu+dV+7oKRzqsuNNqAeewyN9hJ0ulw/GqY92HPBj16iGz9rCQS5O9N2kGZwAGnJYi1MWcdfbr4gLujEdlTCDGtJC4ykvdCBBajHVe/L/nbIbD8xQrooPyr8dK6U3SC6BMSPSNl4fjaGfs/pHSCchnhbR+DlgIewDy2ulJ8a/DTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868660; c=relaxed/simple;
	bh=OcFbgctUt+cshWsEOD0Ig053akmnkCLSYsV7LMioBeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T627xC47YweanZFTQnthe4eBJ2zWH1Zbmw1Tlf5FcIOPVxnPr9aw6Y04jPXI3ceWb7YHEISGe3A6RfkXpvrvROZrnb2cA/6/jIg04J6sEhfGy8XhOpPnbC32ANFya+Dw1N/8zjjkkITE61vnhvFrdVXHX6G//lyoc/U1ZzeaO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxYr9eyO; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxYr9eyO"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c259e5c22ffso375911966b.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 04:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788868656; x=1789473456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCjawlCXDNgjFZefRZzRLsSz/pwg4uCa9eWCb+1mx+U=;
        b=KxYr9eyOAD7PljxyJE6EEhzDrmT9lGWI5Iz+8wuwXKzkL17q22R2M6XhvrmF/O9cW8
         CN7s9zsghBeqtivuoQRxHJ5Go8XTj/1fW97XyXHXfW0+HjXF3bre05hXxo9VBVBh3RNp
         sw+wWZ8LSxT8Y9+vpNTtc0aV/Z8SgCHYYo942L7LR0GxkZIQw4Mc4kBmKPmiVQWO5XZz
         gYtfX9F+O8QaGDvRzXTiI9x5XX8qEzjRFXRRll2gWEoORHTxSyYR09o1xTg4P4A1Coi1
         LiX4Ok84tY1wsxtAAMqUPDz9iRhlTq+KFEa+o1rjEmmW6DoyfGqGLwrLENs4WQ+KTn+5
         jf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788868656; x=1789473456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCjawlCXDNgjFZefRZzRLsSz/pwg4uCa9eWCb+1mx+U=;
        b=QKCuoRN5pPSA671LjNX3FKfLkP9lpt6l+2pVp/VP5lDix/A4F6byA9lM7NbFaVid5o
         JlV1BweLYgpSlmdtBP0gbFSOuZ4vOwEuiUJ7PArguQMg5QPtB2NOjT62ByjMFxXbTZSN
         LnxwWTa4+rm1N+CIEYd8eneDOcO8QLKnCeeb9R/FrUjWHhb2U+rjsNkx+cYgbjvuKspW
         9UHPmXVHOcFTJknCXEJr4n0AHJYb7dqhpqPCDnAEvxw02XST96j4HaPTArjoFaSL+rTE
         Z/fUvZ0pQIOxkY+5wDVB+uSZCWfL+DOHHLlMnVaMhlwRSr+BP3ShkNcI1vr30x5/yqm2
         0Gfw==
X-Gm-Message-State: AFuF++k9nK0pvBZ5a3AJRFu1PhMg5yMy7UaSXVb6VD+Cv4E6QnA8vXYZ
	U/xZV+n8uFY+guwMUjMJJjMN6hxHWBw6xRhMHYw1CQ6qKscWnfX9zUSo
X-Gm-Gg: AYBFou0q2fuqlU3JPhr5vktO3HIxN5fi3CrA4OYPMl7KQbDKL+7Jp9zRnbDIZdv3Icw
	AJNOy3Ruo/XWsdt6ahy5dRFs7RVBMc+hYCoh2T8GiNovlpjObgRO/TXdXgmtwQTWWNhTDuTbQ6I
	HfhgErYFpVb7WXs4lWKi8CC2wXUf1X/1LtUPlWXHWspHE6X4Fev2908I4FX0MTQ+a3cvbKfBKVC
	YBYc/7m7PT4dgNz/CYZVxIdpxeJzTCTL5s+2OlbN9uaIsej1pO6PhmyJ/SL72doIfKT76o+P1K4
	DVGFWQTNdQWgi/ZTVqcTBvWy3FRf/zCDZ4oqlX4CAx8ThAuWbiFLn+lXl35kQHBhZ3uvS4NTzuI
	lV8xZukoVMFf0mXtnbdRYRpfnIsgxEKqzKJ7oGxybu40oQJJdSuHeOy/391hLxYrpEA3jSBz4ct
	fF7Ujj6mvdEwQVRRNeeYAHMRL1Wh7RrDh5XbbbBxeTZE1/jJXKqgtAeRPA1C4cGYclsJDYWGmVd
	T+xkg==
X-Received: by 2002:a17:907:3d56:b0:c25:192:99ee with SMTP id a640c23a62f3a-c260ca22e7dmr1069337866b.19.1788868655931;
        Tue, 08 Sep 2026 04:57:35 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2621d3f5b6sm492763566b.45.2026.09.08.04.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:57:35 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Remove manual ifname allocation
Date: Tue,  8 Sep 2026 14:56:54 +0300
Message-ID: <20260908115654.3406-1-nsvatoslav515@gmail.com>
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
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 27 +++----------------
 3 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 20265770ed77..213051a283d6 100644
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
index 361be281593b..7eceded5efca 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -109,10 +109,6 @@ static int rtw_80211d;
 static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
-static char *ifname = "wlan%d";
-module_param(ifname, charp, 0644);
-MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
-
 char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
@@ -254,8 +250,6 @@ static void loadparam(struct adapter *padapter)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -402,18 +396,6 @@ static const struct net_device_ops rtw_netdev_ops = {
 	.ndo_get_stats = rtw_net_get_stats,
 };
 
-int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
-{
-	if (dev_alloc_name(pnetdev, ifname) < 0) {
-		pr_err("dev_alloc_name, fail for %s\n", ifname);
-		return 1;
-	}
-	netif_carrier_off(pnetdev);
-	/* rtw_netif_stop_queue(pnetdev); */
-
-	return 0;
-}
-
 struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 {
 	struct adapter *padapter;
@@ -747,14 +729,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
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
 
@@ -779,9 +759,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
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

