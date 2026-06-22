Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90F35E93E
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 06:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782110508; cv=none; b=bqoETD1w9yEnLgvGxM7NMvrEsv8sO5XN1LjZOK5ld/8Bcav2OG5g3dCkAnifOq3TStKw9hl0lftoWE7hCz9vc4da5X149A7zVqinbzmxrPJisIyrvp77Cdw3xcgy7NKXN3x+MdcKsnyIcy+wO4Fv+YcbWmasbMYx2z1XmkJwCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782110508; c=relaxed/simple;
	bh=lspmYaIzUdmokZ16J13Yddr87kMZlXE7Cl6OCyi7NCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DxlLEmIOr6sLBOMU3MyvsnBGnqrLgM/1cU+PXsLz8Y9JLvmQrv3aSASesrU1TDVyIDQT58Bg/Lsi6Ul4oz+jEdtEi+lgU8mrYfEMGN1+tvtW0tcbrXUI7mRrXbGvIplrGLFgkUCTCDvUf35HqN6Ek3SwwENN5LCyCPgJXoZYG8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVWlgQI7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVWlgQI7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b9d265355so2113710a91.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 23:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110506; x=1782715306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6i3APjxqO+iO6+CjA0BhVnND5CFYJ3OP9cuSnAvq/b8=;
        b=DVWlgQI7568f0KjyN5kSORmB6XiGfkAeUFnQvL88CqDjn/QWgZeyYfJ++R6OWwdjkT
         2U2V5NFH5Fz24ydc30tpbr/NAQjCbNF5Wa8R6cV25JONqrnPhyKSQk1tP0zXZ3Gb9Vds
         nSK/Y0w/SvRcnheqtlcGz5tIU2pl/16OzM/n9r6GUmmVeLycOGC3qnn6uwg+bAFW0414
         BBBVlNumfnKY4tMPdChBRWrLV67fRQowlGzIhhDV8G8PyShktjc3gOJnvw4rwqeGPC+s
         VRFEZl3y5lsGES2jS/rOsBTKpRiwZI2Z7gNKcrpLtmtyWYMqdjnqpZFhOkoY51MnOGoF
         mQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110506; x=1782715306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6i3APjxqO+iO6+CjA0BhVnND5CFYJ3OP9cuSnAvq/b8=;
        b=sECQfGOMrs+qhPoRtHHHYGQS/Q83XSM9li58/ZG7tSe+SEyXYjbz9Xjl+ezYL1Bcs4
         IAbG78EgVmqfKV9icj/p5OvFYqATwTj98kFnbREfGnr5wy/cYiTgZsSLPEBqNBo3Qn86
         SC/xdncDgsnp5k8wN3LssxdbsZ7mwLOGeAdeEnn/Q7NbL43FjvhMFqCnAnsjujF35wkB
         qWaVT7f4aItrv4DTBAyp/kJN+n7pEshoNpk3SQ/xqZQyDSw2ungmolQ37zf4AO87lhqS
         9fLswXLqLxEiTZ7ibxRKX9M/KNMiaD1YDG2GCxhR0z8TVUKCq3Gd1orIQE0qrIXK3/h6
         Mvbw==
X-Gm-Message-State: AOJu0YxyvxuJu8ttNn18TWdH0FVDJpRJN4pnbLVDdWHk0gaoYybPZ9wm
	3A7QuUv7zmU3CPjV2PhSJQsnDRFcOe8xZFe4GT85vc01AsQ9Ng7U72ou
