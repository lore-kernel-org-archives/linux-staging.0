Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924070
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c18-20020a05600c0ad2b02901cee262e45fso7252850wmr.4
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzFrqHGl0cYS27Ypm4XF1HD4hXM1cpi1KCAV815SAkE=;
        b=CxRhcmv7ahuC+L16zluXOKgTfpfBKiLdVdRxBHZvGVTwsAQatljYQOD/C+fosg+Tai
         mLP5LmucExjPuEd4I6UjIY2OQrM80gvzFK7coI+EHH49QswKZhrz9EiQkuy20CB2sIPZ
         NKcTv0WCXcbpHF6ym7bUg3UxYe4ogUVSo1iyeHEFFfQBbWWsVz0d0G/+L47dgBbgoVul
         sj2HxS+LzQ533oIgMjBfvcPaw9NgmESgjcaXCRfKAMiPSlOx7ANCPPbO5ZCRADR7OEOn
         SAUIc/PlpKUHbdBuEbxLUDr5qnvUAroZoBd5ZiLxFoaURcJeX05LHZHM7nwtPNFm1Dce
         h+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzFrqHGl0cYS27Ypm4XF1HD4hXM1cpi1KCAV815SAkE=;
        b=ZjGjFW0iYB5jnDrpIXfm9G8jsKztZ6R0+l29BVvhOPTdapBAmGtJ6I7ezQ+Ejm874/
         jgt+EPuAHCEQu13E+u+V6UsxpSoNoDaBqHS79BlvojRNvgUlhzTvi/XtIRqY2CmvfOvE
         0eS+yrblE+dDtY4IZ9vO2lj1pOkzSPlzGI/DcFG0+VjbwPypFrEia4fyUFU8EAJsw777
         AqDs931sO+DzT8CR8dS6qG2lN2vRL+z8PCcJBpoXmOnJbsRaxB056r08+51cfOGwmp3+
         1lhY/ySuAlO+1dFfRDb/opTzgzEhyswo5SCFpBU5RlDXo2hO2X1Fr/vgK7hPP5bsekp9
         HfFg==
X-Gm-Message-State: AOAM533QsmDJDqPs2Mc43NzJXykXZMrSvPfUMK0FGl5+Mxuyh8AB+ULV
	IXcCPS3ZNGo4H2I15nkEedk=
X-Google-Smtp-Source: ABdhPJxygZu+ByZT7nW1jMCQR7YyGPBM5Piz3zZ0E0yfqb4jyoiTszMwnniaRixAODm7DF4PyBGVdQ==
X-Received: by 2002:a05:600c:511d:: with SMTP id o29mr16439288wms.0.1624099665054;
        Sat, 19 Jun 2021 03:47:45 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id w8sm10673236wmi.45.2021.06.19.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:44 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/18] staging: rtl8723bs: remove obsolete 5Ghz comments
Date: Sat, 19 Jun 2021 12:47:19 +0200
Message-Id: <b9863335ffee88e00131744ee455165ea7823278.1624099126.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete 5Ghz comments.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 --
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c      | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 8514cfb3d7e0..427f0b88abd7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -202,8 +202,6 @@ rtw_cfg80211_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
 
 static int rtw_ieee80211_channel_to_frequency(int chan, int band)
 {
-	/* see 802.11 17.3.8.3.2 and Annex J
-	* there are overlapping channel numbers in 5GHz and 2GHz bands */
 	if (band == NL80211_BAND_2GHZ) {
 		if (chan == 14)
 			return 2484;
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index 0084589499b9..5eef1d68c6f0 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -44,10 +44,6 @@ static const struct ieee80211_regdomain rtw_regdom_rd = {
 
 static int rtw_ieee80211_channel_to_frequency(int chan, int band)
 {
-	/* see 802.11 17.3.8.3.2 and Annex J
-	 * there are overlapping channel numbers in 5GHz and 2GHz bands
-	 */
-
 	/* NL80211_BAND_2GHZ */
 	if (chan == 14)
 		return 2484;
-- 
2.20.1

