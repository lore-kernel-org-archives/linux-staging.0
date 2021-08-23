Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA03FC4
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 14:12:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id mf2so18829119ejb.9
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gd/UxYevi+G4kNYb51ak9+gmuz/dblR9kVc8KItLL1o=;
        b=qy3L2E8tuhkogc2PPLenM6iTt2GlQq84LsgK4ngAo8wlo2ZRqm3vu/sj7XNiAgWvhI
         us7ggOF076U6m2LRdJnHPi3b2lDJO4Lc1Pzt30atpl7srs8w6zSaaA2IVyRNeZDfmRC0
         YyMbthhl7nwdoIWl6ZBrYHUx6ozXzHdPaUKYV7/2oziaimWwlZ47bh5gmmDhunFOiz4L
         yS9CtJ3RR/Chf+K1QXJul9kz9HGZpZrD2FK8CSCfVxykJw1abTQ1BZKIcI9cgGXygYPf
         sK00IUlqph2oIyMP87QmIOw1JrOkF7/tNmQtJGVk4zG4jXlqmCxKO8WPTlXBK6yHOUZr
         l6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gd/UxYevi+G4kNYb51ak9+gmuz/dblR9kVc8KItLL1o=;
        b=YMNfMXROeDciG3k7tSrrNTLw6u43CuUX4ARYMYILiKVgYnEtHse5HFPvMVokELzY+Z
         BF10TzHCl3xN5y/bnrCh8vrkTc8o9dbf0Ra4PslTnSXzjgz41i3OEC+Zktr3X2bUo7tw
         dD5d3vgczyfuB23Bi3rIB6g1l+0dlxQFF7DXSBRGrY1ylf2KYO9Tt4vyGVobhby1RoN6
         Xk0j6iAT/KPKPcRoY+QEgRK4VWuC1o5nW4KhBh+dDBAin+WV+4fH8mcwuYatpbkUAm90
         ZwDX/XPpWWLvtADG6dC7b44cl3tjZmE9GcnyrpDH5T28O6vicBYhS+Mi/6s7zASfKwa/
         q10A==
X-Gm-Message-State: AOAM532NJ6acaBFRk8SoweUv9J2vmGYoNFFziheh2/FOMjAQGdcnS5tU
	EIQiQ17cEuRWX+9egj0p98Y=
X-Google-Smtp-Source: ABdhPJz5ht1tmeg7mfC/3cSY5LGnVao/47oKz+6lOXYSki7CcFDPZBWa1lWjORxEPsS0YuedUrxbhQ==
X-Received: by 2002:a17:906:1d43:: with SMTP id o3mr36159931ejh.44.1629727932389;
        Mon, 23 Aug 2021 07:12:12 -0700 (PDT)
Received: from agape ([5.171.81.132])
        by smtp.gmail.com with ESMTPSA id u2sm7496079ejc.61.2021.08.23.07.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:12:12 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] staging: rtl8723bs: remove functions notifying wext events
Date: Mon, 23 Aug 2021 16:12:02 +0200
Message-Id: <0d745350ff3d411dda329b8c1e2261361570db6e.1629727333.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629727333.git.fabioaiuto83@gmail.com>
References: <cover.1629727333.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove functions that once were meant to notify
wext events to userspace. Now they are donig nothing
useful so just remove them.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  4 +-
 drivers/staging/rtl8723bs/include/drv_types.h |  3 --
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 38 -------------------
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |  4 --
 4 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 5f25cbf83723..eee250f12df3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -449,10 +449,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		res = true;
 
 	} else {
-		if (rtw_is_scan_deny(padapter)) {
-			indicate_wx_scan_complete_event(padapter);
+		if (rtw_is_scan_deny(padapter))
 			return _SUCCESS;
-		}
 
 		spin_lock_bh(&pmlmepriv->lock);
 
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 580028d28c42..ae32963a156d 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -495,9 +495,6 @@ static inline u8 *myid(struct eeprom_priv *peepriv)
 
 #include <rtw_btcoex.h>
 
-void rtw_indicate_wx_disassoc_event(struct adapter *padapter);
-void rtw_indicate_wx_assoc_event(struct adapter *padapter);
-void indicate_wx_scan_complete_event(struct adapter *padapter);
 int rtw_change_ifname(struct adapter *padapter, const char *ifname);
 
 extern char *rtw_initmac;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 733c6b93eb8f..9d4a233a861e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -29,44 +29,6 @@
 #define WEXT_CSCAN_HOME_DWELL_SECTION	'H'
 #define WEXT_CSCAN_TYPE_SECTION		'T'
 
-void indicate_wx_scan_complete_event(struct adapter *padapter)
-{
-	union iwreq_data wrqu;
-
-	memset(&wrqu, 0, sizeof(union iwreq_data));
-}
-
-
-void rtw_indicate_wx_assoc_event(struct adapter *padapter)
-{
-	union iwreq_data wrqu;
-	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
-	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
-
-	memset(&wrqu, 0, sizeof(union iwreq_data));
-
-	wrqu.ap_addr.sa_family = ARPHRD_ETHER;
-
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)
-		memcpy(wrqu.ap_addr.sa_data, pnetwork->mac_address, ETH_ALEN);
-	else
-		memcpy(wrqu.ap_addr.sa_data, pmlmepriv->cur_network.network.mac_address, ETH_ALEN);
-
-	netdev_dbg(padapter->pnetdev, "assoc success\n");
-}
-
-void rtw_indicate_wx_disassoc_event(struct adapter *padapter)
-{
-	union iwreq_data wrqu;
-
-	memset(&wrqu, 0, sizeof(union iwreq_data));
-
-	wrqu.ap_addr.sa_family = ARPHRD_ETHER;
-	eth_zero_addr(wrqu.ap_addr.sa_data);
-}
-
 static int wpa_set_auth_algs(struct net_device *dev, u32 value)
 {
 	struct adapter *padapter = rtw_netdev_priv(dev);
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index a4560ba22db1..1341801e5c21 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -48,7 +48,6 @@ void rtw_os_indicate_connect(struct adapter *adapter)
 		rtw_cfg80211_indicate_connect(adapter);
 	}
 
-	rtw_indicate_wx_assoc_event(adapter);
 	netif_carrier_on(adapter->pnetdev);
 
 	if (adapter->pid[2] != 0)
@@ -58,7 +57,6 @@ void rtw_os_indicate_connect(struct adapter *adapter)
 void rtw_os_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
 	rtw_cfg80211_indicate_scan_done(padapter, aborted);
-	indicate_wx_scan_complete_event(padapter);
 }
 
 static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
@@ -129,8 +127,6 @@ void rtw_os_indicate_disconnect(struct adapter *adapter)
 
 	rtw_cfg80211_indicate_disconnect(adapter);
 
-	rtw_indicate_wx_disassoc_event(adapter);
-
 	/* modify for CONFIG_IEEE80211W, none 11w also can use the same command */
 	rtw_reset_securitypriv_cmd(adapter);
 }
-- 
2.20.1

