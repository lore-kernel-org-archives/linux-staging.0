Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF74466B01
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859722; cv=none; b=CjQFbtfJZr7KItKFiEK2CqLcP5HRTYVE6jR0V26B/xpBxQTsCmPXiGdc+7sWhqmbDhugLKyFqrtowdKWfFgOtc3U2eAc0IT6DNeoLjyThOVfR3Jy8FWmZrLnaoO6Df9Ikf1/VGlXZC5bOO/hlVDWICvJjCg8d2hHr95jxM5CEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859722; c=relaxed/simple;
	bh=tWKv7GcRFD/s3pfJLGTWOhTIn+fwwkJlPNHPxThsAOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKRMgyzqiCTmQUr4WOITpY8C8lgLXmy5qC9p475r6IcPk5lpk5pjREQAlYf9pPT3U6QBaFK6HRwFpPXUz9rnf4RKFLrexCSp0pu6Ba7chnsMWFk2Af12jO43irWIQUGeSUtrseezLoXmnjktYHhEoURLoWZPyux+A2vhEAtfkV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM6KnMIp; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM6KnMIp"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so49407195e9.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859719; x=1791464519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMnCn6r1hHPcW/YmSzswujXp3fojK9XsootPRYEtFKY=;
        b=mM6KnMIpxz2rt5RunizrmwJY1dd9ZrxgLjgQsPZiA46sKNm5n7XGeNfzh1ugrhKHeg
         57gUwEU3NGLs/SQMpiGXQsOkqqEmEOSM9Hkis5nvOSOHGCnIcJZiLcw8DPaAaRN0Zeg3
         MbLDyu8jbsSFC2koAf/QwCY89DA0nohg3jcHTlohVSwer88uga/GJKJkw9xi/6UDxMhY
         vsRdxhoPJjCzxp48pb71DQ+UhZIxHrGXl+dtYLWeYmYA3keDFc11kfXV7ccO+14EMPSV
         nRf/41Lk3fq4DHpYV4AJydIYnCGJBTB1jzO2E+KM6rBcbvYPxysKuOlvf4vqVaf0XkHA
         OntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859719; x=1791464519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMnCn6r1hHPcW/YmSzswujXp3fojK9XsootPRYEtFKY=;
        b=O/r7fB6EeW1HNUV/JmwdLAjxwa7zlBC9yYX//qizBYWbSAbZQc6IVMY5WSWkkQ4cqX
         nFRpawX1DisToL8hIwwygNIM9UWKQeFMovISDx8ktnV58tlFYV/X4iGz/oP3+JXQpVyd
         DXBV9kt7V66cjGGGaKcMyfSUJ8z6U5XuCRERH6Z0erU+kMRnijXwHpxfabTuuINev9Kf
         qqoUqXN4oAFnpWxidqMNTtJ1lpZGqUcXK9K1NUBJ7+qcDTdI0X5Zk30kVRNbHxVi/V7m
         1pxNNbAWpgvAZYzhyMx0UK7TrFO90AGs7CGbdtKXW3OII+Ff9KBlKbqnmvfuZB+BR+MX
         eNYQ==
X-Gm-Message-State: AFuF++mZHqhxssjr5LCN0xZELaD65U9L6nXWMMNCS3GgvZS2CHuSSwz9
	pqXt9AvRd43+UZedxSj5Z9o8yDIybNKDQ1fFJGIW6Tlcufh6elXmqXZCEaX3n7z+
X-Gm-Gg: AYBFou0Ob/tbuSzGIhjxlCa84S/qHgEgG+ex0IxI/4KYba6bHy61gRvI8c86Gt+G3px
	IS7pyZkR1iLzSb8clInA6dHtqc29feJbmk2eKpqFYJGHVX+bGVxBHu91V9AqbA6DsSOITP/Jahn
	GR6Dzkpmu41FbeDEy8gkIRHL/A5mFGmmrStYo8zxR6UHgXjFw3vCk5Ja+putxGf0sRiVsnl5L3/
	P/Gke4GjV6T2TdeZ888LEoVMPZWArc1/Wszl/exrdL9JXnlC29k0vVjzf59xQKyuzxxnRZUVrjp
	WZho4nvRBKO5HG8xP5n0EUVqbUrxmA2RStvuCurG54Po1orHrCeTgjyt4f3x52Fm5RbWw/TS3gN
	8sDg1B9OrzJu1o/N0o3IBuWSubkfbPmQlbczuT4Hg79W3er/FWrMjuCP7tVXOinYCG4E7XuZK8x
	i1AeadlZf1JabTqbTtrJ5GI4B1hZLC9w0mmFKFej1LswBJH+BuRmLlQXWvVbI95SYqAz0zvzskl
	Cx24Pup79GmS+Zb
X-Received: by 2002:a05:600c:6206:b0:4a0:857:a3a5 with SMTP id 5b1f17b1804b1-4a01b11114dmr81828635e9.16.1790859718837;
        Thu, 01 Oct 2026 06:01:58 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01feb7198sm55311455e9.1.2026.10.01.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:01:58 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	guojy.bj@gmail.com,
	error27@gmail.com,
	knavaneeth786@gmail.com,
	dvdh12707@gmail.com,
	m.steinmoetzger@gmail.com,
	fliegbert2@gmail.com,
	enelsonmoore@gmail.com,
	nikolayof23@gmail.com,
	khushalchitturi@gmail.com,
	samasth.norway.ananda@oracle.com,
	dennylin0707@gmail.com,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: Remove manual ifname allocation
Date: Thu,  1 Oct 2026 16:01:27 +0300
Message-ID: <20261001130127.3655-1-nsvatoslav515@gmail.com>
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
index d11d0cdd023a..d220df325fa9 100644
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
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
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

