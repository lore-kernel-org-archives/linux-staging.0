Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1F239E9D
	for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272268; cv=none; b=n0zgXrwCgpfklVBPx4Sx5FTGniCGP4gAi26U5XB4jQ7ar8/b+lz3BN4Hl4KemZLW1nuVr1CJRzLJWNk35iBSMe2dcP1KdoV4RFnwt7H+2CwrJ7oOqQfC26Ifwk1F9pCVxlVfZ1BUq1rtET7ZL0xMaDQI39VneTngpnUZh/XuYMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272268; c=relaxed/simple;
	bh=5gcrW0C/6iIcYmamZ1YR+qDyc9+/q61v7UhulYN4UVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dClK1E+9QBZEiaxW88swCjTbOgMtCLK184XhWR+o/mM+WzZzkmh5krkSAY2DSKvVa/pMXvsKxvPmWhks4DFFEfgTARlOR8kOBUsMF/iNvmCoV46CfXFVWjNjiLgSFzSeMA0y/j5315aJOYYSZnmWRrln27FHrV4YpvPaZwDD0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqL3Oro/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqL3Oro/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae35f36da9dso383138866b.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Jun 2025 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272265; x=1751877065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1IkmRFvnV11ov8AHbvaYSjGTtAI8bgVhqxnUQpHeEg=;
        b=AqL3Oro/EjCXqcJN9T53d2G8hJzrZqOQAbQTJ2FmK1siEiBkoLSbL9IeLBjRq6Q7zH
         Hrs4fLy6/pHUMc97vlcGfDybBaQE6mPNMNFRWW1t403gY6u9csGf6gYW/U2NhQ/zvpsD
         A0Lnn0xj8PF2eiYF6OJ+RKaQu/djDj5nEsDlSp1vyyjP91QUYtYycNbt3mwTr6SGH2cr
         LDbmGtfiVzt34JROOzK6xQfOFFhycoPnRSlHRDuwHeYov1ghjLRtu6ZF5/8fuGxp7/z9
         lK/IC/1gkvWBqfbt3mr3d+xehowxcjUWqvvI4hpYKDNy9IzPc1xvN+LOx+LR2VpioRLj
         Uw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272265; x=1751877065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1IkmRFvnV11ov8AHbvaYSjGTtAI8bgVhqxnUQpHeEg=;
        b=qDD6WpfuqwhTiJZBW9e+8GG3fTUb6cFOQck1vEpnIffL117LAAFE5v5w6Q6RgcK8Gc
         SvkF0qoPMfnsQ+TpYunJ6glwWHThn4GuXFazhefW1I632fPTbDOWmv0VKYGuM+S44Ymv
         SZtkcBd/M7XiN9q1hdBSuz0gomBV/n3fHnMzC6Mc5AjEdXHNXQ2aE/GdL7mY2lScIf1r
         bJNFGsQbp272B3k36JtoxttcNcu33WoluJYuPKANIYRjqlBK6IWV67rlBkHADAINq+tm
         iofvBi81ebRSFWr4r7R77ECMxpdaJn97zC7BmGLCYN5esx0gEvUlYmJGrN43jRmy7zfQ
         AZKA==
X-Forwarded-Encrypted: i=1; AJvYcCXRK7rtjxKgJ1afG4ssYJJdZqJ8Vl1wEw7wmz8KGovYfFk90spITmy/E5iNz/9A1Yq8mno8R4Ya++vVyiQf@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1bAo4To+3ukH1kUYbFFaDa1HLQKiuG62tBx22MlXUW1sz5u+M
	XMskTpDDBOyD9AfNuKbRUAFGaASA/0NnPgECuUFyEsmoSgk1SN1E460I
X-Gm-Gg: ASbGncuZP+DqgOfp7pLXKAbp+mkmHkluQOIZ1RpsQmANPGgow5cqBoLAZ+diyo9k2yV
	FVLv+y+ovpiRR0BwJ4n8PvYreHHYANPWPxBJ8OuDGgRqVrIfQqqtNVRfAujJk10RTdDjhTRwgi2
	JRtfsRaBm4YURO8VAF/ZSKXhlP9XGYFEU1imU5NM1IhsuzbrMnomFdsZGatqUrf1V48RwqJGigt
	D8u60gmWhQxamUKXQGPtGPnapCg35Tt3oZZ3Y2IkHOjHVIePPqMwFjOaQgdYjPe73W3mWRQ8K5M
	VN8DVxnOmwNQCF/rHMbXZccWX7BZO+YL3ibowC7SXZc0g/Ga5V5Qyt64zr/oMlXugGv5/rFtbAt
	0qpI=
X-Google-Smtp-Source: AGHT+IGA2r07/9DrczynTDZkbcf5/JuSdSiIkO+prJuWlI2qyoarXRFTY/6FXuka/JGeQdGyNCCyag==
X-Received: by 2002:a17:907:3e04:b0:ad8:ac7e:eead with SMTP id a640c23a62f3a-ae3500f5e01mr1062026166b.39.1751272264709;
        Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove redundant static function
Date: Mon, 30 Jun 2025 10:30:49 +0200
Message-ID: <20250630083049.103734-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630083049.103734-1-straube.linux@gmail.com>
References: <20250630083049.103734-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both wifi_regd.c and ioctl_cfg80211.c define a static function
rtw_ieee80211_channel_to_frequency() with identical functionality.
Remove the function from wifi_regd.c and make it non-static in
ioctl_cfg80211.c to avoid code duplication.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h |  1 +
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  |  2 +-
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c       | 11 -----------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index 993a7b3c3d22..753009b07451 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -94,6 +94,7 @@ void rtw_cfg80211_init_wiphy(struct adapter *padapter);
 
 void rtw_cfg80211_unlink_bss(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter);
+int rtw_ieee80211_channel_to_frequency(int chan);
 struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wlan_network *pnetwork);
 int rtw_cfg80211_check_bss(struct adapter *padapter);
 void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cc1e036d2c4..eddf6da27a20 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -192,7 +192,7 @@ rtw_cfg80211_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
 	},
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan)
+int rtw_ieee80211_channel_to_frequency(int chan)
 {
 	/* NL80211_BAND_2GHZ */
 	if (chan == 14)
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index ac0b58a8b5d3..f9c4d487badf 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -41,17 +41,6 @@ static const struct ieee80211_regdomain rtw_regdom_rd = {
 	}
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan)
-{
-	/* NL80211_BAND_2GHZ */
-	if (chan == 14)
-		return 2484;
-	else if (chan < 14)
-		return 2407 + chan * 5;
-	else
-		return 0;	/* not supported */
-}
-
 static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 {
 	struct adapter *padapter = wiphy_to_adapter(wiphy);
-- 
2.49.0

