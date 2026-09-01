Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827148C8A9
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284420; cv=none; b=jbbL+fdqtgnDNUpKtnY/+/uJ43SmnhU72m1FxQhjjVi+1iPM51yidyR+4UqSOQNf8jOeVAcHnYI3XrMA20IJlsmIed2bf/LImnDAXuE7+P/WH26L8dZfwn4ixnAis2VCPx3FbAqmbuowLvOqVDFtf4UltdYJ6AucuAq1V/U6kDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284420; c=relaxed/simple;
	bh=gzfgO2xtv31hW5lK2wNpf1w8pKkDlPNagKjv1v5sCsY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWy6ayFjPATUyipyvZqyz3XHC91F+2iS9mK6gMWVaMq2TraSdAtzm3ZYHV4dZ1P0pnGvI/WeiM8xBqQCqA+i0+s2RhgtS2bKDk0/cWCGXC3RXAPvQUyGhuiXYmM4440QT32KyTj/Sk9vJLlnQ3xvkmTyDpNmfqNhcojhUQpq6/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sI2tivyG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sI2tivyG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso1125425e9.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788284416; x=1788889216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBqsdCv0PKAGwqJspHCwLqZLgeNbrWJRtBR7BmnZ5Z0=;
        b=sI2tivyGMfkVzaOeayOUB7iI88r5HvxpFujQWfWK7qTXPF75WfMT28uoLw3up4+pE5
         QK3isVMV1o9Gw2O5ZRV0Y1g7eFn3THMvFSKzByy55vxs+6RC+k3RliR2IbQhpRI0diyQ
         CcKQDxwLOU4HKb32By+i1FjdniElbqkO9lvwz9cCPZiYZKdRHk1vFyZUAJtcK02O4Y5r
         PzsFPOoIkQ42crZDtwfULNNnrw61ssFB3zoGDbbqqlz+biGNOA0ea/1JiiuCjn+QWmfy
         LlOEDXUWCtbRk//blh+JrIUzrpYcrzAjEDY7GjqR9WGiXz/yeb19+rNjesc+r30uRBsN
         qupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284416; x=1788889216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBqsdCv0PKAGwqJspHCwLqZLgeNbrWJRtBR7BmnZ5Z0=;
        b=L1D9pPAGcgwDEaLsJPiUWh/qdrJm3q87fnKYxsl/mnt7PTS/zxU45FY6xOgiROGki4
         M9Rn9nnXSpBEM5OgalWCZMehM4CqQcAhqW1Kp1mBnH1ycW0JI0LQ7r5gzeA0rvyD4dry
         ZRb+XsHORJ4ElpQCXs2t/yJdBErEKG+DG/IB6S5Sr19Kd8RXm+/4UAZjJvJFdVCek8r9
         XkTioIFoArtotVl7KMq6Nq5VZl1ODqSeN1X0hMVubhqF6rx3WoK6icd0B/ojxvgtYxBK
         rFWxPPJhDez2Nuq9ceLGEjGU+V+FPDvuIageUpb8BAG0wJflUTiSJB+NzwKaNxKtJdfW
         5W5w==
X-Gm-Message-State: AFuF++lwTa91y5dMOiP6TXtMaKl0snRfar07+Y6I5GDNO5PUO34X94IO
	UBK9qvg4gSHnq73G8nvAg3JSElInyc4c/XFipOT7fnKCv5uGGyvHgh5n
X-Gm-Gg: AR+sD11MCk1QHl+tYEvhjQrOfq5C54/Tcp9492Q5rOQy8YqdkbfdvPqjVsqYV+7ZWUc
	VLacZHc8zYuQabqpCJvlWczuyHzdHYNGas8a2a7XzAlwRsEo7Gfgy/6LdS+Digh5aDZlx1KpA5T
	Qal0attGssYpjfmm4wjW9vAPo+K+pE78J5qHjv6TJmRD5nNBTmPfEzPEGIXDWsa5sEYAod+0PJj
	ubZE0S6jCpuKJCmldPeIm3v1mOEy+S35trCIh4DmBmFgW++1EbDSXUcvuvf+vXWe9CLWbFTGwtQ
	14WaPceg5zE/YHpbMhqHi6IV4B8+sIJlT4s3z11e9kED0Bsq4/9dJZ4mk/It8sKzQpEMo6CiU/4
	ixPPJmHFjBsuMHV9AH4W6XzmmLYiditUi/IcUB7nRJu1AsWxN3HPn54p/vEvw6KCDtSv9OwiNOT
	CZ6CxZ13gGZk0Xq/+2GvZfDOJt6JRQC3sAfx0kgboUCKyz0oWwy2DxLN8JWyZ7WQ7oQ/lyTiySe
	F563+Tgt3QY/I/6fhpTJsOyJ9LJ3i+BN58=
X-Received: by 2002:a05:600c:6819:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cdd41ca5amr131704235e9.6.1788284415719;
        Tue, 01 Sep 2026 10:40:15 -0700 (PDT)
Received: from localhost.localdomain (s052.imperial.net.ua. [195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce3c86a0asm12959855e9.9.2026.09.01.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:40:15 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove manual ifname allocation
Date: Tue,  1 Sep 2026 20:39:22 +0300
Message-ID: <20260901173923.4810-1-nsvatoslav515@gmail.com>
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
 drivers/staging/rtl8723bs/include/drv_types.h |  2 --
 .../staging/rtl8723bs/include/osdep_intf.h    |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 27 +++----------------
 3 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..5837c51ac2f5 100644
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
index dd0c5fc813c8..5659d67a32f4 100644
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
@@ -256,8 +252,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -405,18 +399,6 @@ static const struct net_device_ops rtw_netdev_ops = {
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
@@ -752,14 +734,12 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
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
 
@@ -784,9 +764,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
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

