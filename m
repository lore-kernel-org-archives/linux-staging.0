Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F02471412
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346246; cv=none; b=QewlhgsKvmVD9OkFhUKWum0QZKUNkoMpe7w9Kp8p1GKRRpmQwIuIsU0nLN/SZqDipavCngYkNHk50HW39NBsrNBBLJilJ7mxAwXU9xOXx6A++M/9qgSUSUHlCTd01xA8tWoEkPdM9lWkLkmQ/SRs3cN2C29edrAlknJZ6BGmBmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346246; c=relaxed/simple;
	bh=ZxEquSdvMJ5TmfPHIN8OB0dU1KBTdTDdQ7zJgo/dhQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3LL8Gd/W175r5YkBd35Y7glL8pjUtxBw3nLHVJHW8urkZmwhVbHq87if9905lE6EEBqmCEW+k87th4BKvDcj021pahuovBIdE87lqZT8aNeDa0v6mPvNYOk28gU3THnw8DGtHQTvb3iWZ00eRjBqCyof9ym4lXYjlmOhgtEYEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgfauG8i; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgfauG8i"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b457a0b4e5so830019e87.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 03:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788346239; x=1788951039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+g1NrKRhGje+cs82CHJjhNsBsnUMQa7j9gBCYll4968=;
        b=bgfauG8i0OGrOiXyvDNWTx1U4KosbUdzaRr816TO6bRuaSRyx/Sw/bGRLllNVOaNeQ
         6r5y4ytOYr/xQSwfeTv5Sy0h/7ErwAFvuRuf6a15cs85LcgCTbnKT4DOHza3DBfdL2Ak
         6Kq28cGi2UqqMqCIuKba3HfeBbW50cMQ0Fg0A6PQ23YbRtAV6dOlDx9pcU0bRzelH6Jj
         F8uwYTfimAlJ8YNrZcIUFfwRnxstCwOA7lnYQIYbpg/1kWZJAX8RV5IFc49bLT7upzJC
         p/X+THZZiipLA7+BM4IHPfJX/V0PPTymcq/SBZYI/dbOqijRXFKylwUEP90061xfWXSU
         NUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346239; x=1788951039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+g1NrKRhGje+cs82CHJjhNsBsnUMQa7j9gBCYll4968=;
        b=LGdAqA611RcrfrV9vxK3PpSu7hbN8Fr+aVitFYSjJXa4/lKykNUsnUJiw0wx9x1YHz
         nf/TjN/QlGXR0gcvXifmr+hmytkqWd5QXh7IvKVqN4Zv8zxJF2SZHKO6t+Nl+iV1TyZ8
         2v+zvMY26qlKbxEFih3KHGCuaorcTFMaVgZ7lvqp83Vjq4y4u59HeXcxvZZUDEvJ+gRB
         YuHXJMk1pAKnd9svdQKOAIHj+18C0kWI8QjLnou+n2tvhpq+AAglb570awUko8V/fHIh
         NNidakbXwm06c9IQAvIl3OBZ+d2/6KSqORJc3ds29u2eA0MdjxYPXTaw4Grg0qPkNh/L
         JmFQ==
X-Gm-Message-State: AFuF++lE52b9e8eegW9gGkZWzrrEHYjwWPNTebs8/Hx0nEkMYGMoyErp
	NsYOB0Wa7i9J+L2t+Uyk4z+acyIoHfI8GK48rn+0794tFgGZ3TnpK363
X-Gm-Gg: AYBFou160g3BJWGNePae5YTAY3loGbHGInaih2H/JbKOCie3nYWCmn78PSGUAc2RoHg
	ogsr12LQlnEa+Kn59S32k9qwvhMarMmtl1GthT+1nN1m+f43wLRM/FT57NyLXubD7swf2aExKQN
	EOIUsFEPKFm8t/GGAcR41P3QvoL/jHhYsByGbW8dtaFnQglFWku9dOgY79uLootUtG0pMDFT7Ur
	ukxtcUnoZ1L2s9E5ST6/RtUOelV610aOAJiyGErBz0985HdLGppbIWa7yrEVx20DbaOXBQ1u6iH
	Vun+XFTbzTACDeh8PBk2z6eF5DqOtiAmxb5gx5cxKsuPUmfYfY4vyp9ogSOIxhSMsKJpz5oSDLF
	r9P7ev2wkTtO2RI2h7MDoCVPsQJ1cyFBTz3h3PQ6Z6KZ4IhtQRUZdgmyI4rXEp1NfYKz4mBHPgF
	o47EkujcN6WHow1t4JM2/wHoMEmFvyhxkQlmJiIhvXTDzJ3eXfUtj6bEiICtewvKim4Deh5Smw2
	O6H9wXKvcMHb+IS
X-Received: by 2002:a05:6512:39cd:b0:5b5:e29b:a1df with SMTP id 2adb3069b0e04-5b608340136mr1130811e87.8.1788346239266;
        Wed, 02 Sep 2026 03:50:39 -0700 (PDT)
Received: from localhost.localdomain ([195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b94450sm485003e87.50.2026.09.02.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:50:37 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Remove manual ifname allocation
Date: Wed,  2 Sep 2026 13:50:03 +0300
Message-ID: <20260902105004.1935-1-nsvatoslav515@gmail.com>
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
Changes in v3:
- Added missing changelog.

Changes in v2:
- Removed rtw_init_netdev_name() and the entire manual naming callpath 
  instead of hardcoding "wlan%d", as suggested by Greg KH.

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

