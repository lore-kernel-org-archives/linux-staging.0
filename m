Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2D870
	for <linux-staging@lists.linux.dev>; Thu,  5 Aug 2021 20:51:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id k4so4172275wms.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ST5aevt4uUTq4ziDf6ZuwvhFl9i7aM7uVjgXs4eXgg=;
        b=Xo5UI6m+/2hogSG9mdrobtRNcEXWKTGgVPiIuQh2Z7K34qPi8Abprax7i4v5PIhu7u
         Ddeu/GZrgV5naDARNx+qcDwTh5cRkR4pryeLVZz3dv6Ta/W2rJTjUMopmgveFWHcJ23L
         gCYDM7w2XPcvB85y3cSw6ghIfsdlynl9GzEEsekU6lrOkfrLW5+RU6H3/03uwuVqyjJP
         oPFBSowL+XxHu1D9PC1tOirKJnzw/iMlegJPrmfomyFmShKzAel8QWhQhaHy2o4oZNAR
         VXgiXRRVtxO2ffb6rXpw6SqcNSN5fonAAcAzcR1bw78Xq6k9UkMamPlj535PpFJ/yCew
         pQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ST5aevt4uUTq4ziDf6ZuwvhFl9i7aM7uVjgXs4eXgg=;
        b=MbSRgDpbU8sN/nabg/oJhiShAQ56YyfPrP7/EkpJnabHtoi6VQcw1XuzDMPSgogJWn
         ANYuBDYFD1XLuFiRYRuKzlzGEJn/WW1W6X99Y4T2mWvngsrULkqUjCJ72/mE9ebX6Ezp
         m5KqSY8oaW7jHb4+ScelIuTA6SVmwwyLg5dc97bdnyiFODHnCQ91XrLxIkUJZ8IQ5vCW
         o2IbEZa9ZP3zTycvMjMF/tLI5vO8Yh+g3Jh9J7UL2aQkQWGW43G0XFS0TF3NAi+78DJ/
         bQbvxh5OSld9OixWw394KoQsFaMF2BXT44Lta61A9KbmNFT1CwYS9Jg/lLtk1AuRrBRm
         ChGw==
X-Gm-Message-State: AOAM532VtUehYbzOWAXKPsiWAPVEsn96uknfRTuF9PVCUTdDTdYI8olr
	c8PAWd3nbhUOyE5esMZIDnI=
X-Google-Smtp-Source: ABdhPJz+CtS5j5EoL1Tcfxm2j1Pk4PVpoZMQukde2CWhKOSEuqMYOcaNm0PXQnCDX9bzrtkN6XW+oQ==
X-Received: by 2002:a05:600c:4657:: with SMTP id n23mr40578wmo.46.1628196663677;
        Thu, 05 Aug 2021 13:51:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id h16sm7195347wre.52.2021.08.05.13.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 13:51:03 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: replace custom macros with is_broadcast_ether_addr
Date: Thu,  5 Aug 2021 22:50:10 +0200
Message-Id: <20210805205010.31192-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of custom macros with is_broadcast_ether_addr. All buffers
are properly aligned. Remove the now unsued macros MacAddr_isBcst and
IS_MAC_ADDRESS_BROADCAST.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 13 +++----------
 drivers/staging/r8188eu/core/rtw_recv.c      |  2 +-
 drivers/staging/r8188eu/include/wifi.h       |  7 -------
 3 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 3e2add5409cc..c354f720310c 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -13,13 +13,6 @@
 
 extern void indicate_wx_scan_complete_event(struct adapter *padapter);
 
-#define IS_MAC_ADDRESS_BROADCAST(addr) \
-(\
-	((addr[0] == 0xff) && (addr[1] == 0xff) && \
-		(addr[2] == 0xff) && (addr[3] == 0xff) && \
-		(addr[4] == 0xff) && (addr[5] == 0xff))  ? true : false \
-)
-
 u8 rtw_validate_ssid(struct ndis_802_11_ssid *ssid)
 {
 	u8	 i;
@@ -656,8 +649,8 @@ u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
 		}
 
 		/*  check BSSID */
-		if (IS_MAC_ADDRESS_BROADCAST(key->BSSID) == true) {
-			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("MacAddr_isBcst(key->BSSID)\n"));
+		if (is_broadcast_ether_addr(key->BSSID)) {
+			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_, ("is_broadcast_ether_addr(key->BSSID)\n"));
 			ret = false;
 			goto exit;
 		}
@@ -744,7 +737,7 @@ u8 rtw_set_802_11_add_key(struct adapter *padapter, struct ndis_802_11_key *key)
 				 padapter->securitypriv.dot118021XGrpPrivacy, key->KeyLength));
 		}
 
-		if ((check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE) == true) && (IS_MAC_ADDRESS_BROADCAST(key->BSSID) == false)) {
+		if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE) && !is_broadcast_ether_addr(key->BSSID)) {
 			RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_err_,
 				 (" IBSS but BSSID is not Broadcast Address.\n"));
 			ret = _FAIL;
diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index aef32f029537..afab951d87fd 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -694,7 +694,7 @@ static void count_rx_stats(struct adapter *padapter, struct recv_frame *prframe,
 
 	padapter->mlmepriv.LinkDetectInfo.NumRxOkInPeriod++;
 
-	if ((!MacAddr_isBcst(pattrib->dst)) && (!IS_MCAST(pattrib->dst)))
+	if (!is_broadcast_ether_addr(pattrib->dst) && !IS_MCAST(pattrib->dst))
 		padapter->mlmepriv.LinkDetectInfo.NumRxUnicastOkInPeriod++;
 
 	if (sta)
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 2c56d1d70d03..65fc677bf4eb 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -368,13 +368,6 @@ enum WIFI_REG_DOMAIN {
 
 #define GetAddr4Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 24))
 
-#define MacAddr_isBcst(addr) \
-	( \
-	((addr[0] == 0xff) && (addr[1] == 0xff) && \
-	(addr[2] == 0xff) && (addr[3] == 0xff) && \
-	(addr[4] == 0xff) && (addr[5] == 0xff))  ? true : false \
-)
-
 static inline int IS_MCAST(unsigned char *da)
 {
 	if ((*da) & 0x01)
-- 
2.32.0