X-Gm-Gg: AfdE7ckFOfgtl3C/8PhG54D7LJN71gWVka1IT4tYjIIHvMSTFjMezEJDS61ckX50h+r
	+evlfeb4NlF50FZmibxVgXdGtk7IJm/hH+FuuFdoAfwDtOwQw2X5Vsg36GR/GXTM51CYVE+hcuT
	MMgq2x4+D8izE+SmrrzI/APffBQfAugJsECdQwf0uYozb8/k0nILn50mpUlD2jL+HsitHQpKDee
	mnqHaHOg6fXFt5RS9ZyrsWr0Gi/XBDcnJmFQ+bp2gD5YaI2JwFOD5VdbWzePJOQJ9azbcrEkzXA
	Oq45l52BKp/eHlA5yUNvy8gmM3rzTar00Iz6bIrsNasoPvz2qNQ0/TltFWUGoWQ02nu47kc8j59
	VeJM1u613hYJcQmXvDhfEyvDzXuokMI+o/IUM9oV6K2vJLyhpmYUEAnEYdd/22T6MhGEacYSSx9
	Aahe3IAewISuxl44jlhqwUtUNyc/PWt/iiGY/HEFq+d8ec2ox/x1tKDbUtwW7Nx1w=
X-Received: by 2002:a17:902:f68e:b0:2c2:9a1e:6099 with SMTP id d9443c01a7336-2c718f64b9amr135705295ad.23.1782110506002;
        Sun, 21 Jun 2026 23:41:46 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c799749cb3sm21123865ad.72.2026.06.21.23.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:41:44 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in ioctl_cfg80211.c
Date: Mon, 22 Jun 2026 06:41:27 +0000
Message-Id: <20260622064129.10261-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
References: <20260622064129.10261-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bare use of 'uint' with 'unsigned int' in function parameters
and local variables in ioctl_cfg80211.c and its corresponding header
ioctl_cfg80211.h. This fixes the following checkpatch.pl warning:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |  4 ++--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index bc62b7285950..a1fc18cd247b 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -42,10 +42,10 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter);
 void rtw_cfg80211_indicate_disconnect(struct adapter *padapter);
 void rtw_cfg80211_indicate_scan_done(struct adapter *adapter, bool aborted);
 
-void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame, uint frame_len);
+void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame, unsigned int frame_len);
 void rtw_cfg80211_indicate_sta_disassoc(struct adapter *padapter, unsigned char *da, unsigned short reason);
 
-void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len, const char *msg);
+void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, unsigned int frame_len, const char *msg);
 
 bool rtw_cfg80211_pwr_mgmt(struct adapter *adapter);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336d7551..dfb19a9f3d6b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1152,7 +1152,7 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *buf, int len)
 {
 	int ret = 0;
-	uint wps_ielen = 0;
+	unsigned int wps_ielen = 0;
 	u8 *wps_ie;
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 
@@ -1515,12 +1515,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	{/* handle wps_ie */
-		uint wps_ielen;
+		unsigned int wps_ielen;
 		u8 *wps_ie;
 
 		wps_ie = rtw_get_wps_ie(buf, ielen, NULL, &wps_ielen);
 		if (wps_ie && wps_ielen > 0) {
-			padapter->securitypriv.wps_ie_len = min_t(uint, wps_ielen, MAX_WPS_IE_LEN);
+			padapter->securitypriv.wps_ie_len = min_t(unsigned int, wps_ielen, MAX_WPS_IE_LEN);
 			memcpy(padapter->securitypriv.wps_ie, wps_ie, padapter->securitypriv.wps_ie_len);
 			set_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS);
 		} else {
@@ -1911,7 +1911,7 @@ static int cfg80211_rtw_flush_pmksa(struct wiphy *wiphy,
 	return 0;
 }
 
-void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame, uint frame_len)
+void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame, unsigned int frame_len)
 {
 	struct wireless_dev *wdev = padapter->rtw_wdev;
 
@@ -2247,7 +2247,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 {
 	int ret = 0;
 	u8 *pbuf = NULL;
-	uint len, wps_ielen = 0;
+	unsigned int len, wps_ielen = 0;
 	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
 
 	if (!check_fwstate(pmlmepriv, WIFI_AP_STATE))
@@ -2442,7 +2442,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	return ret;
 }
 
-void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len, const char *msg)
+void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, unsigned int frame_len, const char *msg)
 {
 	s32 freq;
 	int channel;
-- 
2.34.1

